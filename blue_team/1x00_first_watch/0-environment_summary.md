# Structured Environment Summary

## 1. Organization Overview

### Sites

| Site                        | Type                  | Function                                                                                                           | Approx. Headcount |
| --------------------------- | --------------------- | ------------------------------------------------------------------------------------------------------------------ | ----------------: |
| MedDefense Central Hospital | Acute care hospital   | Main clinical site providing emergency care, surgery, radiology, oncology, pharmacy, laboratory and administration |            ~1,400 |
| Westside Clinic             | Outpatient clinic     | Primary care, diagnostic imaging, blood work, minor procedures and physical therapy                                |              ~180 |
| Corporate HQ                | Administrative office | Finance, HR, Legal, Marketing, Executive Leadership and IT                                                         |              ~220 |

Total workforce: approximately 2,000 employees.

### Security and IT Reporting Structure

**Executive level**

* CEO: Dr. Patricia Morales
* CFO: Robert Kim
* COO: Angela Torres
* General Counsel: David Park
* CISO position is currently vacant.

**Security**

* James Chen serves as Deputy CISO and acting security lead.
* Security Analyst position (the role replacing Marcus Webb) reports to James Chen.
* In practice, James reports directly to the CEO.

**IT**

Sarah Park is IT Director and manages:

* 3 System Administrators
* 2 Network Technicians
* 1 Database Administrator
* 2 Helpdesk Analysts (including Mike Torres as lead)
* 2 Desktop Support Technicians
* 1 vacant IT Intern position

James Chen and Sarah Park are peers. James has authority over security policy but not over IT operations, creating organizational friction.

---

## 2. IT Infrastructure Identified

### Central Hospital Servers

| Name           | OS                     | Function                                   |
| -------------- | ---------------------- | ------------------------------------------ |
| ehr-srv-01     | Ubuntu 20.04 LTS       | EHR application server                     |
| ehr-db-01      | Ubuntu 20.04 LTS       | PostgreSQL database for EHR                |
| pacs-srv-01    | Windows Server 2016    | PACS imaging server                        |
| billing-srv-01 | Ubuntu 18.04 LTS       | Billing and claims processing              |
| ad-dc-01       | Windows Server 2019    | Primary Active Directory Domain Controller |
| ad-dc-02       | Windows Server 2019    | Secondary Domain Controller                |
| file-srv-01    | Windows Server 2016    | Department file shares                     |
| print-srv-01   | Windows Server 2012 R2 | Print server, unverified                   |
| backup-srv-01  | Ubuntu 22.04 LTS       | Backup server using Veeam                  |
| web-srv-01     | Ubuntu 20.04 LTS       | Public website and patient portal          |

Additional backup storage:

* Local NAS connected to backup-srv-01.
* Located in the same server room and on the same network.

### Westside Clinic Servers

| Name      | OS                  | Function                         |
| --------- | ------------------- | -------------------------------- |
| ws-srv-01 | Windows Server 2016 | Local file server and scheduling |

Possible additional server:

* Marcus Webb noted an unconfirmed server in the Westside server closet.

### Corporate HQ

* No on-premise servers.
* Staff rely on cloud services.
* Connected to Central through site-to-site VPN.

---

### Network Infrastructure

#### Central Hospital

Firewall:

* 1 Fortinet FortiGate 100F

Switching:

* Cisco core switch (model unknown)
* 2 Cisco access switches per floor

Wireless:

* 12 Ubiquiti UniFi access points

Network architecture:

* Flat network
* Entire infrastructure on 10.10.0.0/16
* No VLANs configured
* Servers, workstations and medical devices share the same broadcast domain

DMZ:

* web-srv-01 exposed through DMZ

Guest WiFi:

* Separate SSID exists
* Isolation not verified

---

#### Westside Clinic

* Netgear Nighthawk consumer router
* 1 unmanaged switch
* No firewall
* IPSec VPN tunnel to Central

---

#### Corporate HQ

* Network managed by building landlord
* Dedicated MedDefense VLAN
* Site-to-site VPN to Central

---

### Endpoint Inventory

#### Central

* ~320 Windows 10 workstations
* ~60 thin clients

#### Westside

