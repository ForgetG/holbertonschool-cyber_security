# Risk Treatment Decisions – MedDefense Health Systems

The following decisions prioritize **maximum risk reduction per dollar** while staying within the **$120,000 annual security budget**.

---

## GAP-001

### Gap Title

Flat Network Architecture Enables Lateral Movement

### Risk Level

**Critical**

### Treatment Strategy

**Mitigate**

### Justification

The flat network is the single largest multiplier of risk at MedDefense. Almost every critical asset is reachable from every other asset. Segmentation dramatically limits attacker movement and protects EHR, AD and medical devices simultaneously.

### Proposed Controls

* VLAN separation (Technical Preventive)
* Internal firewall ACLs (Technical Compensating)
* Dedicated Medical IoT VLAN (Technical Compensating)

### Estimated Cost

**$10K–50K**

### Implementation Effort

**Long-term (> 1 month)**

### Expected Risk Reduction

**Very High**

Limits hospital-wide compromise and reduces ransomware blast radius.

### Trade-offs

* Network redesign required
* Temporary operational disruptions
* Requires coordination with Radiology and Biomedical Engineering

---

## GAP-002

### Gap Title

No MFA for Critical Systems

### Risk Level

**Critical**

### Treatment Strategy

**Mitigate**

### Justification

MFA is one of the cheapest and most effective controls available. It directly reduces the likelihood of credential abuse.

### Proposed Controls

* MFA on VPN
* MFA on O365
* MFA on privileged AD accounts

**Category:** Technical Preventive

### Estimated Cost

**$1K–10K**

### Implementation Effort

**Short-term (< 1 month)**

### Expected Risk Reduction

**Very High**

Protects:

* AD
* EHR
* VPN
* O365

against password theft and phishing.

### Trade-offs

* User resistance
* Helpdesk workload initially increases

---

## GAP-003

### Gap Title

No Centralized Security Monitoring

### Risk Level

**Critical++**

### Treatment Strategy

**Mitigate**

### Justification

All three real-world breaches had one thing in common:

> Nobody noticed.

Detection capability is the difference between a contained incident and a hospital-wide breach.

### Proposed Controls

* Deploy open-source SIEM:

  * Wazuh
  * Elastic Stack

* Central log collection

**Category:** Technical Detective

### Estimated Cost

**$10K–50K**

Mostly:

* Hardware
* Storage
* Deployment time

Enterprise SIEM is intentionally avoided.

### Implementation Effort

**Long-term (> 1 month)**

### Expected Risk Reduction

**Very High**

Detects:

* Malware
* Lateral movement
* Suspicious logins
* Policy violations

### Trade-offs

* Requires tuning
* Generates false positives initially

---

## GAP-004

### Gap Title

Backup Infrastructure Shares Production Risk

### Risk Level

**Critical**

### Treatment Strategy

**Mitigate**

### Justification

Current backups fail against ransomware.

Backups are only valuable if attackers cannot reach them.

### Proposed Controls

* Immutable backup storage
* Cloud backup copy
* Monthly restore testing

Categories:

* Technical Corrective
* Administrative Corrective

### Estimated Cost

**$10K–50K**

### Implementation Effort

**Short-term to Long-term**

### Expected Risk Reduction

**High**

Transforms:

```text
Ransomware

↓

Hospital destroyed
```

into:

```text
Ransomware

↓

Recoverable incident
```

### Trade-offs

* Additional storage costs
* Longer backup windows

---

## GAP-005

### Gap Title

Legacy MRI Runs Unsupported Windows XP

### Risk Level

**Critical**

### Treatment Strategy

**Mitigate**

### Justification

The MRI cannot be patched or replaced.

The only viable strategy is containment.

### Proposed Controls

* Dedicated MRI VLAN
* Firewall ACLs
* Physical access restrictions
* Monitoring of MRI traffic

Categories:

* Technical Compensating
* Physical Preventive
* Technical Detective

### Estimated Cost

**$1K–10K**

### Implementation Effort

**Short-term**

### Expected Risk Reduction

**High**

Significantly reduces lateral movement risk.

### Trade-offs

* MRI remains vulnerable.
* Vendor compatibility must be validated.

---

## GAP-011

### Gap Title

No Formal Patch Management Program

### Risk Level

**Critical**

### Treatment Strategy

**Mitigate**

### Justification

Two of the three real-world breaches started with:

* Unpatched VPN
* Unpatched Web Portal

The billing server compromise strongly suggests the same pattern.

### Proposed Controls

* Monthly patch cycle
* Emergency patch SLA
* Vulnerability inventory
* Quarterly patch audit

Categories:

* Administrative Preventive
* Technical Preventive

### Estimated Cost

**$0–1K**

Mostly:

* Process creation
* Staff time

### Implementation Effort

**Quick Win (< 1 week)**

### Expected Risk Reduction

**Very High**

Prevents exploitation of known vulnerabilities.

### Trade-offs

* Planned maintenance windows
* Potential application compatibility testing

---

## GAP-012

### Gap Title

No Identity Lifecycle Management

### Risk Level

**Critical**

### Treatment Strategy

**Mitigate**

### Justification

Former employees with active accounts are extremely dangerous because:

* Access appears legitimate.
* Existing controls are bypassed.

Healthcare breach #2 proves this risk is real.

### Proposed Controls

* HR → IT offboarding workflow
* Automatic account disablement
* Dormant account alerts
* Quarterly access reviews

Categories:

* Administrative Preventive
* Technical Preventive

### Estimated Cost

**$1K–10K**

### Implementation Effort

**Short-term**

### Expected Risk Reduction

**High**

Eliminates:

* Dormant accounts
* Forgotten VPN users
* Long-lived privileged access

### Trade-offs

* HR and IT processes must change.
* Requires management discipline.

---

# Budget Summary

| Gap                               | Strategy | Estimated Cost |
| --------------------------------- | -------: | -------------: |
| GAP-001 Network Segmentation      | Mitigate |        $35,000 |
| GAP-002 MFA                       | Mitigate |         $7,000 |
| GAP-003 Wazuh + Central Logging   | Mitigate |        $25,000 |
| GAP-004 Backup Isolation          | Mitigate |        $20,000 |
| GAP-005 MRI Compensating Controls | Mitigate |         $5,000 |
| GAP-011 Patch Management Program  | Mitigate |         $1,000 |
| GAP-012 Identity Lifecycle        | Mitigate |         $7,000 |

---

## Total Estimated Budget

```text
$35,000
+ $7,000
+ $25,000
+ $20,000
+ $5,000
+ $1,000
+ $7,000
----------------
$100,000
```

**Remaining Budget: ~$20,000**

---

# Recommended Use of Remaining Budget

Reserve the remaining **$20,000** for:

1. External penetration test (**$10K–15K**)
2. Incident Response tabletop exercises (**$2K–5K**)
3. Security awareness improvements (**$2K–5K**)

---

# Deferred to Next Fiscal Year

The following initiatives should be postponed:

* Full commercial SIEM ($80K+)
* MRI replacement ($2.1M asset)
* Complete Medical IoT replacement program
* Enterprise PAM solution
* Full DLP deployment

---

# Executive Recommendation

The recommended budget prioritizes **containment, visibility and identity security** rather than expensive point solutions. For approximately **$100,000**, MedDefense can eliminate its most dangerous structural weaknesses: flat networking, lack of MFA, absent monitoring, fragile backups and unmanaged identities. These investments directly address the attack paths observed both internally and in recent healthcare breaches, providing substantially greater risk reduction than purchasing a single enterprise security product.
