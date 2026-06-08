
# Network Security Threats — Research Report

**Author:** Jay Maniya  
**Date:** June 2026  
**Oasis Infobyte — Cybersecurity Internship**

---

## 1. Introduction

Network security threats are malicious activities or attempts that target the confidentiality, integrity, and availability of computer networks and the data flowing through them. As organizations become more dependent on digital infrastructure, attackers constantly develop new techniques to exploit vulnerabilities. Understanding these threats is the first step toward building effective defense strategies.

This report covers the most critical network security threats, how they work, real-world examples (both classic and 2025-2026 cases), and recommended countermeasures.

---

## 2. Types of Network Security Threats

### 2.1 Malware (Malicious Software)

**What it is:**  
Malware is any software intentionally designed to cause damage to a computer, server, or network. It includes viruses, worms, trojans, ransomware, spyware, and adware.

**How it works:**
- **Virus** — Attaches itself to a legitimate program and spreads when executed
- **Worm** — Self-replicating malware that spreads across networks without user action
- **Trojan** — Disguises itself as legitimate software but carries a hidden malicious payload
- **Ransomware** — Encrypts the victim's files and demands payment for the decryption key
- **Spyware** — Silently monitors user activity and steals sensitive information

**Real-world examples:**

*Classic Case:*  
WannaCry (2017) — A ransomware worm that exploited the EternalBlue vulnerability in Windows SMB protocol. Infected over 200,000 computers across 150 countries, causing $4 billion in damages.

*Recent Case:*  
Stryker Cyberattack (March 2026) — The Iran-aligned hacktivist group Handala launched a destructive malware attack against Stryker, a major medical technology company. The malware performed a mass device wipe across corporate systems, forcing office shutdowns. Modern malware is now being used for geopolitically motivated operational destruction, not just data theft.

*Recent Case:*  
University of Mississippi Medical Center (February 2026) — A ransomware attack forced the shutdown of the entire IT network, closure of 35 clinics, and a return to manual paper records. Ransomware targeting healthcare can directly endanger patient lives.

**Countermeasures:**
- Keep operating systems and software updated with the latest patches
- Use reputable antivirus and anti-malware solutions
- Don't download software or attachments from untrusted sources
- Implement network segmentation to contain infections
- Maintain regular offline backups

---

### 2.2 Phishing Attacks

**What it is:**  
Phishing is a social engineering attack where attackers impersonate a trusted entity to trick users into revealing sensitive information like passwords, credit card numbers, or session tokens.

**Types of Phishing:**
- **Email Phishing** — Mass emails sent to thousands of targets with fake links
- **Spear Phishing** — Targeted attacks aimed at specific individuals
- **Whaling** — Spear phishing aimed at C-level executives (CEO, CFO)
- **Smishing** — Phishing through SMS text messages
- **Vishing** — Phishing through phone calls

**Real-world examples:**

*Classic Case:*  
Google and Facebook Phishing (2013-2015) — A Lithuanian man impersonated a hardware manufacturer and sent fake invoices. He stole over $100 million through this Business Email Compromise (BEC) scheme.

*Recent Case:*  
Arup Deepfake Phishing (January 2026) — Attackers used AI-generated deepfake video to impersonate a senior executive of Arup on a live video call. An employee was tricked into authorizing a $25 million wire transfer. AI has taken phishing from fake emails to real-time video impersonation.

*Recent Case:*  
Carnival Cruise Line (April 2026) — A social engineering attack targeted a single employee, giving attackers access to IT systems. The breach exposed names, addresses, passport numbers, and payment details of millions of loyalty program members. One employee was all it took.

**Countermeasures:**
- Train employees to recognize phishing emails
- Implement email filtering and anti-phishing solutions
- Enable Multi-Factor Authentication (MFA) on all accounts
- Use DMARC, DKIM, and SPF email authentication protocols
- Never click links in unexpected emails

---

### 2.3 Man-in-the-Middle (MitM) Attacks

**What it is:**  
A MitM attack occurs when an attacker secretly intercepts and possibly alters communication between two parties who believe they are communicating directly with each other.

**Common techniques:**
- **ARP Spoofing** — Attacker sends fake ARP messages to link their MAC address with another host's IP
- **DNS Spoofing** — Corrupts the DNS cache to redirect traffic to a malicious server
- **SSL Stripping** — Downgrades HTTPS to HTTP so the attacker can read traffic in plaintext
- **Wi-Fi Eavesdropping** — Attacker sets up a rogue access point (Evil Twin)

**Real-world examples:**

*Classic Case:*  
Superfish (2015) — Lenovo shipped laptops with pre-installed adware that installed its own root certificate, allowing interception of all HTTPS traffic.

