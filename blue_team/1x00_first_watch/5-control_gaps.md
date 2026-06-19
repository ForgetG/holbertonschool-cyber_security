# Control Gaps Analysis – MedDefense Health Systems

## G-001

**Gap Description:**
No centralized log management, SIEM or automated alerting exists. Logs are stored locally and reviewed manually, usually only after a problem occurs.

**Category × Function Missing:**
Technical Detective

**Affected Asset(s) or Zone:**

* Active Directory
* Linux servers
* Windows servers
* FortiGate firewall
* Web server
* Billing server
* EHR infrastructure

**Risk if Unaddressed:**

* Attackers may remain undetected for weeks or months.
* Malware, ransomware or lateral movement could spread unnoticed.
* Impacts:

  * **Confidentiality:** data theft not detected
  * **Integrity:** malicious changes unnoticed
  * **Availability:** attacks discovered only after disruption

**Evidence:**

* No centralized log management.
* No automated alerting.
* Marcus researched Wazuh but never deployed it.

---

## G-002

**Gap Description:**

Linux and Windows servers do not have endpoint protection.

**Category × Function Missing:**

Technical Preventive

**Affected Asset(s) or Zone:**

* billing-srv-01
* ehr-srv-01
* ehr-db-01
* ad-dc-01
* ad-dc-02
* web-srv-01
* file-srv-01

**Risk if Unaddressed:**

* Malware or ransomware may execute freely.
* Crypto-miners and remote access trojans may remain active.
* Impacts:

  * **Integrity:** malicious software installation
  * **Availability:** ransomware and resource exhaustion
  * **Confidentiality:** credential or database theft

**Evidence:**

Sophos report:

> "Windows servers: NOT covered"

> "Linux servers: NOT covered"

This gap already materialized on `billing-srv-01`.

---

## G-003

**Gap Description:**

No offsite or cloud backup exists. All backups are stored on a NAS located in the same room and network as the production servers.

**Category × Function Missing:**

Technical Corrective

**Affected Asset(s) or Zone:**

* Entire Central Hospital infrastructure
* EHR
* Billing
* Active Directory
* File shares

**Risk if Unaddressed:**

A ransomware attack, flood or fire may destroy both production and backups simultaneously.

Impacts:

* **Availability:** no recovery capability
* **Integrity:** backup copies may be encrypted or corrupted
* **Confidentiality:** backup data could also be stolen

**Evidence:**

* NAS in same rack row.
* No cloud replication.
* AWS S3 backup proposal denied.

---

## G-004

**Gap Description:**

No Incident Response Plan exists.

**Category × Function Missing:**

Administrative Corrective

**Affected Asset(s) or Zone:**

Entire organization.

**Risk if Unaddressed:**

Security incidents will be handled inconsistently and slowly.

Impacts:

* **Availability:** prolonged outages
* **Integrity:** compromised systems remain online
* **Confidentiality:** data exfiltration may continue unchecked

**Evidence:**

Marcus's notes:

> "No formal incident response plan exists."

January ransomware response:

> "James, Sarah and I basically improvised for 4 days."

---

## G-005

**Gap Description:**

No Business Continuity Plan or Disaster Recovery Plan exists.

**Category × Function Missing:**

Administrative Corrective

**Affected Asset(s) or Zone:**

* Hospital clinical operations
* EHR
* Radiology
* Pharmacy
* Billing

**Risk if Unaddressed:**

Extended outages may stop patient care and business operations.

Impacts:

* **Availability:** inability to deliver healthcare services
* **Integrity:** emergency procedures may cause errors
* **Confidentiality:** improvised workflows increase exposure risk

**Evidence:**

Marcus:

> "No business continuity plan."

> "No disaster recovery plan."

---

## G-006

**Gap Description:**

Medical IoT devices share the same network as servers and user workstations.

**Category × Function Missing:**

Technical Compensating

**Affected Asset(s) or Zone:**

* Philips IntelliVue monitors
* BD Alaris infusion pumps
* MRI
* CT scanner
* Entire 10.10.0.0/16 network

**Risk if Unaddressed:**

Compromise of a workstation may allow attackers to pivot to medical devices.

Impacts:

* **Confidentiality:** patient monitoring data exposed
* **Integrity:** device configuration or readings altered
* **Availability:** monitoring systems disrupted
* **Patient Safety:** potentially life-threatening consequences

**Evidence:**

Marcus:

> "Flat network at Central."

and

> "The Philips monitors are on the same network as everything else."

---

## G-007

**Gap Description:**

No MFA is required for users or administrators.

**Category × Function Missing:**

Technical Preventive

**Affected Asset(s) or Zone:**

* Active Directory
* VPN access
* O365
* Administrative accounts

**Risk if Unaddressed:**

Stolen passwords may immediately lead to unauthorized access.

Impacts:

* **Confidentiality:** account takeover
* **Integrity:** unauthorized modifications
* **Availability:** attackers may deploy ransomware

**Evidence:**

Password policy:

> "MFA is recommended for remote access but is not currently required."

Marcus:

> "No MFA anywhere except James's personal account."

---

## G-008

**Gap Description:**

Critical infrastructure areas are not monitored by cameras.

**Category × Function Missing:**

Physical Detective

**Affected Asset(s) or Zone:**

* Server room
* Network closets
* Administrative wing
* IT department

**Risk if Unaddressed:**

Physical intrusion may go unnoticed and uninvestigated.

Impacts:

* **Confidentiality:** equipment theft
* **Integrity:** hardware tampering
* **Availability:** sabotage or power disruption

**Evidence:**

Camera inventory:

> "No cameras in server room area, network closets or administrative wing."

---

# Overall Pattern

MedDefense is **strongly prevention-oriented**. The organization has passwords, a firewall, antivirus on workstations, guards and some physical barriers, but very limited detection and corrective capabilities.

This means that if an attacker bypasses the preventive controls, MedDefense is unlikely to detect the intrusion quickly and may struggle to respond effectively. The crypto-miner on `billing-srv-01` and the January ransomware incident illustrate this pattern: compromises are discovered only after they start impacting operations, not when the intrusion first occurs.
