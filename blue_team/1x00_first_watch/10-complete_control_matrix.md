# Complete Control Matrix – MedDefense Health Systems

## Part 1 – Control Registry

| Control ID | Control Name                               | Category       | Function     | Asset(s) Protected                   | Effectiveness | Evidence / Source                                                            |
| ---------- | ------------------------------------------ | -------------- | ------------ | ------------------------------------ | ------------- | ---------------------------------------------------------------------------- |
| C-001      | FortiGate Perimeter Firewall               | Technical      | Preventive   | Internet edge, DMZ, internal network | Adequate      | FortiGate rules exist, but VPN and outbound rules are overly permissive.     |
| C-002      | Default Deny Firewall Rule                 | Technical      | Preventive   | Network perimeter                    | Adequate      | Final deny-all rule exists and logs traffic.                                 |
| C-003      | Firewall Traffic Logging                   | Technical      | Detective    | Firewall, VPN, DMZ                   | Weak          | Logs exist locally but are not centralized or monitored.                     |
| C-004      | SSH Key-Based Authentication on ehr-srv-01 | Technical      | Preventive   | ehr-srv-01                           | Strong        | Password authentication disabled on ehr-srv-01.                              |
| C-005      | Root SSH Login Disabled                    | Technical      | Preventive   | ehr-srv-01                           | Strong        | `PermitRootLogin no` configured.                                             |
| C-006      | SSH Verbose Logging                        | Technical      | Detective    | ehr-srv-01                           | Adequate      | Verbose SSH logging enabled, but no central monitoring.                      |
| C-007      | Password Complexity Policy                 | Administrative | Preventive   | User accounts, AD                    | Adequate      | Minimum length, complexity, history and rotation exist.                      |
| C-008      | Account Lockout Policy                     | Technical      | Preventive   | User accounts, AD                    | Adequate      | Lockout after 5 failed attempts for 30 minutes.                              |
| C-009      | Sophos Endpoint Protection                 | Technical      | Preventive   | Windows workstations                 | Adequate      | Covers workstations but not servers, Linux, mobile or medical IoT.           |
| C-010      | Sophos Malware Detection                   | Technical      | Detective    | Windows workstations                 | Adequate      | Recent detections recorded.                                                  |
| C-011      | Malware Quarantine                         | Technical      | Corrective   | Windows workstations                 | Adequate      | Sophos quarantines or blocks detected threats.                               |
| C-012      | Nightly Veeam Backups                      | Technical      | Corrective   | Selected Central servers             | Weak          | Backups exist but are local, incomplete and not fully tested.                |
| C-013      | Backup Retention Policy                    | Administrative | Corrective   | Backup data                          | Weak          | 14-day retention exists, but no offsite copy or full DR process.             |
| C-014      | Visitor Registration Desk                  | Physical       | Preventive   | Main entrance                        | Weak          | Only main entrance, weekdays 07:00–19:00.                                    |
| C-015      | Security Guard Presence                    | Physical       | Deterrent    | Central main entrance                | Weak          | No patrols, no nights, no weekends, no Westside coverage.                    |
| C-016      | CCTV Cameras                               | Physical       | Detective    | Entrances, parking garage            | Weak          | No cameras near server room, network closets or admin wing.                  |
| C-017      | Annual Security Awareness Training         | Administrative | Preventive   | Employees                            | Weak          | Low completion at Central and Westside; content is generic.                  |
| C-018      | Suspicious Activity Reporting Training     | Administrative | Detective    | Employees                            | Weak          | Covered in training but no evidence of enforcement or workflow.              |
| C-019      | EHR Audit Logging                          | Technical      | Detective    | EHR system, patient records          | Weak          | Vendor-managed; exports take 48 hours.                                       |
| C-020      | Apache Log Rotation                        | Technical      | Corrective   | web-srv-01, billing-srv-01           | Weak          | Retains logs but does not detect or prevent attacks.                         |
| C-021      | DMZ Placement for web-srv-01               | Technical      | Preventive   | Public website, patient portal       | Adequate      | Web server is separated from direct internal exposure.                       |
| C-022      | Site-to-Site VPN                           | Technical      | Preventive   | HQ, Westside, Central connectivity   | Weak          | Connectivity exists but VPN ACLs allow overly broad access.                  |
| C-023      | Active Directory Authentication            | Technical      | Preventive   | Users, servers, workstations         | Adequate      | Central authentication exists, but MFA is absent.                            |
| C-024      | PACS Shared Account Password Procedure     | Administrative | Preventive   | PACS access                          | Weak          | Policy allows shared accounts when “not technically feasible.”               |
| C-025      | Local FortiGate Log Retention              | Technical      | Detective    | Network perimeter                    | Weak          | 30-day local retention only, no SIEM forwarding.                             |
| C-026      | Physical Badge Access System               | Physical       | Preventive   | Doors, restricted areas              | Weak          | Generic badge access allows too many employees into sensitive areas.         |
| C-027      | Badge System AD Integration                | Technical      | Preventive   | Physical access system               | Weak          | Integrated for some doors only; scope unclear.                               |
| C-028      | Backup Restore Testing                     | Administrative | Corrective   | Recovery process                     | Weak          | Last partial restore was 8 months ago; no full DR test.                      |
| C-029      | Proposed MRI Network Segmentation          | Technical      | Compensating | MRI, PACS, clinical network          | Strong        | Recommended compensating control for unpatchable Windows XP MRI workstation. |
| C-030      | Proposed MRI Firewall ACLs                 | Technical      | Compensating | MRI, PACS                            | Strong        | Restricts MRI communication to only required PACS traffic.                   |
| C-031      | Proposed MRI Physical Access Restriction   | Physical       | Preventive   | MRI control workstation              | Adequate      | Limits local access, USB risk and unauthorized interaction.                  |
| C-032      | Proposed MRI Legacy System SOP             | Administrative | Preventive   | MRI workstation, radiology workflow  | Adequate      | Defines safe use rules without modifying certified OS.                       |
| C-033      | Proposed MRI Monitoring / Logging          | Technical      | Detective    | MRI network segment                  | Adequate      | Would alert on unexpected MRI communication if implemented.                  |
| C-034      | Paper Downtime Procedure                   | Administrative | Corrective   | Clinical operations                  | Weak          | Used during EHR outage but not formally documented or tested.                |
| C-035      | Public Website Backup Restore              | Technical      | Corrective   | web-srv-01                           | Adequate      | Website was restored after defacement within 2 hours.                        |

