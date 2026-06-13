# Task 8: Network Traffic Capture & Analysis with Wireshark

## 📌 Objective
Capture live network traffic using Wireshark and analyze it to identify protocols, conversations, DNS queries, HTTP requests, TCP connections, and TLS handshakes on the local network.

## 🛠️ Tools Used
- **Wireshark** — GUI-based network protocol analyzer for deep packet inspection

## 🔧 Lab Setup

```
Operating System: Linux
Capture Interface: default network interface (eth0/wlan0)
Traffic Focus: HTTP and HTTPS Web Traffic
Output Format: PCAP (Packet Capture)
```

## 📡 Phase 1: Live Traffic Capture

### What is Packet Capture?
Packet capture (PCAP) is the process of intercepting and recording network traffic flowing through a network interface. Every piece of data on a network — web browsing, DNS lookups, file transfers, emails — is broken into packets. Wireshark captures these packets and allows us to inspect them at every layer of the OSI model.

I ran Wireshark on the Linux machine and browsed a mix of **HTTP (unencrypted)** and **HTTPS (encrypted)** websites to generate a diverse set of traffic. The capture was saved as `wireshark_capture_http_https.pcap`.

## 🔍 Phase 2: Traffic Analysis

I analyzed the capture file using various Wireshark display filters and statistics tools.

### 1. Protocol Hierarchy
**What it shows:** Breakdown of all protocols captured and their percentage of total traffic.
**Observation:** Most traffic was TCP-based (specifically TLS for HTTPS and HTTP), with DNS and ARP making up the broadcast and resolution traffic.

### 2. HTTP Traffic Analysis (Cleartext)
**Filter:** `http`
**What it shows:** All unencrypted HTTP requests, including the method (GET/POST), the host, and the requested URI. 
**Observation:** This demonstrates why HTTP is insecure — anyone capturing traffic on the network can see exactly what pages are being requested, and if I had logged in, my credentials would be visible in plaintext.

### 3. HTTPS Traffic Analysis (Encrypted)
**Filter:** `tls` or `tcp.port == 443`
**What it shows:** Encrypted HTTPS traffic. 
**Observation:** Unlike HTTP, the payload data is scrambled. However, using the filter `tls.handshake.type == 1`, I could inspect the TLS Client Hello packets. The **SNI (Server Name Indication)** field reveals which domain the client is trying to connect to, proving that HTTPS doesn't hide *where* you are going, only *what* you are doing there.

### 4. DNS Queries
**Filter:** `dns`
**What it shows:** Domain Name System queries resolving human-readable websites to IP addresses.
**Observation:** Before the HTTP or TLS traffic started, my machine had to ask the DNS server for the IP addresses of the websites I was visiting. These queries are typically sent in plaintext, revealing my browsing intentions.

### 5. TCP Three-Way Handshake
**Filter:** `tcp.flags.syn==1`
**What it shows:** All new TCP connections initiated from the network.
**Observation:** I observed the `SYN` -> `SYN-ACK` -> `ACK` sequence that establishes a reliable connection before data is transferred.

## 🔐 Security Implications

| Finding | Security Impact |
|---------|----------------|
| **HTTP traffic readable** | Data and credentials sent over HTTP can be captured and read by attackers on the network. |
| **DNS queries visible** | All website visits are visible via DNS, highlighting privacy risks on shared networks. |
| **TLS SNI exposure** | Even with HTTPS, the destination domain is visible via the SNI field in the handshake. |
| **TCP Handshakes visible** | Reveals all outbound connection attempts and the services/ports being targeted. |

## 📂 Files in This Directory
- `wireshark_capture_http_https.pcap` — The captured network traffic file containing HTTP and HTTPS activity.
- `README.md` — This file documenting the analysis.

## 👤 Author
**Jay Maniya**  
Oasis Infobyte — Cybersecurity Internship (2026)
