# Prioritized Gap Analysis – MedDefense Health Systems

## GAP-001

**Title:** Flat Network Architecture Enables Lateral Movement

**Affected Asset(s):**

* Network Core (**Critical**)
* EHR System (**Critical**)
* Active Directory (**Critical**)
* Medical IoT (**Critical**)

**Data at Risk:**

* Patient Medical Records (**Restricted**)
* Credentials (**Restricted**)
* Medical Imaging (**Restricted**)

**Current Control Status:**

* FortiGate firewall (C-001)
* Basic switching infrastructure
* No effective internal segmentation

**What is Missing:**

* Technical Compensating
* Technical Preventive

(Network segmentation, VLAN isolation, east-west firewalling)

**Risk Level:** **Critical**

**Risk Justification:**

A compromise of any workstation, server or medical device can spread throughout the hospital. Multiple Critical assets and Restricted data categories share the same trust boundary.

**Potential Impact:**

Hospital-wide ransomware, AD compromise, PACS compromise, EHR outage and patient care disruption.

---

## GAP-002

**Title:** No MFA for Critical Systems

**Affected Asset(s):**

* Active Directory (**Critical**)
* EHR (**Critical**)
* O365 (**High**)

**Data at Risk:**

* Patient Records (**Restricted**)
* Credentials (**Restricted**)
* HR Data (**Confidential**)

**Current Control Status:**

* Password policy (C-007)
* Account lockout (C-008)

**What is Missing:**

* Technical Preventive

(MFA, conditional access)

**Risk Level:** **Critical**

**Risk Justification:**

Passwords are the single authentication factor protecting the organization's most critical assets.

**Potential Impact:**

Credential theft leads to unauthorized access, privilege escalation and ransomware deployment.

---

## GAP-003

**Title:** No Centralized Security Monitoring

**Affected Asset(s):**

* Entire Infrastructure
* AD (**Critical**)
* EHR (**Critical**)
* Billing (**High**)

**Data at Risk:**

* All Restricted and Confidential data.

**Current Control Status:**

* Firewall logs
* SSH logs
* Local event logs
* EHR vendor logs

**What is Missing:**

* Technical Detective

(SIEM, log aggregation, alerting)

**Risk Level:** **Critical**

**Risk Justification:**

The billing crypto-miner remained active for weeks because there was no centralized monitoring.

**Potential Impact:**

Attackers remain undetected until business disruption or data theft occurs.

---

## GAP-004

**Title:** Backup Infrastructure Shares Production Risk

**Affected Asset(s):**

* Backup Infrastructure (**Critical**)

**Data at Risk:**

* EHR (**Restricted**)
* Billing (**Restricted**)
* AD Credentials (**Restricted**)

**Current Control Status:**

* Veeam backups (C-012)
* NAS storage (C-013)

**What is Missing:**

* Technical Corrective
* Administrative Corrective

(Offsite backup, immutable backup, DR testing)

**Risk Level:** **Critical**

**Risk Justification:**

Backups are stored in the same room and network as production systems.

**Potential Impact:**

Ransomware or fire destroys production and backups simultaneously.

---

## GAP-005

**Title:** Legacy MRI Runs Unsupported Windows XP

**Affected Asset(s):**

* MRI System (**Critical**)
* PACS (**Critical**)

**Data at Risk:**

* Imaging Data (**Restricted**)

**Current Control Status:**

* Proposed compensating controls only (C-029 to C-033)

**What is Missing:**

* Technical Compensating (implemented)
* Technical Detective

**Risk Level:** **Critical**

**Risk Justification:**

Unsupported OS connected to production network with patient safety implications.

**Potential Impact:**

MRI compromise, PACS infection, radiology outage, patient care delays.

---

## GAP-006

**Title:** Servers Lack Endpoint Protection

**Affected Asset(s):**

* billing-srv-01 (**High**)
* EHR (**Critical**)
* AD (**Critical**)
* Web Server (**High**)

**Data at Risk:**

* Patient Records (**Restricted**)
* Billing Data (**Restricted**)

**Current Control Status:**

* Sophos on workstations only

**What is Missing:**

* Technical Preventive
* Technical Detective

(Server EDR / AV)

**Risk Level:** **Critical**

**Risk Justification:**

The billing server was compromised twice by different malware families.