*Recent Case:*  
Operation Cyber Guardian — Singapore Telco Siege (February 2026) — The state-sponsored group UNC3886 compromised all four major Singapore telecom providers using zero-day exploits and rootkits. They intercepted and monitored communications at the national level for months. It took an 11-month counter-operation to fully evict them.

**Countermeasures:**
- Always use HTTPS and verify SSL certificates
- Use VPN on public or untrusted networks
- Enable HSTS on web servers
- Use static ARP entries on critical systems
- Implement 802.1X network access control

---

### 2.4 Denial of Service (DoS) and Distributed Denial of Service (DDoS)

**What it is:**  
A DoS attack floods a target with excessive traffic, making it unavailable to legitimate users. DDoS uses thousands of compromised devices (botnets) to amplify the attack.

**Types of DDoS attacks:**
- **Volumetric Attacks** — Flood the network bandwidth (UDP flood, DNS amplification)
- **Protocol Attacks** — Exploit weaknesses in network protocols (SYN flood, Ping of Death)
- **Application Layer Attacks** — Target specific applications (HTTP flood, Slowloris)

**Real-world examples:**

*Classic Case:*  
Mirai Botnet DDoS (2016) — Infected IoT devices launched a 1.2 Tbps attack against Dyn DNS, taking down Twitter, Netflix, Reddit, GitHub, and Spotify.

*Recent Case:*  
Aisuru-Kimwolf Botnet Record Attack (December 2025) — Set a new world record with a 31.4 Tbps DDoS attack — more than 26x larger than Mirai. Leveraged hundreds of thousands of compromised residential IoT devices. DDoS volumes in 2025 more than doubled compared to 2024.

*Recent Case:*  
Poland Energy Grid Attack (January 2026) — A coordinated DDoS attack targeted 30 energy grid sites across Poland simultaneously. DDoS is now being used as a weapon against critical national infrastructure.

**Countermeasures:**
- Use DDoS mitigation services (Cloudflare, AWS Shield, Akamai)
- Implement rate limiting and traffic filtering
- Configure SYN cookies to handle SYN floods
- Monitor network traffic for unusual patterns
- Change default credentials on all IoT devices

---

### 2.5 SQL Injection

**What it is:**  
SQL Injection is an attack where malicious SQL code is inserted into application input fields to manipulate the backend database.

**Types:**
- **In-Band SQLi** — Error-based and UNION-based
- **Blind SQLi** — Boolean-based and time-based
- **Out-of-Band SQLi** — Uses DNS or HTTP to extract data

**Real-world examples:**

*Classic Case:*  
Heartland Payment Systems (2008) — Attackers used SQL injection to steal 130 million credit card numbers, costing over $140 million in settlements.

*Recent Case:*  
BeyondTrust / US Treasury Breach (January 2025) — Attackers exploited a SQL injection flaw (CVE-2025-1094) in BeyondTrust's Privileged Remote Access platform used by the US Treasury Department. Despite SQL injection being a known vulnerability for over 20 years, it was still found in a product used by the US government — proving SQLi remains one of the most dangerous threats in 2025.

**Countermeasures:**
- Use parameterized queries (prepared statements)
- Implement input validation and sanitization
- Apply least privilege on database accounts
- Deploy a Web Application Firewall (WAF)

---

### 2.6 DNS Attacks

**What it is:**  
DNS attacks target the DNS infrastructure to redirect traffic, disrupt services, or intercept communications.

**Types:**
- **DNS Spoofing/Cache Poisoning** — Injects fake DNS records to redirect users
- **DNS Tunneling** — Encodes data inside DNS queries to bypass firewalls
- **DNS Hijacking** — Changes DNS settings by compromising registrar accounts
- **DNS Amplification** — Sends small queries with spoofed IPs to flood the victim

**Real-world examples:**

*Classic Case:*  
Sea Turtle (2017-2019) — State-sponsored group hijacked DNS records of government and military organizations across the Middle East.

*Recent Case:*  
Sitting Ducks DNS Hijacking (2025-2026) — Over 1 million domains were vulnerable to a DNS hijacking technique exploiting misconfigured DNS delegations. Attackers could take full control of domains without accessing the owner's registrar account. Multiple threat groups actively exploited this to redirect traffic and distribute malware.

**Countermeasures:**
- Implement DNSSEC to validate DNS responses
- Use DNS-over-HTTPS (DoH) or DNS-over-TLS (DoT)
- Monitor DNS query logs for unusual patterns
- Lock DNS registrar accounts with MFA

---

### 2.7 Insider Threats

**What it is:**  
An insider threat comes from people within the organization who have authorized access and misuse it intentionally or accidentally.

**Types:**
- **Malicious Insider** — Intentional data theft or sabotage
- **Negligent Insider** — Accidental breach through carelessness
- **Compromised Insider** — Account taken over by external attacker

