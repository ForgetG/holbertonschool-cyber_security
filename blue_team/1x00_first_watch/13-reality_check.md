# Reality Check – Healthcare Breach Correlation

---

# Breach 1 – Regional Hospital Alpha

## Attack Vector Identification

### Initial Entry Point

An unpatched VPN appliance with a known vulnerability.

The attackers:

1. Exploited the VPN.
2. Entered the internal network.
3. Moved laterally through the flat network.
4. Compromised Active Directory.
5. Deployed ransomware through Group Policy.

---

### Weaknesses Exploited

* Missing patch management
* Flat network architecture
* No network monitoring
* Weak backup architecture
* No Incident Response Plan

---

## MedDefense Correlation

This breach maps almost perfectly to MedDefense.

| Breach Weakness    | MedDefense Gap    |
| ------------------ | ----------------- |
| Flat network       | GAP-001           |
| No monitoring      | GAP-003           |
| Weak backups       | GAP-004           |
| No IR plan         | GAP-010           |
| AD compromise risk | GAP-002 + GAP-003 |

### Most Concerning Observation

MedDefense has:

* Flat network
* VPN connectivity
* Weak backup design
* No SIEM
* No MFA

The attack chain used against Alpha could almost certainly be reproduced.

---

## Blind Spot Check

### New Gap Required?

**Yes**

---

### GAP-011

**Title:** No Formal Patch Management Program

**Affected Assets:**

* FortiGate (**Critical**)
* VPN Infrastructure (**Critical**)
* web-srv-01 (**High**)
* billing-srv-01 (**High**)
* MRI (**Critical**)

---

**Data at Risk:**

* Patient Records (**Restricted**)
* Credentials (**Restricted**)
* Billing Data (**Restricted**)

---

**Current Control Status:**

* Ad hoc updates
* Individual admin responsibility

---

**What is Missing:**

* Administrative Preventive
* Technical Preventive

Formal:

* Asset lifecycle management
* Patch SLAs
* Vulnerability tracking
* Emergency patch process

---

**Risk Level:** **Critical**

---

**Risk Justification**

Three separate incidents in MedDefense already point toward poor patching:

* billing-srv-01 ransomware
* billing-srv-01 crypto-miner
* MRI Windows XP

---

**Potential Impact**

A known vulnerability in:

* VPN
* Firewall
* Web server

could lead directly to:

* Ransomware
* Data theft
* Hospital-wide outage

---

# Breach 2 – Health Network Beta

## Attack Vector Identification

### Initial Entry Point

Former employee retained:

* VPN access
* EHR credentials

for 47 days.

---

### Weaknesses Exploited

* Manual offboarding
* No MFA
* No behavioral monitoring
* Logs never reviewed
* No DLP

---

## MedDefense Correlation

| Breach Weakness   | MedDefense Gap |
| ----------------- | -------------- |
| No MFA            | GAP-002        |
| No monitoring     | GAP-003        |
| Weak EHR controls | GAP-009        |
| Weak IR/response  | GAP-010        |

---

### Important Observation

MedDefense already had:

> Incident B

where:

* Broken access control exposed lab results.

and:

> Incident F

where:

* Unmanaged devices accessed sensitive areas.

This indicates:

* Identity and access governance is immature.

---

## Blind Spot Check

### New Gap Required?

**Yes**

---

### GAP-012

**Title:** No Identity Lifecycle Management

**Affected Assets**

* Active Directory (**Critical**)
* EHR (**Critical**)
* O365 (**High**)

---

**Data at Risk**

* Patient Records (**Restricted**)
* HR Records (**Confidential**)
* Credentials (**Restricted**)

---

**Current Control Status**

* AD authentication
* Password policy

---

**What is Missing**

Administrative Preventive

Technical Preventive

Including:

* HR-IT integration
* Automated offboarding
* Dormant account detection
* Access recertification

---

**Risk Level**

**Critical**

---

**Risk Justification**

An active former employee account:

* bypasses perimeter controls
* bypasses trust assumptions
* provides legitimate access

