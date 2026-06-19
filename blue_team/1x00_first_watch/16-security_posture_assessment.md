# MEDDEFENSE HEALTH SYSTEMS

# Security Posture Assessment

**Prepared for:** James Chen, Director of IT & Security
**Prepared by:** Security Analyst
**Date:** Current Assessment
**Classification:** Confidential

---

# 1. Executive Summary

## Overall Security Posture

MedDefense Health Systems currently operates with a **moderate-to-high cybersecurity risk posture**. The organization possesses several foundational security controls, including perimeter firewalls, password policies, endpoint protection for workstations and backup capabilities. However, these controls are fragmented and insufficiently integrated, leaving critical clinical systems exposed to modern healthcare attack techniques.

The assessment identified several structural weaknesses that significantly increase organizational risk, including flat network architecture, lack of centralized monitoring, absence of multi-factor authentication and inadequate protection of legacy medical devices. These weaknesses are amplified by the interconnected nature of healthcare environments, where compromise of a single system may rapidly affect patient care, regulatory compliance and business operations.

### Single Most Critical Finding

**The MedDefense internal network lacks effective segmentation.**

Clinical workstations, servers, medical devices and administrative systems are able to communicate with one another with minimal restrictions.

As a result:

* A compromised workstation may reach the EHR.
* A compromised MRI workstation may reach the PACS.
* A compromised medical device may reach Active Directory.

This architectural weakness amplifies nearly every other vulnerability discovered during the assessment.

---

## Top 3 Recommended Actions

### 1. Implement Network Segmentation

Separate:

* Servers
* Clinical workstations
* Administrative workstations
* Medical devices
* Guest devices

using VLANs and internal firewall rules.

---

### 2. Deploy Centralized Security Monitoring

Implement:

* Wazuh SIEM
* Centralized log collection
* Automated alerting

to detect attacks before they impact operations.

---

### 3. Deploy Multi-Factor Authentication (MFA)

Enable MFA for:

* VPN
* Active Directory administrators
* O365
* EHR access where supported

---

## Budget Implication

The recommended first-year roadmap can be implemented for approximately **$100,000**, remaining within the approved annual security budget of **$120,000** while addressing the organization's most significant risks.

---

# 2. Scope and Methodology

## Scope

This assessment covered:

### Sites

* MedDefense Central
* Westside Clinic
* Corporate HQ

---

### Systems

Assessment included:

* Active Directory
* EHR infrastructure
* PACS / Imaging systems
* Billing systems
* Medical IoT devices
* Network infrastructure
* Endpoints
* Backup infrastructure
* Physical security systems
* Cloud services (O365)

---

### Data

The following data categories were evaluated:

* Patient medical records
* Imaging studies
* Billing and insurance data
* Employee HR records
* Credentials
* Audit logs
* Backup data

---

## Sources of Information

Assessment based on:

* Onboarding documentation
* Asset inventory
* Network scan results
* Incident history
* Physical walkthrough
* Firewall configuration
* Backup configuration
* Antivirus reports
* Security policies
* Marcus Webb draft assessment
* Healthcare breach intelligence

---

## Limitations

* Limited visibility into vendor-managed systems.
* No source code review of the patient portal.
* No penetration testing performed.
* Some systems remain undocumented.

---

# 3. Asset Landscape

## Asset Inventory Summary

### Total Assets Identified

**36 assets**

---

### By Type

| Type                    | Count |
| ----------------------- | ----: |
| Server                  |    12 |
| Endpoint                |     6 |
| Network Device          |     7 |
| IoT Medical             |     5 |
| Data Store              |     3 |
| Application             |     2 |
| Physical Infrastructure |     1 |

---

### By Site

| Site     | Approximate Assets |
| -------- | -----------------: |
| Central  |                 27 |
| Westside |                  4 |
| HQ       |                  3 |
| Cloud    |                  2 |

---

## Top 5 Critical Assets

### 1. EHR System

Stores protected health information and supports clinical decision-making.

Loss of:

* Integrity → Incorrect patient care
* Availability → Clinical disruption
* Confidentiality → Regulatory penalties

---

### 2. Active Directory

Central authentication authority.

Compromise enables:

* Credential theft
* Privilege escalation
* Hospital-wide lateral movement

---

### 3. Medical IoT Devices

Includes:

* MRI
* Infusion pumps
* Patient monitors

Compromise may directly affect patient safety.

---

### 4. Network Core

The FortiGate firewall and switching infrastructure are shared dependencies for all sites and services.

---

### 5. Backup Infrastructure

Recovery depends entirely on backup availability.

Current architecture creates a significant single point of failure.

---

## Data Classification Summary

| Classification | Examples                               |
| -------------- | -------------------------------------- |
| Restricted     | PHI, medical records, imaging, billing |
| Confidential   | HR files, contracts, salaries          |
| Internal       | Policies, procedures, logs             |
| Public         | Website content                        |

---

# 4. Current Security Controls

## Control Inventory

### Total Controls

**35 controls**

---

### By Category

| Category       | Count |
| -------------- | ----: |
| Technical      |    22 |
| Administrative |     8 |
| Physical       |     5 |

---

### By Function

| Function     | Count |
| ------------ | ----: |
| Preventive   |    19 |
| Detective    |     8 |
| Corrective   |     6 |
| Compensating |     3 |
| Deterrent    |     1 |

---

## Overall Maturity Assessment

### Strong Areas