**Real-world examples:**

*Classic Case:*  
Edward Snowden (2013) — NSA contractor who copied and leaked classified documents revealing mass surveillance programs.

*Recent Case:*  
NYC Health + Hospitals Breach (Late 2025 - February 2026) — Unauthorized actors gained access through a compromised third-party vendor account and maintained access for several months undetected. They exfiltrated medical records, financial data, and biometric information. A legitimate vendor account was used as the entry point, bypassing perimeter security entirely.

**Countermeasures:**
- Implement least privilege access
- Monitor user activity with SIEM tools
- Use Data Loss Prevention (DLP) solutions
- Conduct background checks on employees with sensitive access

---

### 2.8 Zero-Day Exploits

**What it is:**  
A zero-day exploit targets a vulnerability unknown to the vendor with no patch available. These are the most dangerous because there is no defense until the vulnerability is discovered and patched.

**Real-world examples:**

*Classic Case:*  
Log4Shell (2021) — Critical zero-day in Apache Log4j allowing Remote Code Execution by sending a crafted string in a log message. Affected millions of applications including services by Apple, Amazon, and Twitter.

*Recent Case:*  
UNC3886 Singapore Telecom Zero-Days (February 2026) — The state-sponsored group used multiple zero-day exploits and custom rootkits to breach all four major Singapore telecom providers. The zero-days targeted network infrastructure firmware with no patches available. Attackers remained undetected for months, and it took an 11-month counter-operation to fully remove them.

**Countermeasures:**
- Keep all software updated and apply patches immediately
- Use Intrusion Detection/Prevention Systems (IDS/IPS)
- Implement application whitelisting
- Use sandboxing for untrusted applications
- Participate in bug bounty programs

---

## 3. Threat Landscape Summary

| Threat | Attack Vector | Impact | Difficulty |
|--------|--------------|--------|------------|
| Malware | Email, downloads, USB | Data loss, system damage, ransom | Medium |
| Phishing | Email, SMS, deepfake video | Credential theft, financial loss | Low |
| MitM | Network (ARP, DNS, Wi-Fi) | Data interception, session hijack | Medium |
| DDoS | Network flood (botnets) | Service downtime, revenue loss | Low-Medium |
| SQL Injection | Web application input | Data breach, full DB compromise | Low |
| DNS Attacks | DNS infrastructure | Traffic redirection, data theft | Medium-High |
| Insider Threats | Internal access | Data theft, sabotage | Varies |
| Zero-Day | Unknown vulnerabilities | Full system compromise | High |

---

## 4. 2025-2026 Threat Trends

| Trend | Details |
|-------|---------|
| **AI-Powered Attacks** | 80% of phishing emails now use AI. Deepfakes used for $25M fraud (Arup case) |
| **Hyper-Volumetric DDoS** | Record 31.4 Tbps attack. Residential IoT devices weaponized from inside ISP networks |
| **Credential-Based Access** | Attackers are "logging in" not "breaking in" — using stolen credentials and legitimate tools |
| **Operational Disruption** | Shift from data theft to paralyzing business operations and supply chains |
| **Geopolitical Hacktivism** | State-sponsored groups targeting telecom, energy, and government infrastructure |
| **84 Active Ransomware Groups** | Highest count since 2020. More fragmented, smaller, agile groups |

---

## 5. Defense-in-Depth Strategy

No single security measure can protect against all threats. Organizations should implement a defense-in-depth strategy with multiple layers:

- **Physical Security** — Locked server rooms, CCTV, access badges
- **Network Security** — Firewalls, IDS/IPS, VPN, network segmentation
- **Perimeter Security** — DMZ, WAF, DDoS protection
- **Endpoint Security** — Antivirus, EDR, patching
- **Application Security** — Secure coding, input validation, code reviews
- **Data Security** — Encryption, DLP, regular backups
- **User Security** — MFA, security awareness training, least privilege

---

## 6. Conclusion

Network security threats are constantly evolving. From simple phishing emails to AI-powered deepfake attacks and 31 Tbps DDoS floods, attackers use increasingly sophisticated techniques. The key to effective defense is understanding how these attacks work and implementing multiple layers of protection. Regular security assessments, employee training, timely patching, and incident response planning are essential for maintaining a strong security posture.

---

## References

- OWASP Top 10 — https://owasp.org/www-project-top-ten/
- MITRE ATT&CK Framework — https://attack.mitre.org/
- NIST Cybersecurity Framework — https://www.nist.gov/cyberframework
- CISA Alerts — https://www.cisa.gov/news-events/alerts
- CSIS Significant Cyber Incidents — https://www.csis.org/programs/strategic-technologies-program/significant-cyber-incidents
ENDOFFILE
