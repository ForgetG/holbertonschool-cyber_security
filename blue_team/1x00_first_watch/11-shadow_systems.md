# Shadow Systems Assessment – MedDefense Health Systems

## Shadow System #1 – Dr. Patel's Personal NAS

### Risk Assessment

#### Sensitive Data

The NAS may contain:

* Clinical research data
* Patient identifiers associated with research
* Medical images
* Physician notes
* Exported EHR datasets
* Credentials or shared files copied from hospital systems

Depending on the research, the data may be classified as:

* **Restricted** (PHI)
* **Confidential** (research data)

---

#### Controls NOT Covering This System

The following official controls do **not** apply:

* C-009 Sophos Endpoint Protection
* C-010 Malware Detection
* C-011 Malware Quarantine
* C-012 Veeam Backup
* C-019 EHR Audit Logging
* C-023 Active Directory Authentication
* C-003/C-025 Central Logging
* C-017 Security Awareness enforcement

The NAS is:

* Not inventoried
* Not monitored
* Not backed up
* Not centrally authenticated

---

#### Worst-Case Scenario

The NAS is compromised through:

* Default credentials
* Vulnerable firmware
* Exposed SMB shares

An attacker steals:

* Research datasets
* Patient identifiers
* Credentials stored on the NAS

The attacker then pivots into:

* EHR
* PACS
* Active Directory

This becomes:

* PHI breach
* HIPAA violation
* Reputational damage
* Hospital-wide compromise

---

### Recommended Response

## Strategy: Migrate

Move the data to:

* `file-srv-01`
* O365 SharePoint
* Approved research storage

Then:

* Export and validate the data.
* Securely erase the NAS.
* Remove it from the network.

---

### Justification

The hospital already provides:

* Central authentication
* Backup capability
* Access control
* Existing governance

A physician-owned storage appliance should not become a second storage ecosystem.

---

### Asset Registry Update

| Asset ID | Name        | Type       | Location           | Owner      | OS / Platform  | Critical Services | Network Segment | Status    | Notes                                      |
| -------- | ----------- | ---------- | ------------------ | ---------- | -------------- | ----------------- | --------------- | --------- | ------------------------------------------ |
| A-034    | DRPATEL-NAS | Data Store | Central Cardiology | Cardiology | Unknown NAS OS | Research Storage  | Unknown         | Shadow IT | Personal NAS connected without IT approval |

---

# Shadow System #2 – Marketing Shared Google Drive

### Risk Assessment

#### Sensitive Data

Contains:

* Press releases
* Marketing campaigns
* Media files
* Vendor contacts
* Possibly contracts
* Potential patient testimonials or photos

Data classification:

* Internal
* Confidential

---

#### Controls NOT Covering This System

Not covered by:

* C-023 Active Directory Authentication
* C-007 Password Policy
* C-008 Account Lockout
* C-012 Backups
* C-018 Security Monitoring
* C-019 Audit Logging
* MFA policy (already weak internally)

The environment depends on:

```text id="xv2nd0"
Someone's personal Gmail account
```

which IT does not control.

---

#### Worst-Case Scenario

If the Gmail account:

* Is phished
* Uses a weak password
* Gets abandoned

then:

* Files are leaked.
* Media content is modified.
* Accounts are lost permanently.
* Public communications may be manipulated.

This could result in:

* Reputational damage
* Legal issues
* Disclosure of confidential documents

---

### Recommended Response

## Strategy: Migrate

Move all content to:

* O365 SharePoint
* Official Teams / OneDrive

Enable:

* AD integration
* MFA
* Audit logging
* Backups

---

### Justification

MedDefense already pays:

```text id="8squdq"
Microsoft O365 E3
```

for the entire organization.

There is no business justification for storing corporate files on a personal account.

---

### Asset Registry Update

| Asset ID | Name                   | Type        | Location | Owner     | OS / Platform | Critical Services | Network Segment | Status    | Notes                            |
| -------- | ---------------------- | ----------- | -------- | --------- | ------------- | ----------------- | --------------- | --------- | -------------------------------- |
| A-035    | Marketing Google Drive | Application | Cloud    | Marketing | Google Drive  | Media Storage     | Cloud           | Shadow IT | Linked to personal Gmail account |

---

# Shadow System #3 – Raspberry Pi Network Monitor

### Risk Assessment

#### Sensitive Data

Potentially contains:

* Network traffic captures
* Device inventories
* Switch credentials
* Monitoring dashboards
* Configuration files
* SSH keys

If Marcus set it up as a monitor:

it may see:

* EHR traffic
* PACS traffic
* Authentication traffic
* Medical device traffic

---

#### Controls NOT Covering This System

Not covered by:

* C-009 Sophos
* C-012 Veeam
* C-019 Audit Logging
* C-023 AD Authentication
* C-003 Firewall monitoring
* Asset inventory controls

Nobody knows:

* Its IP address
* Its credentials
* Its patch level
* Whether it is still active

---

#### Worst-Case Scenario

The Pi is compromised.

An attacker gains:

* Persistent foothold
* Packet capture capability
* Credential theft opportunities
* Internal reconnaissance

Because:

```text id="y87v4l"
The network is flat.
```

The Pi becomes:

* A covert C2 server
* A sniffer
* A lateral movement platform

This could lead to:

* Full Active Directory compromise
* PHI theft
* Ransomware deployment

---

### Recommended Response

## Strategy: Legitimize and Secure

Immediately:

1. Locate the device.

2. Disconnect it temporarily.

3. Image the SD card.

4. Determine:

   * Purpose
   * Owner
   * Data collected
   * Installed software

5. If useful:

   * Rebuild it
   * Patch it
   * Add it to the asset registry
   * Restrict network access
   * Add logging and monitoring

---

### Justification

Unlike the NAS and Google Drive:

* The Pi may provide legitimate security value.
* Marcus may have intended it as a low-cost monitoring solution.
* It could become an official security asset.

---

### Asset Registry Update

| Asset ID | Name          | Type           | Location          | Owner   | OS / Platform   | Critical Services  | Network Segment | Status    | Notes                                   |
| -------- | ------------- | -------------- | ----------------- | ------- | --------------- | ------------------ | --------------- | --------- | --------------------------------------- |
| A-036    | RPI-NETMON-01 | Network Device | Central 2nd Floor | Unknown | Raspberry Pi OS | Network Monitoring | Unknown         | Shadow IT | Installed by previous intern, unmanaged |

---

# Shadow IT Policy Recommendation

MedDefense should establish a **mandatory IT procurement and onboarding policy stating that any device, cloud service or storage platform connected to the network or used for organizational data must be approved, inventoried and managed by IT before use**. The policy should be reinforced with periodic network discovery scans, manager accountability and a simple approval process so employees are not incentivized to bypass official systems. The goal is not only to prohibit Shadow IT, but to make approved alternatives easier and faster to obtain than unauthorized solutions.
