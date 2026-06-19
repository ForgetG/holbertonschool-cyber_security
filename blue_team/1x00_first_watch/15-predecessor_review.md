# Predecessor Review – Marcus Webb Draft Assessment

# Part 1 – Comparative Analysis

| Finding                      | Marcus's Assessment                                      | Your Assessment                                             | Agree / Disagree | Resolution                                                                          |
| ---------------------------- | -------------------------------------------------------- | ----------------------------------------------------------- | ---------------- | ----------------------------------------------------------------------------------- |
| M-01 Network Segmentation    | Flat network is the single most dangerous issue          | GAP-001: Flat Network Architecture Enables Lateral Movement | Agree            | Same conclusion. Network segmentation remains the #1 priority.                      |
| M-02 Backup Isolation        | NAS and production share same room/network               | GAP-004: Backup Infrastructure Shares Production Risk       | Agree            | Same architecture flaw and same recommendation: immutable offsite backups.          |
| M-03 Medical IoT Exposure    | Medical devices on flat network with default credentials | GAP-005: Legacy MRI + Medical IoT exposure                  | Agree            | Patient safety implications justify Critical rating.                                |
| M-04 No Monitoring           | No SIEM, IDS, log centralization                         | GAP-003: No Centralized Security Monitoring                 | Agree            | Healthcare breach review strengthened this finding to highest operational priority. |
| M-05 No MFA                  | Username/password only everywhere                        | GAP-002: No MFA                                             | Agree            | Same finding and same mitigation strategy.                                          |
| M-06 Westside Security       | Consumer router, weak physical security                  | Partially covered by GAP-001 and Asset Registry             | Partially Agree  | Marcus is more specific; Westside deserves its own gap.                             |
| M-07 Shared PACS Credentials | Shared "raduser/radiology1" account                      | GAP-013: Default and Shared Credentials                     | Agree            | Shared credentials are a systemic issue, not Radiology only.                        |
| M-08 EOL Print Server        | Windows Server 2012 R2 unsupported                       | Asset A-008 marked Deprecated                               | Agree            | Risk remains Low because the asset is low criticality.                              |

---

# Findings Marcus Identified That Were Missed

## GAP-014

### Title

No Data Loss Prevention (DLP)

### Affected Assets

* EHR (**Critical**)
* PACS (**Critical**)
* Billing (**High**)
* O365 (**High**)

### Data at Risk

* Patient Records (**Restricted**)
* Imaging Data (**Restricted**)
* Financial Data (**Restricted**)

### Current Control Status

* No DLP
* No email filtering
* No USB restrictions
* No cloud upload monitoring

### What is Missing

**Technical Preventive**

**Technical Detective**

Including:

* DLP policies
* USB device control
* Email attachment inspection
* Cloud upload monitoring

### Risk Level

**High**

### Potential Impact

Large-scale PHI exfiltration without detection.

---

## GAP-015

### Title

USB Storage Completely Unrestricted

### Affected Assets

* Clinical Endpoints (**Critical**)
* Administrative Endpoints (**High**)

### Data at Risk

* PHI (**Restricted**)
* HR Data (**Confidential**)

### Current Control Status

None.

### What is Missing

**Technical Preventive**

GPO-based:

* USB storage blocking
* Device whitelisting
* Endpoint DLP

### Risk Level

**High**

### Potential Impact

Employees or malware can copy sensitive data to removable media without detection.

---

## GAP-016

### Title

No Formal Change Management Process

### Affected Assets

* Entire Infrastructure

### Data at Risk

* All Restricted and Confidential data.

### Current Control Status

Ad hoc changes only.

### What is Missing

**Administrative Preventive**

Including:

* Change Requests (RFC)
* Approval workflow
* Rollback plans
* Testing requirements

### Risk Level

**Medium**

### Potential Impact

Configuration errors cause:

* Backup failures
* Outages
* Security misconfigurations

The broken cron job that caused a 3-week backup gap is evidence.

---

## GAP-017

### Title

Weak Security at Westside Clinic

### Affected Assets

* Westside Router (**High**)
* ws-srv-01 (**High**)
* VPN Connectivity (**Critical dependency**)

### Data at Risk

* EHR Records (**Restricted**)
* Billing Data (**Restricted**)

### Current Control Status

* Consumer router
* VPN
* Minimal physical security

### What is Missing

**Technical Preventive**

**Physical Preventive**

Including:

* Enterprise firewall
* Managed switching
* Locked server closet
* Restricted VPN ACLs

### Risk Level

**High**

### Potential Impact

Westside becomes an easy entry point into Central.

---

# Findings You Identified That Marcus Missed

| Your Finding                                          | Possible Reason Marcus Missed It                 |
| ----------------------------------------------------- | ------------------------------------------------ |
| GAP-012 Identity Lifecycle Management                 | Limited HR access or time constraints            |
| Shadow IT inventory (NAS, Google Drive, Raspberry Pi) | These systems may not have been discovered yet   |
| GAP-009 Unlocked EHR Sessions                         | Physical walkthrough may not have been completed |
| Detailed Data Map                                     | Marcus stopped before data lifecycle analysis    |
| Formal Criticality Matrix                             | Draft ended before business risk analysis        |

---

# Why Marcus May Have Missed These Findings

Several clues suggest Marcus was:

1. Working alone.
2. Under significant time pressure.
3. Already pivoting toward threat intelligence.

His notes repeatedly contain:

> "I ran out of time."

and:

> "Need to escalate."

The assessment was technically strong but operationally incomplete.

---

# Part 2 – The Last Page

Marcus's unfinished work naturally extends the assessment rather than contradicting it.

The internal posture assessment demonstrates that MedDefense's greatest weaknesses are not isolated vulnerabilities but structural issues: flat networking, weak identity controls, limited monitoring and vulnerable legacy systems. These weaknesses align closely with the tactics used by modern healthcare threat actors, especially ransomware-as-a-service groups that rely on valid accounts, public-facing vulnerabilities and lateral movement. Understanding the external threat landscape is therefore the logical next step because it answers a different question: not **"What is weak?"** but **"Who is most likely to exploit those weaknesses, and how?"**

The combination of:

* GAP-001 Flat Network
* GAP-002 No MFA
* GAP-003 No Monitoring
* GAP-011 Weak Patch Management

maps almost directly to common healthcare attack chains described by:

* MITRE ATT&CK Healthcare
* CISA Healthcare Advisories
* HHS 405(d)
* HC3 Threat Briefs

Marcus was correct:

> Internal posture is only half the equation.

The next phase should be a **Threat Landscape Report** including:

1. Threat actor profiling
2. MITRE ATT&CK mapping
3. STRIDE threat modeling
4. Ransomware scenario simulations
5. Purple team exercises against the highest-risk attack paths.
