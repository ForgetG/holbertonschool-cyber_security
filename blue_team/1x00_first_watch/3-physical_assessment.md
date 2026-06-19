# Physical Security Assessment – MedDefense Central

## Observation 1: Server Room Access

**Vulnerability:**
The server room uses a generic employee badge shared by all staff, with no camera surveillance and no visitor logging. Physical access to critical infrastructure is therefore poorly restricted and not auditable.

**Threat:**
A malicious insider, disgruntled employee, or unauthorized visitor could enter the server room unnoticed and steal, damage or tamper with servers and network equipment.

**Impact:**

* **Confidentiality:** Theft of disks or servers could expose patient records, HR data and credentials.
* **Integrity:** An attacker could alter configurations, install malware or manipulate data.
* **Availability:** Servers or network devices could be shut down, disconnected or physically damaged, interrupting hospital operations.

**Severity:** **Critical**

*Justification:* This is the organization's central infrastructure and the weakness affects all three CIA pillars simultaneously with little chance of detection.

---

## Observation 2: Network Closet

**Vulnerability:**

* Network closet has no lock.
* Switch management credentials are physically exposed on the wall.
* Credentials appear shared and static.

**Threat:**

An attacker or unauthorized employee could enter the closet, use the credentials to access the switches and:

* Modify VLANs
* Mirror traffic
* Disable ports
* Disconnect devices
* Create unauthorized network access

**Impact:**

* **Confidentiality:** Network traffic may be intercepted or mirrored.
* **Integrity:** Switch configurations may be modified.
* **Availability:** Network segments or departments could lose connectivity.

**Severity:** **Critical**

*Justification:* The attacker receives both physical access and privileged network credentials, giving near-total control over parts of the hospital network.

---

## Observation 3: Nurse Station

**Vulnerability:**

* EHR session left unlocked.
* Patient record visible on screen.
* Organizational culture encourages users to remain logged in between shifts.

**Threat:**

An unauthorized person, visitor or employee could:

* View patient records
* Modify medical information
* Access the EHR under another user's identity

**Impact:**

* **Confidentiality:** Protected Health Information (PHI) may be exposed.
* **Integrity:** Patient records could be modified or falsified.
* **Availability:** Incorrect records could disrupt patient care or require systems to be taken offline for investigation.

**Severity:** **High**

*Justification:* The weakness directly exposes sensitive medical records and violates basic healthcare security practices, although the attack requires physical presence.

---

## Observation 4: Medical IoT

**Vulnerability:**

* Medical device firmware is outdated (last updated 2019).
* Device displays technical information including IP address and firmware version.
* Medical IoT devices share the same network segment as user workstations.

**Threat:**

An attacker compromising a workstation could:

* Discover medical devices easily.
* Exploit known firmware vulnerabilities.
* Move laterally to patient monitors.
* Manipulate device behavior or disrupt monitoring.

**Impact:**

* **Confidentiality:** Medical telemetry and patient data could be exposed.
* **Integrity:** Device measurements or configurations could be altered.
* **Availability:** Vital sign monitoring could become unavailable.
* **Patient Safety:** Incorrect or unavailable readings may directly impact care.

**Severity:** **Critical**

*Justification:* Medical IoT devices affect both cybersecurity and patient safety, and network flatness greatly increases the attack surface.

---

## Observation 5: Emergency Exit

**Vulnerability:**

* Restricted-area fire exit is intentionally propped open.
* Public visitors can bypass physical access controls.
* The open path leads directly toward IT offices and sensitive administrative areas.

**Threat:**

An unauthorized individual could:

* Enter restricted areas unnoticed.
* Steal equipment or documents.
* Access workstations left unlocked.
* Attempt social engineering or impersonation attacks.

**Impact:**

* **Confidentiality:** Sensitive documents, credentials or systems may be exposed.
* **Integrity:** Equipment or data could be modified.
* **Availability:** Critical IT or administrative services may be disrupted through sabotage or theft.

**Severity:** **High**

*Justification:* The vulnerability defeats physical security controls entirely and enables multiple attack paths, though it does not provide immediate access to core infrastructure like the server room.

---

# Risk Summary

| Observation | Primary Vulnerability                         | Main CIA Pillars | Severity |
| ----------- | --------------------------------------------- | ---------------- | -------- |
| 1           | Generic server room access, no monitoring     | C / I / A        | Critical |
| 2           | Unlocked network closet + exposed credentials | C / I / A        | Critical |
| 3           | Unattended EHR session                        | C / I            | High     |
| 4           | Flat network + outdated medical IoT           | C / I / A        | Critical |
| 5           | Restricted area accessible from public space  | C / I / A        | High     |

## Overall Assessment

The most serious finding is not a single observation but a pattern:

* Weak physical access controls
* Shared credentials and poor credential management
* Flat network architecture
* Lack of segmentation between medical devices and user workstations
* Security practices sacrificed for convenience

These observations suggest systemic security weaknesses rather than isolated issues, particularly around access control and defense-in-depth.
