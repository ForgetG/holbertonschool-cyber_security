# Asset Registry – MedDefense Health Systems

| Asset ID | Name                        | Type                    | Location          | Owner         | OS / Platform             | Critical Services        | Network Segment | Status     | Notes                           |
| -------- | --------------------------- | ----------------------- | ----------------- | ------------- | ------------------------- | ------------------------ | --------------- | ---------- | ------------------------------- |
| A-001    | ehr-srv-01                  | Server                  | Central           | IT / Clinical | Ubuntu 20.04              | EHR Application          | 10.10.2.0/24    | Active     | SSH key-only authentication     |
| A-002    | ehr-db-01                   | Data Store              | Central           | IT / Clinical | Ubuntu 20.04 + PostgreSQL | EHR Database             | 10.10.2.0/24    | Active     | PostgreSQL exposed internally   |
| A-003    | pacs-srv-01                 | Server                  | Central           | Radiology     | Windows Server 2016       | PACS Imaging             | 10.10.2.0/24    | Active     | Not backed up                   |
| A-004    | billing-srv-01              | Server                  | Central           | Finance       | Ubuntu 18.04              | Billing / Claims         | 10.10.2.0/24    | Active     | Crypto-miner compromise; EOL OS |
| A-005    | ad-dc-01                    | Server                  | Central           | IT            | Windows Server 2019       | Active Directory         | 10.10.2.0/24    | Active     | Primary DC                      |
| A-006    | ad-dc-02                    | Server                  | Central           | IT            | Windows Server 2019       | Active Directory         | 10.10.2.0/24    | Active     | Secondary DC                    |
| A-007    | file-srv-01                 | Server                  | Central           | IT            | Windows Server 2016       | File Shares              | 10.10.2.0/24    | Active     | Department shares               |
| A-008    | print-srv-01                | Server                  | Central           | IT            | Windows Server 2012 R2    | Printing                 | 10.10.2.0/24    | Deprecated | End of life                     |
| A-009    | backup-srv-01               | Server                  | Central           | IT            | Ubuntu 22.04              | Backups                  | 10.10.2.0/24    | Active     | Same room as production         |
| A-010    | NAS-01                      | Data Store              | Central           | IT            | Synology DSM 7            | Backup Storage           | 10.10.2.0/24    | Active     | Management exposed network-wide |
| A-011    | web-srv-01                  | Server                  | Central DMZ       | IT            | Ubuntu 20.04              | Website / Patient Portal | DMZ             | Active     | Public-facing                   |
| A-012    | FortiGate 100F              | Network Device          | Central           | IT            | FortiOS                   | Firewall / VPN           | Edge            | Active     | No egress filtering             |
| A-013    | Cisco Core Switch           | Network Device          | Central           | IT            | Cisco IOS                 | Switching                | Internal        | Active     | Model unknown                   |
| A-014    | Cisco Access Switches       | Network Device          | Central           | IT            | Cisco IOS                 | Access Switching         | Internal        | Active     | 2 per floor                     |
| A-015    | UniFi AP Infrastructure     | Network Device          | Central           | IT            | UniFi                     | WiFi                     | 10.10.1.0/24    | Active     | 12 APs documented               |
| A-016    | WS-RAD-01                   | Endpoint                | Central Radiology | Radiology     | Windows XP SP3            | MRI Control Workstation  | 10.10.1.0/24    | Deprecated | End-of-life; critical risk      |
| A-017    | Siemens MAGNETOM MRI        | IoT Medical             | Central Radiology | Radiology     | Windows XP Embedded       | MRI Imaging              | 10.10.3.0/24    | Active     | Cannot be upgraded              |
| A-018    | GE Revolution CT            | IoT Medical             | Central           | Radiology     | Unknown                   | CT Imaging               | 10.10.3.0/24    | Active     | OS unknown                      |
| A-019    | Philips IntelliVue Monitors | IoT Medical             | Central           | Clinical      | Philips IntelliVue        | Patient Monitoring       | 10.10.3.0/24    | Active     | ~80 units                       |
| A-020    | BD Alaris Pumps             | IoT Medical             | Central           | Clinical      | FW 12.1.2                 | Infusion Management      | 10.10.3.0/24    | Active     | Known vendor CVEs               |
| A-021    | Nurse Call System           | Application             | Central           | Clinical      | IP-based                  | Nurse Calls              | 10.10.3.0/24    | Active     | Integrated with phones          |
| A-022    | HID Badge System            | Physical Infrastructure | Central           | Security / IT | HID Global                | Physical Access          | 10.10.3.0/24    | Active     | Connected to AD                 |
| A-023    | ws-srv-01                   | Server                  | Westside          | IT            | Windows Server 2016       | Scheduling / Files       | 10.10.10.0/24   | Active     | Local server                    |
| A-024    | Netgear Router              | Network Device          | Westside          | IT            | Netgear Firmware          | VPN / Internet           | 10.10.10.0/24   | Active     | Consumer-grade                  |
| A-025    | WS-WC-XRAY                  | IoT Medical             | Westside          | Radiology     | Unknown                   | X-Ray Imaging            | 10.10.10.0/24   | Active     | Vendor-specific                 |
| A-026    | HQ Workstations             | Endpoint                | HQ                | Various       | Windows 10 / 11           | Office Productivity      | 10.10.20.0/24   | Active     | ~120 systems                    |
| A-027    | HQ Laptops                  | Endpoint                | HQ                | Various       | Windows 11                | Remote Access            | 10.10.20.0/24   | Active     | ~25 units                       |
| A-028    | O365 E3                     | Application             | Cloud             | IT            | Microsoft 365             | Email / SharePoint       | Cloud           | Active     | No backup                       |
| A-029    | UNKNOWN-01                  | Server                  | Central           | Unknown       | Linux 4.x                 | Unknown                  | 10.10.2.0/24    | Shadow IT  | SSH + ports 8888/9090           |
| A-030    | UNKNOWN-02                  | Server                  | Westside          | Unknown       | Linux 5.x                 | Unknown                  | 10.10.10.0/24   | Shadow IT  | SSH + port 3000                 |
| A-031    | Central Workstations        | Endpoint                | Central           | Various       | Windows 10                | Clinical / Admin         | 10.10.1.0/24    | Active     | ~320 systems                    |
| A-032    | Thin Clients                | Endpoint                | Central           | Clinical      | Linux                     | EHR Access               | 10.10.1.0/24    | Active     | ~60 units                       |
| A-033    | iPads                       | Endpoint                | Central           | Physicians    | iPadOS                    | Clinical Access          | WiFi            | Unknown    | No MDM deployed                 |