* Perimeter firewall
* Password policy
* Active Directory
* Endpoint protection on workstations
* Backup capability
* Public website restoration

---

### Weak Areas

* Internal segmentation
* Monitoring and detection
* Identity lifecycle management
* MFA
* Medical IoT security
* Incident response
* Disaster recovery

---

## Control Effectiveness

### Strong

* SSH hardening on EHR
* MRI compensating controls (proposed)
* Password complexity

---

### Adequate

* Firewall
* Endpoint protection
* AD authentication

---

### Weak

* Logging
* Backup isolation
* Physical access controls
* Security awareness
* Shared credentials

---

# 5. Gap Analysis

## Critical Gaps

### GAP-001

**Flat Network Architecture**

Affected:

* EHR
* Active Directory
* Medical IoT
* Network Core

Impact:

* Hospital-wide ransomware
* Lateral movement
* EHR compromise

Treatment:

* Network segmentation

---

### GAP-002

**No MFA**

Affected:

* AD
* VPN
* O365
* EHR

Impact:

* Credential theft
* Unauthorized access

Treatment:

* MFA deployment

---

### GAP-003

**No Centralized Monitoring**

Affected:

* Entire infrastructure

Impact:

* Long attacker dwell time
* Delayed incident detection

Treatment:

* Wazuh SIEM
* Log centralization

---

### GAP-004

**Backup Infrastructure Shares Production Risk**

Affected:

* Backup systems

Impact:

* Ransomware destroys production and backups simultaneously

Treatment:

* Immutable offsite backups

---

### GAP-005

**Legacy MRI Running Windows XP**

Affected:

* MRI
* PACS

Impact:

* Patient safety
* Clinical disruption

Treatment:

* Network isolation

---

### GAP-011

**No Formal Patch Management**

Affected:

* VPN
* Firewall
* Web server
* Legacy systems

Impact:

* Exploitation of known vulnerabilities

Treatment:

* Formal patch lifecycle

---

### GAP-012

**No Identity Lifecycle Management**

Affected:

* AD
* VPN
* EHR

Impact:

* Former employee access
* Dormant privileged accounts

Treatment:

* HR-integrated offboarding

---

## High Risk Gaps

* Weak physical security
* Shadow IT
* Unlocked EHR sessions
* No DLP
* Unrestricted USB storage
* Westside infrastructure weaknesses

---

## Gap Distribution

| Risk Level | Count |
| ---------- | ----: |
| Critical   |    10 |
| High       |     6 |
| Medium     |     1 |
| Low        |     1 |

---

## Most Exposed Areas

1. EHR
2. Active Directory
3. Network Core
4. Medical IoT
5. Backup Infrastructure

---

# 6. Risk Treatment Recommendations

| Recommendation                | Cost |   Timeline |
| ----------------------------- | ---: | ---------: |
| Network Segmentation          | $35K | 3–6 months |
| MFA Deployment                |  $7K |   <1 month |
| Wazuh SIEM                    | $25K | 1–2 months |
| Backup Isolation              | $20K | 1–3 months |
| MRI Isolation                 |  $5K |   <1 month |
| Patch Management Program      |  $1K |    <1 week |
| Identity Lifecycle Management |  $7K |   <1 month |

---

## Budget Allocation

| Item                 |    Cost |
| -------------------- | ------: |
| Network Segmentation | $35,000 |
| MFA                  |  $7,000 |
| Wazuh SIEM           | $25,000 |
| Backup Isolation     | $20,000 |
| MRI Controls         |  $5,000 |
| Patch Management     |  $1,000 |
| Identity Lifecycle   |  $7,000 |

### Total

**$100,000**

### Remaining Budget

**$20,000**

Reserved for:

* External penetration testing
* Incident response exercises
* Security awareness improvements

---

## Quick Wins (< 1 Week)

* Formal patch management process
* Disable shared credentials
* Restrict USB storage
* Review VPN ACLs
* Begin MFA rollout

---

## Short-Term Priorities (< 1 Month)

* MFA deployment
* MRI network isolation
* Identity lifecycle automation
* Initial Wazuh deployment

---

## Long-Term Roadmap (> 1 Month)

* Network segmentation
* Immutable backup architecture
* DLP deployment
* Medical IoT modernization
* Threat intelligence program

---

# 7. Conclusion and Next Steps

MedDefense possesses the building blocks of a security program but lacks the architectural controls, visibility and governance required to defend a modern healthcare environment. The organization's greatest risks are not isolated vulnerabilities but systemic weaknesses that allow small incidents to escalate into hospital-wide crises.

If the recommendations in this report are not implemented, MedDefense should expect:

* Increased likelihood of ransomware
* Extended outages affecting patient care
* Regulatory investigations
* PHI breaches
* Significant financial and reputational damage

The next phase of the security program should be an **External Threat Landscape Assessment**, continuing the work started by Marcus Webb. The internal assessment has identified what is vulnerable; the external assessment will identify who is most likely to exploit those vulnerabilities, how they operate and which attack paths should be prioritized for defense. This includes threat actor profiling, MITRE ATT&CK mapping, STRIDE threat modeling and healthcare-specific threat intelligence analysis.

**Final Assessment:**

MedDefense is not currently in crisis, but it is operating with structural security weaknesses that have already contributed to incidents and closely resemble the conditions observed in recent healthcare breaches. The recommended investments are achievable within budget and would substantially improve resilience, patient safety and operational continuity.
