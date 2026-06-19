# Incident Classification Table

| Incident                                         | Primary CIA Pillar  | Justification                                                                                                                                                    | Secondary CIA Pillar | Secondary Impact Explanation                                                                                                                    |
| ------------------------------------------------ | ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| **A – Ransomware on billing-srv-01**             | **Availability**    | The billing server became unusable after ransomware encrypted its files, preventing the finance team from processing insurance claims for 4 days.                | Integrity            | The ransomware modified and encrypted files without authorization, destroying their original state.                                             |
| **B – Broken access control in patient portal**  | **Confidentiality** | Authenticated patients could access other patients' lab results simply by changing a URL parameter, exposing sensitive medical information.                      | None                 | No evidence indicates data was modified or the service became unavailable.                                                                      |
| **C – Incorrect medication dosages**             | **Integrity**       | A faulty database update script overwrote medication dosage values with incorrect data across all sites.                                                         | Availability         | Although the system remained online, pharmacy staff could not safely rely on the displayed information until the issue was corrected.           |
| **D – Website defacement**                       | **Integrity**       | The homepage content was modified without authorization and replaced by a political message.                                                                     | Availability         | The website remained reachable, but its intended function and trusted content were temporarily unavailable to users.                            |
| **E – EHR outage during migration**              | **Availability**    | Physicians lost access to the EHR system for 9 hours and had to revert to paper records.                                                                         | Integrity            | The failed migration and untested rollback process created a risk of data inconsistency or corruption during the transition.                    |
| **F – Unauthorized laptop on corporate network** | **Confidentiality** | An unmanaged personal laptop with file-sharing software had access to the internal network and the HR file share, creating a risk of unauthorized data exposure. | Integrity            | The device could potentially modify or introduce malicious files onto internal systems because it was connected to the trusted network segment. |

---

## Summary by CIA Pillar

### Confidentiality Incidents

* **Incident B** – Patient portal broken access control exposed patient lab results.
* **Incident F** – Unmanaged personal laptop had access to internal resources and HR data.

### Integrity Incidents

* **Incident C** – Medication dosage database corruption.
* **Incident D** – Public website defacement.

### Availability Incidents

* **Incident A** – Billing server ransomware caused a 4-day outage.
* **Incident E** – EHR migration failure caused a 9-hour outage.

---

## Observations

1. **Availability problems are the most operationally damaging.**

   * Ransomware disabled billing.
   * EHR outage disrupted clinical operations.
   * Backup and rollback procedures appear poorly tested.

2. **Confidentiality weaknesses indicate poor access controls.**

   * Broken authorization in the patient portal.
   * Insufficient network segmentation allowed unmanaged devices onto sensitive networks.

3. **Integrity failures could directly impact patient safety.**

   * Incorrect medication dosages are a clinical safety issue.
   * Website defacement shows weak change-control or web security practices.

4. **Several incidents affect multiple CIA pillars simultaneously.**

   * Ransomware impacts both Availability and Integrity.
   * Unmanaged devices threaten both Confidentiality and Integrity.
   * Failed migrations primarily affect Availability but can also jeopardize Integrity.
