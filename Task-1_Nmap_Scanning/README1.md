# Task 1: Basic Network Scanning with Nmap

## 📌 Objective
Perform a network scan to identify open ports and services using Nmap — one of the most widely used network scanning tools in cybersecurity.

## 🛠️ Tool Used
- **Nmap 7.99** — [https://nmap.org](https://nmap.org)
- **OS:** Linux (Debian-based)

## 📡 Scans Performed

### Scan 1: Host Discovery (`nmap -sn`)
- **Purpose:** Find all live devices on the local network.
- **Target:** `192.168.31.0/24`
- **Result:** Found the JioFiber router at `192.168.31.1` (MAC: D8:23:E0:3C:58:86, Manufacturer: Speedtech).

### Scan 2: Service & Version Detection (`nmap -sV -O`)
- **Purpose:** Identify open ports, what service is running on each, and their version numbers.
- **Target:** `localhost`
- **Result:** Found 2 open ports — SSH (port 22) and HTTP (port 80). Detected the operating system as Linux.

### Scan 3: Aggressive Scan (`nmap -A`)
- **Purpose:** Run a deep scan that includes OS detection, version detection, NSE scripts, and traceroute — all in one command.
- **Target:** `localhost`
- **Result:** Confirmed SSH and Apache services. NSE scripts revealed the Apache default page title ("It works") and the server header version.

### Scan 4: Full Port Scan (`nmap -p-`)
- **Purpose:** Scan all 65,535 TCP ports to make sure no hidden services are running on unusual port numbers.
- **Target:** `localhost`
- **Result:** Only ports 22 and 80 are open. The remaining 65,533 ports are closed. No hidden services found.

## 📊 Summary of Findings

| Port | State | Service | Version |
|------|-------|---------|---------|
| 22/tcp | Open | SSH | OpenSSH 10.3p1 Debian 1 |
| 80/tcp | Open | HTTP | Apache httpd 2.4.67 (Debian) |

## 🔐 Security Significance

| Port | Risk | Recommendation |
|------|------|----------------|
| **22 (SSH)** | Allows remote login to the machine. If secured poorly, attackers can brute-force passwords. | Use SSH key-based authentication instead of passwords. Install `fail2ban` to block repeated failed login attempts. |
| **80 (HTTP)** | Serves web pages over unencrypted plain text. Data (including passwords) can be intercepted. | Upgrade to HTTPS (port 443) using a TLS/SSL certificate. Redirect all HTTP traffic to HTTPS. |

## ✅ Conclusion
The machine has a **minimal attack surface** with only 2 open ports. This is a good security posture for a basic system. However, both services should be hardened — SSH with key-based auth and HTTP with TLS encryption — before being used in production.

## 📂 Files in This Directory
- `nmap_scan_results.txt` — Full output from all 4 scans
- `README.md` — This file
- `screenshots/` — Screenshots of terminal output

## 👤 Author
**Jay Maniya**
Oasis Infobyte — Cybersecurity Internship (2026)