**Potential Impact:**

Malware persistence, ransomware and data exfiltration.

---

## GAP-007

**Title:** Weak Physical Security Around Critical Infrastructure

**Affected Asset(s):**

* Server Room (**Critical**)
* Network Closets (**Critical**)

**Data at Risk:**

* Credentials (**Restricted**)
* All server-hosted data

**Current Control Status:**

* Badge system
* Limited CCTV
* Main entrance guard

**What is Missing:**

* Physical Detective
* Physical Preventive

(Server room cameras, restricted badges, visitor logging)

**Risk Level:** **High**

**Risk Justification:**

Unauthorized physical access bypasses many technical controls.

**Potential Impact:**

Equipment theft, sabotage, rogue devices or malware introduction.

---

## GAP-008

**Title:** Shadow IT Stores Sensitive Data Outside Governance

**Affected Asset(s):**

* DRPATEL-NAS (**Shadow IT**)
* Marketing Google Drive (**Shadow IT**)
* RPI-NETMON-01 (**Shadow IT**)

**Data at Risk:**

* PHI (**Restricted**)
* Research Data (**Confidential**)
* Marketing Documents (**Confidential**)

**Current Control Status:**

* None

**What is Missing:**

* All categories

(Preventive, Detective, Corrective)

**Risk Level:** **Critical**

**Risk Justification:**

Sensitive data is stored on systems outside IT visibility.

**Potential Impact:**

Undetected breaches, data leakage, regulatory violations.

---

## GAP-009

**Title:** EHR Sessions Left Unlocked

**Affected Asset(s):**

* Clinical Endpoints (**Critical**)
* EHR (**Critical**)

**Data at Risk:**

* Patient Records (**Restricted**)

**Current Control Status:**

* AD authentication
* Password policy

**What is Missing:**

* Administrative Preventive
* Technical Preventive

(Screen lock policy, idle timeout)

**Risk Level:** **High**

**Risk Justification:**

Patient records were visibly exposed at a nurse station.

**Potential Impact:**

Unauthorized viewing or modification of PHI.

---

## GAP-010

**Title:** No Incident Response or Disaster Recovery Plan

**Affected Asset(s):**

* Entire Organization

**Data at Risk:**

* All Restricted and Confidential data.

**Current Control Status:**

* Informal paper procedures

**What is Missing:**

* Administrative Corrective

(IRP, BCP, DRP)

**Risk Level:** **Critical**

**Risk Justification:**

The January ransomware incident was handled ad hoc for four days.

**Potential Impact:**

Longer outages, poor decisions, failed recovery and increased business impact.

---

# Gap Distribution Summary

| Risk Level | Number of Gaps |
| ---------- | -------------: |
| Critical   |          **7** |
| High       |          **2** |
| Medium     |          **0** |
| Low        |          **0** |

---

## Asset Categories With the Most Gaps

| Asset Category        |       Number of Gaps |
| --------------------- | -------------------: |
| EHR System            |                    4 |
| Active Directory      |                    3 |
| Network Core          |                    3 |
| Medical IoT           |                    2 |
| Backup Infrastructure |                    2 |
| Shadow IT             | 1 (multiple systems) |

---

## Gap Concentration by Control Category / Function

### Technical Detective

This is the weakest area.

Missing:

* SIEM
* Central log management
* Endpoint detection
* MRI monitoring
* AD monitoring

Result:

> MedDefense often discovers incidents only after operations are impacted.

---

### Technical Compensating

Major gaps exist around:

* Legacy MRI
* Medical IoT
* Flat network

The organization relies on vulnerable systems without isolation or containment.

---

### Administrative Corrective

Missing:

* Incident Response Plan
* Disaster Recovery Plan
* Business Continuity Plan

This means:

> Even when MedDefense detects an incident, it lacks a formal framework to respond consistently and recover efficiently.

---

# Executive Summary

The analysis reveals that MedDefense is **heavily prevention-oriented but severely underinvested in detection, containment and recovery**. The most serious risks arise from the combination of **Critical clinical assets**, **Restricted healthcare data**, **flat network architecture** and **limited detective controls**. A successful intrusion is unlikely to be detected early and may rapidly escalate into an organization-wide incident affecting patient safety, regulatory compliance and business continuity.
