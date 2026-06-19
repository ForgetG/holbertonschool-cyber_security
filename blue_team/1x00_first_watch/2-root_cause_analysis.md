# Root Cause Analysis – billing-srv-01

## 1. Process Identification

### What is `kworker` doing?

The process is **not** a legitimate Linux kernel worker thread.

Real Linux kernel worker processes:

* Appear as **`[kworker/... ]`** (with brackets)
* Run as **root**
* Execute from kernel space
* Do not exist as executable files on disk

This process:

```text
PID: 8834
User: www-data
Executable: /var/www/html/.cache/kworker
```

is a user-space binary masquerading as a legitimate kernel process.

---

### What does `stratum+tcp://pool.monero.org:4443` mean?

`stratum+tcp` is the protocol used by cryptocurrency mining software to communicate with mining pools.

The configuration file contains:

```json
"pools": [
    {"url": "stratum+tcp://pool.monero.org:4443"},
    {"url": "stratum+tcp://91.121.87.10:8080"},
    {"url": "stratum+tcp://104.238.140.32:3333"}
]
```

The process maintains multiple outbound connections:

```text
10.10.2.15 -> 185.243.115.89:4443
10.10.2.15 -> 91.121.87.10:8080
10.10.2.15 -> 104.238.140.32:3333
```

These are cryptocurrency mining pool connections.

---

### What is the purpose of this process?

The process is a **crypto-miner**, most likely a variant of **XMRig** or a similar Monero mining malware.

Its purpose is:

1. Use the server CPU to compute hashes.
2. Submit results to external mining pools.
3. Receive cryptocurrency rewards in the attacker's wallet.

Evidence:

* Fake name (`kworker`)
* Running as `www-data`
* Executable hidden under:

```text
/var/www/html/.cache/
```

* Mining pool configuration
* CPU usage:

```text
94.2% CPU
```

This is an active malware infection.

---

# 2. Real Security Compromise

The visible symptom is:

> High CPU usage and poor performance

This is **not** the primary problem.

---

## Primary CIA Pillar #1 – Integrity

**Integrity is compromised first.**

The attacker:

* Uploaded an unauthorized executable
* Created a hidden directory:

```text
/var/www/html/.cache/
```

* Modified the server filesystem
* Installed configuration files
* Established persistence

The system is no longer in its intended state.

---

## Primary CIA Pillar #2 – Confidentiality

**Confidentiality is also compromised.**

An attacker capable of:

* Uploading binaries
* Executing arbitrary code
* Running processes as `www-data`

may also:

* Read application files
* Steal credentials
* Dump databases
* Access billing records
* Enumerate the network

There is no evidence of data theft, but:

> If an attacker has code execution on the server, confidentiality must be assumed compromised until proven otherwise.

---

## Availability

Availability is affected **last**.

The crypto-miner consumes:

```text
94.2% CPU
```

which causes:

* Slow billing application
* CPU saturation
* Repeated service degradation

Availability degradation is therefore:

> A symptom of compromise, not the root cause.

---

# 3. Why the Sysadmin's Solution Fails

The sysadmin proposes:

```text
Old VM:
- 8 GB RAM
- 4 vCPUs

New VM:
- 16 GB RAM
- 8 vCPUs
```

This does **not** solve the security problem.

---

### Why?

Because the problem is:

> Unauthorized code execution.

If the malware remains:

* It will consume more CPU.
* It may spawn more threads.
* It may install additional malware.
* The attacker retains access.

The result:

```text
More CPU
     ↓

Miner uses more CPU

     ↓

Server becomes slow again
```

The compromise persists.

---

### Worse:

If the migration copies:

```text
/var/www/html
```

or restores:

```text
/var/www/html/.cache/kworker
```

the malware migrates to the new VM.

The organization spends money while preserving the compromise.

---

# 4. Connection to the January Ransomware

January:

```text
Ransomware
↓
billing-srv-01 encrypted
↓
Server rebuilt
```

Current:

```text
Crypto-miner
↓
billing-srv-01 compromised again
```

Marcus already suspected:

> "Different payload this time (miner instead of ransomware) but same entry point."

---

## What does this suggest?

This is not a random event.

It suggests:

### Persistent Vulnerability

The same weakness probably still exists.

Possible examples:

* Unpatched Apache vulnerability
* Remote Code Execution flaw
* Vulnerable billing application
* Weak credentials
* Exposed administration interface

---

### Weak Rebuild Process

The rebuild likely focused on:

```text
Restore service quickly
```

instead of:

```text
Identify entry point
Patch vulnerability
Harden server
Verify compromise is removed
```

---

### Security Debt

The organization has:

* Unsupported Ubuntu 18.04
* Previously infected server
* Flat network
* No formal vulnerability assessment
* Weak security governance

This suggests systemic security issues rather than a single isolated incident.

---

# 5. The Question You Should Be Asking

The important question is **not**:

> "Why is the server slow?"

or

> "How much RAM does the server need?"

The important question is:

> **"How did an attacker gain code execution on billing-srv-01, and why was the same entry point still available after the ransomware incident?"**

Until that question is answered:

* Reboots are temporary.
* Hardware upgrades are ineffective.
* Rebuilding the server again may simply lead to a third compromise.