---

**Potential Impact**

Long-term data theft.

PHI breach.

Regulatory fines.

---

### DLP Blind Spot?

Yes, but covered under:

> GAP-003

because:

* no monitoring
* no data movement analysis
* no export alerting

It could become its own gap later.

---

# Breach 3 – Community Hospital Gamma

## Attack Vector Identification

### Initial Entry Point

Patient Portal vulnerability.

Attackers:

1. Compromised web server.
2. Pivoted from DMZ.
3. Reached internal network.
4. Reached medical devices.
5. Installed crypto-miners.

---

### Weaknesses Exploited

* Vulnerable web application
* DMZ misconfiguration
* No IoT segmentation
* Default credentials
* No monitoring

---

## MedDefense Correlation

This breach is frighteningly close to MedDefense.

---

| Breach Weakness       | MedDefense Gap |
| --------------------- | -------------- |
| Vulnerable web server | GAP-011        |
| Weak DMZ              | GAP-001        |
| No monitoring         | GAP-003        |
| Medical IoT exposure  | GAP-005        |
| Flat network          | GAP-001        |

---

### Additional Observation

The attack used:

```text
Portal
 ↓

Crypto Miner

 ↓

Medical Devices

 ↓

Patient Data Exposure
```

MedDefense already experienced:

```text
Billing Server

 ↓

Crypto Miner
```

This suggests:

> The crypto-miner incident was not merely a performance issue.

It was evidence of:

* weak detection
* weak patching
* weak containment

---

## Blind Spot Check

### New Gap Required?

**Yes**

---

### GAP-013

**Title:** Default and Shared Credentials Exist on Critical Systems

**Affected Assets**

* PACS (**Critical**)
* Medical IoT (**Critical**)
* Network Devices (**Critical**)

---

**Data at Risk**

* Imaging Data (**Restricted**)
* Credentials (**Restricted**)
* Medication Data (**Restricted**)

---

**Current Control Status**

* Password policy

---

**What is Missing**

Technical Preventive

Administrative Preventive

Including:

* Unique credentials
* Password vaulting
* Credential rotation
* Vendor password replacement

---

**Risk Level**

**Critical**

---

**Risk Justification**

MedDefense already has:

* Shared PACS account
* Credentials taped to wall
* Generic badges

Weak authentication is systemic.

---

**Potential Impact**

Unauthorized access to:

* PACS
* Medical devices
* Network infrastructure

leading to:

* Patient data theft
* Device manipulation
* Ransomware

---

# Priority Reassessment

## GAP-003

### Old

Critical

### New

**Critical++ (Highest Priority)**

---

Reason:

All three breaches shared:

* No monitoring
* Long attacker dwell time
* Logs existed but nobody looked at them.

Monitoring failures transformed small compromises into major breaches.

---

## GAP-011

### Old

Not identified

### New

**Critical**

---

Reason:

Two of three breaches started with:

* Unpatched VPN
* Unpatched portal

Patch management is now a Board-level risk.

---

## GAP-005

### Old

Critical

### New

**Critical (unchanged)**

---

Reason:

Medical IoT compromise is not theoretical anymore.

It happened in the wild.

---

## GAP-002

### Old

Critical

### New

**Critical (higher operational priority)**

---

Reason:

Credential abuse caused:

* 3,211 PHI records exposed
* Legal action
* Regulatory investigation

MFA is among the cheapest high-impact controls available.

---

# Pattern Analysis

The three breaches reveal the same pattern repeatedly: attackers rarely rely on sophisticated zero-days; they exploit **known weaknesses that organizations already understand but fail to remediate**. Unpatched perimeter systems, flat networks, missing MFA, unmanaged credentials and the absence of monitoring appear in every breach. The most important lesson for MedDefense is that prevention alone is insufficient. If security budgets are limited, the organization should prioritize **network segmentation, centralized monitoring/SIEM, MFA and patch management**, because these controls repeatedly appear as the difference between a contained incident and a hospital-wide crisis.
