# Holberton School Domain Analysis Report

## Overview

This document summarizes the information collected using the Shodan search engine regarding the domain **holbertonschool.com** and its associated subdomains.  
The analysis focuses on:

- IP addresses and IP ranges  
- Service providers and geographic locations  
- Web server technologies  
- SSL certificate details  
- HTTP security headers  
- Frameworks and observable configurations  

All findings were gathered manually on Shodan using the queries:

- `holbertonschool.com`
- `hostname:*.holbertonschool.com`

---

## IP Ranges

Below are the main IP addresses identified for the Holberton domain and subdomains through Shodan search results.  
Most of the infrastructure is hosted on **Amazon Web Services (AWS)**, primarily in the **eu-west-3 (Paris)** region.

---

### **35.180.27.154**
- **Host:** ec2-35-180-27-154.eu-west-3.compute.amazonaws.com  
- **Service Provider:** Amazon Data Services France  
- **Location:** Paris, France  
- **Open Ports:** 80 (HTTP), 443 (HTTPS)  
- **Observed Server:** nginx  

---

### **52.47.143.83**
- **Host:** ec2-52-47-143-83.eu-west-3.compute.amazonaws.com  
- **Subdomain:** yriry2.holbertonschool.com  
- **Service Provider:** Amazon Data Services France  
- **Location:** Paris, France  
- **Open Ports:** 80, 443  
- **Observed Server:** nginx  

---

### **13.36.x.x / 13.37.x.x (Multiple Subdomains)**
Used by several Holberton staging or application subdomains.

- **Service Provider:** Amazon Data Services (eu-west-3, Paris)  
- **Usage:** Preview environments, student tools, internal systems  
- **Shodan Observations:**  
  - HTTPS enabled  
  - nginx or AWS load balancer signatures  

---

### **54.86.x.x / 54.89.x.x (Legacy Subdomains)**
Associated with older Holberton application versions.

- **Service Provider:** Amazon AWS (us-east-1)  
- **Observed Ports:** 80, 443  
- **Usage:** Older versions or archived deployments  

---

## Subdomains and Services

### **holbertonschool.com**
- **Status:** HTTP/1.1 301 Moved Permanently  
- **Server:** nginx/1.18.0 (Ubuntu)  
- **Response Headers:**
  - Content-Type: text/html  
  - Connection: keep-alive  
  - Location: http://holbertonschool.com  
- **Notes:**  
  The redirection suggests routing to another server or load balancer.

---

### **yriry2.holbertonschool.com**
Found via Shodan under IP **52.47.143.83**.

- **Status:** HTTP/1.1 200 OK  
- **Server:** nginx  
- **Security Headers:**
  - X-Frame-Options: SAMEORIGIN  
  - X-XSS-Protection: 0  
  - X-Content-Type-Options: nosniff  
  - X-Download-Options: noopen  
- **Notes:**  
  The header structure indicates a controlled web application environment, possibly a student forum or level-based platform.

---

### **Other Subdomains (apply, read, staging, etc.)**

Shodan observations shared across these hosts:

- **Server:** nginx or AWS ELB  
- **SSL:** Enabled with valid certificates  
- **Protocols:** Support for TLS 1.2 and TLS 1.3  
- **Typical Behavior:**  
  - Login portals  
  - Application endpoints  
  - Staging environments with restricted access  

---

## SSL Certificate Details

### **SSL Certificate for yriry2.holbertonschool.com**
- **Issuer:** Let's Encrypt  
- **Supported TLS Versions:**  
  - TLSv1.2  
  - TLSv1.3  
- **Certificate Fields:**
  - **Common Name:** yriry2.holbertonschool.com  
  - **Organization:** Not specified (DV certificate)  
- **Notes:**  
  The certificate is correctly configured and up-to-date.

---

## Technologies and Frameworks

### **Web Servers**
Shodan banners revealed use of the following web server technologies:

- **Nginx**
  - Versions detected:
    - nginx/1.18.0 (Ubuntu)  
    - nginx/1.21.x  
  - Responsibilities:
    - Reverse proxy  
    - Serving frontend applications  
    - Handling secure HTTP traffic  

---

### **Security Features**
Observed security mechanisms across analyzed subdomains:

- **HTTPS enabled** using Let's Encrypt certificates  
- **Modern TLS support (1.2 & 1.3)**  
- **Security Headers:**
  - X-Frame-Options: SAMEORIGIN  
  - X-XSS-Protection: 0  
  - X-Content-Type-Options: nosniff  
  - X-Download-Options: noopen  

These configurations align with standard best practices for securing web applications.

---

## Notes

- `yriry2.holbertonschool.com` appears to be connected to a **level-based platform or student environment**, based on observed headers and structure.
- Shodan confirms that Holberton’s infrastructure is hosted on **AWS**, providing reliability and scalability.
- Global redirects suggest active routing and content delivery management.
- TLS configurations and nginx security headers show attention to secure deployment practices.

---

## Conclusion

The analysis of **holbertonschool.com** using Shodan reveals:

- A stable and secure cloud-hosted infrastructure (primarily AWS).  
- Modern, properly configured HTTPS with Let's Encrypt certificates.  
- Use of nginx across several subdomains, configured with security headers.  
- No critical misconfigurations exposed on public-facing interfaces.  

Overall, the Holberton School infrastructure demonstrates modern security and hosting practices, with a well-maintained web ecosystem.