* ~45 Windows 10 workstations

#### HQ

* ~120 Windows 10/11 workstations
* ~30 laptops

#### Mobile Devices

* ~25 physician iPads
* Management status unknown

---

### Medical Devices / IoT

| Device                              | Quantity | Location          | Details                                      |
| ----------------------------------- | -------: | ----------------- | -------------------------------------------- |
| Philips IntelliVue patient monitors |      ~80 | Central           | Network connected                            |
| BD Alaris infusion pumps            |     ~120 | Central           | Network connected for dosage updates         |
| Siemens MAGNETOM MRI                |        1 | Central Radiology | Runs Windows XP                              |
| GE Revolution CT Scanner            |        1 | Central           | OS unknown                                   |
| Nurse call system                   |  Unknown | Central           | IP-based, integrated with phone system       |
| HID Global badge system             |  Unknown | Central           | Connected to Active Directory for some doors |

---

## 3. Data and Services

### Data Types

MedDefense handles:

* Electronic Health Records (EHR)
* Patient imaging data (PACS)
* Laboratory and blood work results
* Pharmacy records
* Billing and insurance claims
* Employee and HR data
* Legal and financial documents
* Authentication and Active Directory information
* Physical badge/access data

---

### Critical IT Services

#### Electronic Health Record System

Infrastructure:

* ehr-srv-01
* ehr-db-01

Users:

* Physicians
* Nurses
* Clinical staff
* Administrative personnel

---

#### Medical Imaging

Infrastructure:

* pacs-srv-01
* MRI scanner
* CT scanner

Users:

* Radiology department
* Physicians

---

#### Billing and Claims

Infrastructure:

* billing-srv-01

Users:

* Finance department
* Billing staff

Notes:

* Experienced ransomware incident in January.
* Performance issues continue.

---

#### Active Directory

Infrastructure:

* ad-dc-01
* ad-dc-02

Users:

* Entire organization

Functions:

* Authentication
* Access management
* Badge system integration

---

#### Website and Patient Portal

Infrastructure:

* web-srv-01

Users:

* Patients
* External visitors

Exposed through:

* DMZ behind FortiGate firewall

---

#### Backup Services

Infrastructure:

* backup-srv-01
* Local NAS

Software:

* Veeam

Backup schedule:

* Nightly backups

---

#### Microsoft 365

Service:

* O365 E3

Users:

* Entire organization

Annual cost:

* $432,000

---

### Security Services

* Sophos Endpoint Protection
* Fortinet firewall support
* ClearView Security guard services
* MedTech Solutions EHR maintenance

---

## 4. Known Unknowns

### Asset Inventory

* Complete server inventory does not exist.
* Westside may contain an undocumented server.
* Endpoint counts are based on an AD report that is 8 months old.
* Print server has not been physically verified in over a year.
* Complete cloud service inventory is missing.

---

### Network Architecture

* Cisco core switch model unknown.
* Westside unmanaged switch model unknown.
* WiFi infrastructure at Westside unknown.
* HQ VPN ACLs have not been audited.
* Guest WiFi isolation status unknown.
* Actual network topology differs from the simplified diagram.

---

### Security Controls

* No formal vulnerability assessment completed.
* Endpoint protection coverage unknown.
* No MFA except James Chen's account.
* Shared PACS credentials still exist.
* SSH password authentication enabled on Linux servers.
* HIPAA Security Rule compliance has never been formally assessed.

---

### Business Continuity

Missing entirely:

* Incident Response Plan
* Business Continuity Plan
* Disaster Recovery Plan

Known issue:

* Backup server and NAS are on the same network, same room and same rack, making ransomware recovery questionable.

---

### Medical Devices

Unknown:

* Operating system of GE Revolution CT scanner.
* Security status of Philips monitors.
* Security status of infusion pumps.
* Network segmentation strategy for IoT devices.

Medical devices are currently connected to the same network as servers and user workstations.

---

### Physical Security

Unknown:

* Detailed access controls for server rooms.
* Badge permissions by role.
* Physical security controls at HQ.

Known weaknesses:

* Westside server closet does not lock.
* No cameras near Central server room.
* Generic badge access to server room.