---

## Part 2 – Updated Control Summary Matrix

| Category       | Preventive                         | Detective                 | Corrective                         | Compensating                | Deterrent        |
| -------------- | ---------------------------------- | ------------------------- | ---------------------------------- | --------------------------- | ---------------- |
| Technical      | 10 controls – Adequate average     | 7 controls – Weak average | 4 controls – Adequate/Weak average | 3 controls – Strong average | 0 controls       |
| Administrative | 5 controls – Weak/Adequate average | 1 control – Weak average  | 3 controls – Weak average          | 0 controls                  | 0 controls       |
| Physical       | 4 controls – Weak/Adequate average | 1 control – Weak average  | 0 controls                         | 0 controls                  | 1 control – Weak |

### Matrix Interpretation

MedDefense has more preventive controls than detective or corrective controls. The strongest proposed controls are compensating controls for the MRI, but they are not yet implemented. Existing detection is mostly passive logging without centralization, alerting or active monitoring.

---

## Part 3 – Control Coverage Map for Top 5 Critical Assets

| Critical Asset                   | Preventive                                               | Detective               | Corrective              | Compensating                              | Coverage Assessment |
| -------------------------------- | -------------------------------------------------------- | ----------------------- | ----------------------- | ----------------------------------------- | ------------------- |
| EHR System                       | C-004, C-005, C-007, C-008, C-023                        | C-006, C-019            | C-012, C-028, C-034     | None                                      | Partially Protected |
| Active Directory                 | C-007, C-008, C-023                                      | Local Windows logs only | C-012 for ad-dc-01 only | None                                      | Under-Protected     |
| Medical IoT Devices              | Minimal physical controls, no strong technical isolation | None                    | None                    | Proposed C-029, C-030, C-033 for MRI only | Under-Protected     |
| Network Core                     | C-001, C-002, C-022                                      | C-003, C-025            | None                    | None                                      | Partially Protected |
| Backup & Recovery Infrastructure | C-012, C-013                                             | None                    | C-012, C-028            | None                                      | Under-Protected     |

---

## Coverage Assessment

### EHR System – Partially Protected

The EHR has some meaningful preventive controls, including Active Directory authentication and hardened SSH on `ehr-srv-01`. However, PostgreSQL exposure, lack of MFA, weak monitoring and vendor-delayed audit exports leave major confidentiality and detection gaps.

### Active Directory – Under-Protected

AD is one of the highest-value assets but has only baseline password and lockout controls. There is no MFA, no privileged access management, no central alerting and no evidence of AD-specific monitoring for suspicious authentication or privilege escalation.

### Medical IoT Devices – Under-Protected

Medical IoT devices are exposed on the flat internal network and lack antivirus, segmentation, centralized monitoring and documented corrective procedures. The MRI compensating controls are strong on paper, but they are proposed rather than currently implemented.

### Network Core – Partially Protected

The FortiGate and switching infrastructure provide basic perimeter security, but permissive VPN rules, no egress filtering and no segmentation significantly reduce effectiveness. Detection is limited to local firewall logs without centralized analysis.

### Backup & Recovery Infrastructure – Under-Protected

Backups exist, but they are stored on the same network and in the same physical location as production systems. Recovery has not been fully tested, PACS and several other assets are excluded, and there is no offsite or immutable backup.

---

## Executive Conclusion

MedDefense has a security control landscape that is broad but shallow. Preventive controls exist, but they are inconsistently scoped and often weakened by flat networking, missing MFA, incomplete endpoint protection and poor physical access control. Detection and correction are the largest weaknesses: if an attacker bypasses the initial controls, MedDefense has limited ability to detect the intrusion early, contain it quickly or recover confidently.
