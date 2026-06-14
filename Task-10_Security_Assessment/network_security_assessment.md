# Task 10: Network Security Assessment Report

## 📌 Executive Summary
This document presents a comprehensive Network Security Assessment conducted on the local test environment. The assessment was performed utilizing network scanning techniques (Nmap) and active traffic capture/analysis (Wireshark) to evaluate the security posture, identify potential vulnerabilities, and propose actionable remediation plans.

The target system shows a **moderately secure, minimal attack surface** with only two open ports (SSH and HTTP). However, critical vulnerabilities were identified in the transport layer due to the transmission of unencrypted HTTP traffic and plaintext DNS queries, exposing the system to Man-in-the-Middle (MITM) attacks and reconnaissance.

---

## 🎯 Methodology & Scope
The assessment was divided into two phases:
1. **Network Reconnaissance (Nmap):** Scans were conducted to map the subnet topology, discover active hosts, identify open ports, determine running services/versions, and fingerprint operating systems. Screenshots documenting the scans are saved in [screenshots/](file:///c:/Users/Jay%20Maniya/Downloads/OIBSIP-Internship/OIBSIP/Task-10_Security_Assessment/screenshots/).
2. **Network Traffic Capture & Analysis (Wireshark):** A packet capture [wireshark_capture.pcap](file:///c:/Users/Jay%20Maniya/Downloads/OIBSIP-Internship/OIBSIP/Task-10_Security_Assessment/wireshark_capture.pcap) was analyzed to evaluate protocol distribution, cleartext data exposure, TLS handshake negotiation, and DNS leakage.

---

## 🔍 Phase 1: Network Reconnaissance (Nmap Scan Analysis)

Scanning the target machine (`localhost`) yielded the following findings:

### 1. Active Host Discovery
* **Target Subnet:** `192.168.31.0/24`
* **Identified Gateway:** `192.168.31.1` (JioFiber Router)
* **MAC Vendor:** Speedtech
* **Implication:** The subnet has a standard configuration. Host discovery identifies all active nodes, allowing an attacker to map the target network's live hosts.

### 2. Service & Version Detection
Out of 65,535 TCP ports scanned, only **2 ports** were identified as `OPEN`:

| Port | Protocol | State | Service | Software Version |
|------|----------|-------|---------|------------------|
| **22** | TCP | Open | SSH | OpenSSH 10.3p1 Debian 1 |
| **80** | TCP | Open | HTTP | Apache httpd 2.4.67 (Debian) |

* **SSH (Port 22):** The service is up to date (OpenSSH 10.3p1). However, leaving Port 22 open to the network allows external connection attempts, exposing it to brute-force attacks if weak credentials are used.
* **HTTP (Port 80):** The web server is running Apache 2.4.67. Serving pages over HTTP (Port 80) rather than HTTPS (Port 443) means all data, including credentials, session tokens, and personal details, is sent in plaintext across the network.

---

## 📡 Phase 2: Traffic Capture Analysis (Wireshark)

Analyzing the captured network traffic (`wireshark_capture.pcap`) revealed several key insights:

### 1. Cleartext HTTP Exposure
* **Filter:** `http`
* **Finding:** Multiple HTTP `GET` requests were captured in cleartext. An observer on the path can see the requested URLs, user-agents, cookie headers, and HTML responses.
* **Consequence:** If a user submits a login form, their credentials will be fully visible to any packet sniffer on the local network (e.g., in a switched network via ARP poisoning, or on public Wi-Fi).

### 2. HTTPS & TLS Handshake
* **Filter:** `tls` or `tcp.port == 443`
* **Finding:** While the payload of HTTPS connections is fully encrypted, inspecting `tls.handshake.type == 1` (Client Hello) reveals the **Server Name Indication (SNI)** field.
* **Consequence:** Even with HTTPS, an observer on the network can see the exact domain names the user is visiting (e.g., `github.com`), which leaks user behavior patterns and host details.

### 3. Plaintext DNS Queries
* **Filter:** `dns`
* **Finding:** Standard DNS queries (port 53 UDP) were captured resolving websites to IP addresses.
* **Consequence:** DNS queries are unencrypted. An attacker or ISP can log all domains requested by the client, allowing for profiling or redirection attacks (DNS Spoofing).

### 4. TCP Three-Way Handshake
* **Filter:** `tcp.flags.syn == 1 && tcp.flags.ack == 0`
* **Finding:** Successful establishment of TCP connections via the standard `SYN -> SYN-ACK -> ACK` handshake.
* **Consequence:** Confirms the active connection states between the host and external servers. Attackers can trace these handshakes to identify active outbound connections.

---

## 🚨 Risk Registry & Security Findings

| # | Vulnerability Finding | Severity | Consequence | Remediation |
|---|----------------------|----------|-------------|-------------|
| 1 | **Unencrypted HTTP (Port 80) Usage** | 🔴 **High** | Credentials, session identifiers, and sensitive data transmitted in cleartext can be captured using packet sniffers, leading to account hijacking and data theft. | Enforce HTTPS (Port 443) using TLS 1.3 certificates. Redirect all Port 80 traffic to Port 443. Configure HSTS. |
| 2 | **Open SSH Port (Port 22) Exposed** | 🟡 **Medium** | Open SSH service invite continuous brute-force login attempts and exposes the system if zero-day vulnerabilities in OpenSSH are discovered. | Restrict SSH access to specific administrative IPs via firewall rules. Enable key-based authentication only, disable password logins, and install `fail2ban`. |
| 3 | **Unencrypted DNS Queries** | 🟢 **Low** | Website domain requests are visible, compromising user privacy and leaving the system vulnerable to DNS hijacking/spoofing. | Implement DNS over HTTPS (DoH) or DNS over TLS (DoT) on the network adapter/system level. |
| 4 | **Web Server Banner Disclosure** | 🟢 **Low** | Apache server version (`Apache/2.4.67 (Debian)`) is disclosed in the HTTP Response headers (`Server: Apache/2.4.67 (Debian)`), aiding attackers in version-specific exploit research. | Disable version banners in Apache configurations. Set `ServerTokens Prod` and `ServerSignature Off` in the configuration file. |

---

## 🛡️ Remediation Roadmap

To transition the scanned network and hosts to a hardened state, the following security measures are recommended:

1. **Secure the Web Server (Apache):**
   - Install a TLS certificate (e.g., Let's Encrypt).
   - Edit `/etc/apache2/conf-available/security.conf`:
     ```text
     ServerTokens Prod
     ServerSignature Off
     ```
   - Enforce HTTP-to-HTTPS redirect:
     ```apache
     <VirtualHost *:80>
         ServerName yourdomain.com
         Redirect permanent / https://yourdomain.com/
     </VirtualHost>
     ```

2. **Hardening SSH Configuration (`/etc/ssh/sshd_config`):**
   - Disable password-based logins: `PasswordAuthentication no`
   - Disable root logins: `PermitRootLogin no`
   - Change the default port: `Port 2222` (Security through obscurity, reduces automated bot scans)

3. **Firewall Access Controls (UFW/iptables):**
   - Allow incoming connections only on essential ports:
     ```bash
     sudo ufw default deny incoming
     sudo ufw default allow outgoing
     sudo ufw allow 443/tcp
     sudo ufw allow from <ADMIN_IP> to any port 22 proto tcp
     sudo ufw enable
     ```

---

## 👤 Concluding Takeaways (Audience Highlights)

> [!IMPORTANT]
> - **CRITICAL TAKEAWAY:** Although the system has a minimized footprint (only two open ports), the presence of unencrypted HTTP and DNS queries compromises the confidentiality of all communications. A simple local network capture (as shown in Wireshark) easily exposes usernames and passwords.
> - **THE SOLUTION:** True defense-in-depth requires encrypting all data in transit. Transitioning from HTTP to HTTPS, restricting management ports (SSH) behind strong firewall access control lists (ACLs), and utilizing key-based logins are mandatory steps to secure this environment.

## 📂 Assessment Artifacts & Evidence

The following files are attached in the [Task-10_Security_Assessment](file:///c:/Users/Jay%20Maniya/Downloads/OIBSIP-Internship/OIBSIP/Task-10_Security_Assessment/) directory as primary evidence for this assessment:

1. **Nmap Scan Console Output:**
   - Captured in [nmap_results.txt](file:///c:/Users/Jay%20Maniya/Downloads/OIBSIP-Internship/OIBSIP/Task-10_Security_Assessment/nmap_results.txt).
2. **Wireshark Packet Capture File:**
   - Captured in [wireshark_capture.pcap](file:///c:/Users/Jay%20Maniya/Downloads/OIBSIP-Internship/OIBSIP/Task-10_Security_Assessment/wireshark_capture.pcap).
3. **Visual Screenshots (Terminal & Analyzer outputs):**
   - [Screenshot 2026-05-20 172501.png](file:///c:/Users/Jay%20Maniya/Downloads/OIBSIP-Internship/OIBSIP/Task-10_Security_Assessment/screenshots/Screenshot%202026-05-20%20172501.png)
   - [Screenshot 2026-05-20 172600.png](file:///c:/Users/Jay%20Maniya/Downloads/OIBSIP-Internship/OIBSIP/Task-10_Security_Assessment/screenshots/Screenshot%202026-05-20%20172600.png)
   - [Screenshot 2026-05-20 172610.png](file:///c:/Users/Jay%20Maniya/Downloads/OIBSIP-Internship/OIBSIP/Task-10_Security_Assessment/screenshots/Screenshot%202026-05-20%20172610.png)

---

## 👤 Author
**Jay Maniya**  
Oasis Infobyte — Cybersecurity Internship (2026)
