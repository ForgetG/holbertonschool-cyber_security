# Criticality Assessment – MedDefense Health Systems

## Asset Criticality Matrix

| Asset Category                                                          | Confidentiality | Integrity | Availability | Overall Criticality | Justification                                                                                                                                                                                                                                                                                                                          |
| ----------------------------------------------------------------------- | --------------- | --------- | ------------ | ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **EHR System** (ehr-srv-01, ehr-db-01)                                  | Critical        | Critical  | Critical     | **Critical**        | The EHR contains protected health information (PHI) for the entire patient population and supports diagnosis, treatment and medication orders. Loss of integrity could lead to incorrect clinical decisions, while loss of availability forces physicians to revert to paper records, as already experienced during the 9-hour outage. |
| **PACS / Imaging Infrastructure** (pacs-srv-01, MRI, CT, X-Ray)         | High            | Critical  | Critical     | **Critical**        | Imaging studies are essential for diagnosis and treatment planning. Incorrect images or unavailable imaging systems delay care and may require patient transfer. The MRI alone processes ~45 studies per day, making downtime operationally significant.                                                                               |
| **Medical IoT Devices** (Philips monitors, BD Alaris pumps, Nurse Call) | High            | Critical  | Critical     | **Critical**        | Compromise may directly affect patient safety. Incorrect monitor readings, infusion pump tampering or unavailable nurse call systems can delay or alter clinical interventions and create immediate risk to patients.                                                                                                                  |
| **Active Directory & Identity Services** (ad-dc-01/02)                  | Critical        | Critical  | Critical     | **Critical**        | AD controls authentication across the organization. Compromise enables privilege escalation, account takeover and broad access to clinical and administrative systems. Outage affects nearly all users and services.                                                                                                                   |
| **Billing Infrastructure** (billing-srv-01)                             | High            | High      | High         | **High**            | Billing does not directly affect patient safety, but outages delay insurance claims and revenue. The January ransomware incident caused four days of disruption, demonstrating substantial operational and financial impact.                                                                                                           |
| **Network Core** (FortiGate, Cisco Core, Access Switches)               | High            | Critical  | Critical     | **Critical**        | The network core is a shared dependency for all clinical and administrative services. Misconfiguration or compromise can expose data, enable lateral movement or disconnect entire sites from critical systems.                                                                                                                        |
| **Clinical Endpoints** (Nurse stations, Radiology, Thin Clients)        | Critical        | High      | High         | **Critical**        | These systems access patient records and are used during care delivery. Exposure of PHI triggers regulatory obligations, while downtime slows or interrupts clinical workflows.                                                                                                                                                        |
| **Administrative Endpoints** (HQ PCs, Finance, HR)                      | High            | Medium    | Medium       | **High**            | These systems contain HR and financial information and are common entry points for phishing and malware. Compromise impacts operations and confidentiality but usually does not directly threaten patient safety.                                                                                                                      |
| **Backup & Recovery Infrastructure** (backup-srv-01, NAS-01)            | High            | Critical  | Critical     | **Critical**        | Backups are the organization's last line of defense. Their current design—same room, same network—creates a single point of failure. Loss of backup integrity or availability may make ransomware recovery impossible.                                                                                                                 |
| **Physical Security Systems** (Badge system, CCTV, Guard services)      | Medium          | High      | Medium       | **High**            | Physical controls protect access to critical infrastructure. Weaknesses may enable theft, sabotage or unauthorized access to servers and network equipment, indirectly affecting all CIA pillars.                                                                                                                                      |

---

# Top 5 Most Critical Assets

## 1. EHR System (ehr-srv-01 + ehr-db-01)

The EHR is the single most important asset at MedDefense. It stores protected health information, medication history, laboratory results and clinical notes used in real time by physicians and nurses. Loss of confidentiality triggers HIPAA violations and legal consequences, while loss of integrity or availability directly affects patient care. The 9-hour migration outage demonstrated how quickly clinical operations degrade when the EHR is unavailable.

---

## 2. Active Directory & Identity Services

Active Directory is the trust anchor of the organization. Nearly every user, workstation and server depends on it for authentication and authorization. A compromise of AD would allow attackers to impersonate users, escalate privileges and move laterally across clinical and administrative environments. From an attacker perspective, AD is often the highest-value target after the EHR itself.

---

## 3. Medical IoT Devices

Medical devices such as Philips monitors and BD Alaris infusion pumps are unique because cybersecurity failures become patient safety failures. Incorrect readings, unavailable devices or manipulated configurations can directly impact diagnosis and treatment. The lack of network segmentation and known firmware vulnerabilities significantly increase the risk.

---

## 4. Network Core Infrastructure

The FortiGate firewall and Cisco switching infrastructure underpin every site and service. The current flat architecture means compromise of a single workstation or server can expose the entire environment. Network outages or malicious reconfiguration would simultaneously impact EHR access, imaging, billing and administrative operations.

---

## 5. Backup & Recovery Infrastructure

Backups determine whether MedDefense can recover from ransomware, hardware failure or disasters. The current architecture is fragile: backups are stored on a NAS in the same room and network as production servers. A fire, flood or ransomware outbreak could destroy both production and backup systems, eliminating recovery capability entirely.

---

# Executive Summary

MedDefense's most critical assets are not individual devices but **shared clinical and infrastructure services**: EHR, identity, network core, medical IoT and backups. The common pattern is that these assets are highly interconnected and several lack strong detective or compensating controls. This means a single compromise—especially in the current flat network architecture—has the potential to escalate into an organization-wide incident affecting patient care, regulatory compliance and business continuity simultaneously.
