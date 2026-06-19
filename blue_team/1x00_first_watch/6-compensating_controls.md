# Compensating Controls for Legacy MRI Workstation

## 1. Risk Analysis

The MRI workstation is a **critical security risk** because it runs Windows XP Embedded, an operating system that has not received security updates since 2014 and contains numerous publicly known vulnerabilities. An attacker who compromises this workstation could exploit the hospital's flat network architecture to move laterally toward servers, workstations or medical devices on the same VLAN. Because the MRI must remain connected to the PACS server and cannot be patched or upgraded, the attack surface cannot be reduced at the host level. This makes the MRI both a high-value target and a potential entry point into the broader MedDefense network, threatening the confidentiality, integrity and availability of clinical systems.

---

# 2. Compensating Control Strategy

## Control CC-001

### Control Name

MRI Network Segmentation

### Description

Move the MRI workstation into a dedicated VLAN or isolated network segment.

Create strict firewall rules allowing communication only between:

* MRI workstation ↔ PACS server
* MRI workstation ↔ vendor-approved services (if required)

Deny:

* MRI ↔ user workstations
* MRI ↔ Internet
* MRI ↔ other medical devices
* MRI ↔ administrative networks

---

### Classification

**Category:** Technical

**Function:** Compensating

---

### Risk Reduction

This control:

* Prevents lateral movement.
* Limits attacker access to other hospital systems.
* Reduces the attack surface of the MRI.
* Contains compromise to a restricted zone.

If the MRI becomes infected:

> The compromise stays local instead of spreading across 10.10.0.0/16.

---

### Limitations / Residual Risk

* The MRI itself remains vulnerable.
* Malware may still disrupt the scanner.
* Requires firewall and VLAN configuration expertise.
* Vendor support may need validation.

---

## Control CC-002

### Control Name

Dedicated Firewall ACL for MRI Communications

### Description

Create host-level firewall rules on the FortiGate allowing:

* PACS IP → MRI specific ports
* MRI → PACS specific ports

Block:

* Any other inbound connection
* Any Internet access
* Any outbound traffic not explicitly approved

Enable logging of all allowed and denied connections.

---

### Classification

**Category:** Technical

**Function:** Compensating

---

### Risk Reduction

This control:

* Restricts attacker communications.
* Prevents malware from reaching command-and-control servers.
* Blocks Internet-based exploitation.
* Produces logs for incident investigation.

---

### Limitations / Residual Risk

* The MRI can still be compromised locally.
* Firewall rules require maintenance.
* Misconfigurations may disrupt imaging workflows.

---

## Control CC-003

### Control Name

Physical Access Restriction

### Description

Restrict physical access to the MRI control workstation:

* Locked room outside operating hours.
* Badge access limited to radiology personnel.
* CCTV coverage of the workstation area.
* Visitor escort requirement.

---

### Classification

**Category:** Physical

**Function:** Preventive

---

### Risk Reduction

This control:

* Reduces insider threats.
* Prevents unauthorized USB device insertion.
* Limits opportunities for local malware installation.
* Creates an audit trail through cameras and badge logs.

---

### Limitations / Residual Risk

* Does not prevent remote attacks.
* Authorized staff could still make mistakes.
* Requires ongoing badge and camera management.

---

## Control CC-004

### Control Name

Radiology Legacy System Operating Procedure

### Description

Establish a formal operating procedure requiring:

* No Internet browsing on the MRI workstation.
* No USB devices without approval.
* Vendor updates reviewed before installation.
* Immediate reporting of unusual behavior.
* Quarterly review of the MRI risk register.

---

### Classification

**Category:** Administrative

**Function:** Preventive

---

### Risk Reduction

This control:

* Reduces human error.
* Standardizes operational practices.
* Improves staff awareness of legacy-system risks.
* Creates accountability.

---

### Limitations / Residual Risk

* Relies on staff compliance.
* Does not prevent technical exploitation.
* Human error remains possible.

---

# 3. Implementation Priority

## Highest Priority Control

### CC-001 — MRI Network Segmentation

If MedDefense can implement only one control immediately, **network segmentation provides the greatest risk reduction**.

Why:

1. The MRI itself cannot be secured at the operating system level.
2. Segmentation limits the blast radius of a compromise.
3. It protects not only the MRI, but also:

   * EHR servers
   * Active Directory
   * Billing systems
   * Other medical devices
   * User workstations

Without segmentation:

```text
Compromised MRI
      ↓
Flat Network (10.10.0.0/16)
      ↓
Lateral Movement
      ↓
Hospital-wide Incident
```

With segmentation:

```text
Compromised MRI
      ↓
Dedicated VLAN
      ↓
Firewall Restricts Traffic
      ↓
Attack Contained
```

This is the textbook example of a **Compensating Technical Control**: the vulnerable system cannot be patched, so the network architecture is modified to reduce risk while preserving clinical operations.
