# Forensic Methodologies

## TASK1 - Mysterious Image

### Objective
Analyze a provided image to extract hidden metadata and identify the owner.

### Tools Used
- exiftool

### Findings
The metadata contained an Owner Name field indicating:

Sherlock_Holbies

### Conclusion
Metadata analysis is a fundamental forensic technique that can reveal hidden information without modifying the original evidence.


## Task 1 - Geolocation Forensics

### Extracted GPS Coordinates
37°46'53.82"N  
122°24'29.84"W  

### Location Identified
972 Mission St, San Francisco

### Tools Used
- exiftool
- Google Maps

## Task 2 - Deciphering the Intruder's Intent

### Scenario Summary

An IDS alert revealed suspicious SSH login attempts originating from an unknown IP address.  

Key findings during the investigation:

- Multiple failed SSH login attempts  
- Successful authentication on a high-privilege account  
- Execution of network mapping commands  
- Evidence of data exfiltration activity  

### Analysis

The attack sequence shows a clear progression:

1. **Initial Access Attempt** — Brute-force or credential attack via SSH.
2. **Privilege Abuse** — Compromise of a high-privilege account.
3. **Internal Reconnaissance** — Network mapping to identify valuable assets.
4. **Data Exfiltration** — Extraction of corporate information from the network.

While reconnaissance was performed, it served as a supporting action rather than the final objective.

### Conclusion

The primary intent of the intruder was:

**C) To exfiltrate sensitive corporate data**

This conclusion is based on the confirmed presence of data exfiltration activities after successful authentication.

### Forensic Takeaway

This case highlights:

- The importance of monitoring SSH authentication logs  
- The risk of compromised privileged accounts  
- The need for anomaly detection on outbound data transfers  
- The value of layered detection (IDS + log analysis)

Understanding attacker behavior patterns is essential in determining intent during incident response investigations.

## Task 3 - Identifying the Vulnerability Type

### Scenario Summary

A web application was compromised, resulting in unauthorized access to customer data.  

Key investigative findings:

- The attack originated from the application's login form.
- The attacker injected malicious queries through user input fields.
- Sensitive user data was exposed as a result.

### Analysis

The critical clue in this scenario is the ability to **inject malicious queries** through a login form.

This indicates:

1. User input was not properly sanitized or validated.
2. The application likely concatenated user input directly into SQL queries.
3. The attacker manipulated the query logic to bypass authentication or retrieve additional data.

This behavior is characteristic of **SQL Injection (SQLi)** attacks.

Other options can be excluded:

- **XSS** involves injecting malicious scripts executed in the browser.
- **CSRF** tricks authenticated users into performing unwanted actions.
- **RCE** allows execution of system-level commands, which was not indicated here.

### Conclusion

The vulnerability exploited in this attack was:

**B) SQL Injection (SQLi)**

### Forensic Takeaway

This case highlights:

- The importance of parameterized queries (prepared statements)
- Proper input validation and sanitization
- Principle of least privilege for database accounts
- Implementation of Web Application Firewalls (WAF)

SQL Injection remains one of the most common and impactful web application vulnerabilities, often leading to severe data breaches when secure coding practices are not followed.

## Task 4 - Pinpointing the Attack Method

### Scenario Summary

An organization experienced a data breach after its web server was compromised.

Key findings from forensic analysis:

- The attacker gained access via a service running on an open port.
- The service was used for remote management.
- The service was not regularly updated.
- Shortly after gaining access, the attacker performed privilege escalation.

### Analysis

The compromise began through an exposed remote management service that had not been properly updated.  

This strongly suggests:

1. The service contained an unpatched security flaw.
2. The attacker scanned for exposed services.
3. The attacker leveraged a publicly known exploit targeting that vulnerability.
4. After initial access, privilege escalation techniques were used to gain higher-level control.

This sequence aligns with the exploitation of a known vulnerability.

Other options can be excluded:

- **Phishing** targets users through deception, not exposed services.
- **Denial of Service (DoS)** aims to disrupt availability, not gain access.
- **Password Spraying** involves credential attacks, which were not indicated in the scenario.

### Conclusion

The attack method most likely used was:

**C) Exploit of a Known Vulnerability**

### Forensic Takeaway

This scenario highlights the importance of:

- Regular patch management and updates
- Minimizing exposed services and open ports
- Conducting vulnerability scanning
- Monitoring remote management interfaces
- Implementing intrusion detection and privilege escalation monitoring

Unpatched services are one of the most common entry points for attackers and remain a critical security risk in enterprise environments.

## Task 5 - Unveiling the Ripple Effect

### Scenario Summary

After routine maintenance, a retail corporation observed:

- Increased server load
- Irregular access patterns within the CRM system
- Unauthorized modifications to customer profiles
- Subtle changes to contact details and marketing preferences

Although the breach did not immediately disrupt operations, unauthorized data alterations were confirmed.

### Analysis

The modifications were subtle and did not cause immediate downtime or visible operational failure. However:

1. Customer data integrity was compromised.
2. Trust in the organization’s ability to safeguard personal information was weakened.
3. The company’s brand identity is built on customer service and data integrity.
4. Even minor unauthorized changes can significantly damage credibility if disclosed publicly.

The most critical concern is not technical disruption but reputational harm.

Other options can be excluded:

- **Immediate financial losses due to downtime** — No operational outage was reported.
- **Direct increase in spam emails** — Not directly indicated in the scenario.
- **Short-term website performance issues** — Performance was not the primary issue.

### Conclusion

The most significant indirect impact is:

**B) Undermining of brand reputation and customer trust**

### Forensic Takeaway

This scenario emphasizes:

- The importance of data integrity monitoring
- The reputational risks of even subtle data breaches
- The long-term impact of trust erosion on customer loyalty
- The necessity of transparent incident response and communication strategies

In modern cybersecurity, reputational damage often exceeds the immediate technical impact of a breach.