---

# Reconciliation Notes

## 1. Assets Found in Network Scan But Missing From Documentation

### UNKNOWN-01 (10.10.2.99)

* Linux 4.x
* Ports: 22, 8888, 9090
* No DNS entry
* No owner
* Not present in any inventory.

**Classification:** Shadow IT / Undocumented server

**Risk:**

* Unknown purpose
* Unknown patch status
* Possible persistence mechanism or abandoned project

---

### UNKNOWN-02 (10.10.10.200)

* Linux 5.x
* Ports: 22, 80, 3000
* Not documented.

Sarah suspects:

* Grafana
* Node.js
* Internal monitoring tool

**Classification:** Shadow IT

---

### NAS-01

The NAS appears in the network scan but not in the original asset inventory.

This is important because:

* It stores all backups.
* It is accessible from the entire network.
* It shares the same room and rack area as production systems.

---

## 2. Assets Mentioned in Documentation But Missing From Network Scan

### Additional Server at Westside

Marcus wrote:

> "There might be another server in the closet at Westside."

No matching device appears in the scan.

Possible explanations:

* Powered off
* Different subnet
* Decommissioned
* Hidden behind local firewall

**Status:** Unknown

---

### Corporate HQ Building Network

Documentation states:

* HQ uses a building-managed network.
* MedDefense has its own VLAN.

The scan shows workstations only.

Missing:

* Building routers
* Managed switches
* Internet edge devices

**Status:** Outside MedDefense administrative control.

---

## 3. Discrepancies Between Sources

### MRI Operating System

**Task 0:**

* MRI scanner runs Windows XP Embedded.

**Network Scan:**

* WS-RAD-01 reports Windows XP SP3.

This is not necessarily contradictory.

Most likely:

* WS-RAD-01 is the MRI control workstation.
* The MRI device itself runs Windows XP Embedded internally.

**Status:** Requires vendor confirmation.

---

### Network Segmentation

Initial documentation:

* Flat network 10.10.0.0/16.

Network scan:

* Multiple /24 subnets exist:

  * 10.10.1.0/24
  * 10.10.2.0/24
  * 10.10.3.0/24
  * 10.10.10.0/24
  * 10.10.20.0/24

However:

> All subnets are reachable from each other without restrictions.

Therefore:

* IP segmentation exists.
* Security segmentation does not.

Marcus was effectively correct:

> "Everything is on the same network."

---

### Backup Inventory

Documentation:

* Backup system protects only selected servers.

Network scan:

* PACS, Westside systems and medical devices are online but excluded from backup.

This confirms:

* Significant recovery gaps.
* Incomplete disaster recovery coverage.
* High operational risk for clinical services.
