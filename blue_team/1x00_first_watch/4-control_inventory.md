# Control Inventory – MedDefense Health Systems

## C-001

**Control Name:** Perimeter Firewall Rules

**Description:** FortiGate 100F enforces inbound, outbound and VPN traffic policies, including a default deny rule.

**Category:** Technical

**Function:** Preventive

**Asset(s) Protected:** Internal network, DMZ, server subnet

**Source:** Artifact 1 – Firewall Configuration

---

## C-002

**Control Name:** Default Deny Firewall Policy

**Description:** Traffic not explicitly allowed is denied and logged.

**Category:** Technical

**Function:** Preventive

**Asset(s) Protected:** Entire network perimeter

**Source:** Artifact 1 – Firewall Configuration

---

## C-003

**Control Name:** Firewall Traffic Logging

**Description:** Firewall rules use `logtraffic all` or `logtraffic utm` to record accepted and denied traffic.

**Category:** Technical

**Function:** Detective

**Asset(s) Protected:** DMZ, VPN and Internet traffic

**Source:** Artifact 1 – Firewall Configuration

---

## C-004

**Control Name:** SSH Key-Based Authentication

**Description:** SSH access on `ehr-srv-01` only allows public key authentication. Password authentication is disabled.

**Category:** Technical

**Function:** Preventive

**Asset(s) Protected:** ehr-srv-01

**Source:** Artifact 2 – SSH Configuration

---

## C-005

**Control Name:** Root SSH Login Disabled

**Description:** Root cannot authenticate directly over SSH (`PermitRootLogin no`).

**Category:** Technical

**Function:** Preventive

**Asset(s) Protected:** ehr-srv-01

**Source:** Artifact 2 – SSH Configuration

---

## C-006

**Control Name:** SSH Authentication Logging

**Description:** SSH logs authentication attempts with verbose logging enabled.

**Category:** Technical

**Function:** Detective

**Asset(s) Protected:** ehr-srv-01

**Source:** Artifact 2 – SSH Configuration

---

## C-007

**Control Name:** Password Policy

**Description:** Passwords require minimum length, complexity, history and periodic rotation.

**Category:** Administrative

**Function:** Preventive

**Asset(s) Protected:** User accounts and Active Directory

**Source:** Artifact 3 – Password Policy

---

## C-008

**Control Name:** Account Lockout Policy

**Description:** Accounts are locked after five failed authentication attempts for 30 minutes.

**Category:** Technical

**Function:** Preventive

**Asset(s) Protected:** User accounts

**Source:** Artifact 3 – Password Policy

---

## C-009

**Control Name:** Sophos Endpoint Protection

**Description:** Sophos antivirus is deployed on Windows workstations and detects malware, PUA and phishing attempts.

**Category:** Technical

**Function:** Preventive

**Asset(s) Protected:** Windows workstations

**Source:** Artifact 4 – Sophos Status Report

---

## C-010

**Control Name:** Antivirus Threat Detection

**Description:** Sophos detects and quarantines malicious software and suspicious files.

**Category:** Technical

**Function:** Detective

**Asset(s) Protected:** Windows workstations

**Source:** Artifact 4 – Sophos Status Report

---

## C-011

**Control Name:** Malware Quarantine

**Description:** Detected malware is quarantined or blocked automatically.

**Category:** Technical

**Function:** Corrective

**Asset(s) Protected:** Windows workstations

**Source:** Artifact 4 – Sophos Status Report

---

## C-012

**Control Name:** Nightly VM Backups

**Description:** Veeam performs daily full backups of critical virtual machines at 02:00 AM.

**Category:** Technical

**Function:** Corrective

**Asset(s) Protected:** EHR, Billing, AD, File Server, Website

**Source:** Artifact 5 – Backup Configuration

---

## C-013

**Control Name:** Backup Retention Policy

**Description:** Backup files are retained for 14 days and automatically deleted afterward.

**Category:** Administrative

**Function:** Corrective

**Asset(s) Protected:** Critical business systems

**Source:** Artifact 5 – Backup Configuration

---

## C-014

**Control Name:** Visitor Registration Desk

**Description:** Security guard verifies visitors and performs sign-in procedures at the main entrance.

**Category:** Physical

**Function:** Preventive

**Asset(s) Protected:** Central Hospital facilities

**Source:** Artifact 6 – Physical Security Contract

---

## C-015

**Control Name:** Security Guard Presence

**Description:** Uniformed guard monitors the main entrance and reports incidents.

**Category:** Physical

**Function:** Deterrent

**Asset(s) Protected:** Central Hospital main entrance

**Source:** Artifact 6 – Physical Security Contract

---

## C-016

**Control Name:** CCTV Camera System

**Description:** Cameras monitor entrances and parking garage, with footage stored for 30 days.

**Category:** Physical

**Function:** Detective

**Asset(s) Protected:** Main entrance, ER entrance, parking garage

**Source:** Artifact 6 – Physical Security Contract

---

## C-017

**Control Name:** Security Awareness Training

**Description:** Annual mandatory cybersecurity training covering phishing, passwords and physical security.

**Category:** Administrative

**Function:** Preventive

**Asset(s) Protected:** Entire organization

**Source:** Artifact 7 – Training Records

---

## C-018

**Control Name:** Security Incident Reporting Training

**Description:** Employees are trained to recognize and report suspicious activity.

**Category:** Administrative

**Function:** Detective

**Asset(s) Protected:** Entire organization

**Source:** Artifact 7 – Training Records

---

## C-019

**Control Name:** EHR Audit Logging

**Description:** The EHR application maintains audit logs managed by the vendor.

**Category:** Technical

**Function:** Detective

**Asset(s) Protected:** EHR system and patient records

**Source:** Artifact 8 – Log Management

---

## C-020

**Control Name:** Log Rotation

**Description:** Apache logs are rotated weekly and retained for four weeks.

**Category:** Technical

**Function:** Corrective

**Asset(s) Protected:** web-srv-01, billing-srv-01

**Source:** Artifact 8 – Log Management

---

# Control Summary Matrix

|                    | Preventive                               | Detective                  | Corrective          | Compensating | Deterrent |
| ------------------ | ---------------------------------------- | -------------------------- | ------------------- | ------------ | --------- |
| **Technical**      | C-001, C-002, C-004, C-005, C-008, C-009 | C-003, C-006, C-010, C-019 | C-011, C-012, C-020 | -            | -         |
| **Administrative** | C-007, C-017                             | C-018                      | C-013               | -            | -         |
| **Physical**       | C-014                                    | C-016                      | -                   | -            | C-015     |

# Gap Analysis

Several cells remain empty and represent notable security gaps:

### Technical Compensating

* No network isolation for legacy systems.
* No segmentation protecting medical IoT devices.
* No compensating controls for unsupported operating systems.

### Technical Deterrent

* No login banners.
* No user warning messages.
* No honeytokens or deception technologies.

### Administrative Compensating

* No exception management process.
* No compensating controls for shared accounts.
* No risk acceptance register.

### Administrative Deterrent

* No sanctions policy.
* No formal acceptable use acknowledgment.
* No insider threat awareness program.

### Physical Corrective

* No disaster recovery site.
* No spare hardware strategy.
* No documented physical recovery procedures.

### Physical Compensating

* No additional controls protecting the server room.
* No cages or secondary locks for sensitive infrastructure.
* No escort requirement for visitors outside the main entrance.
