# Task 6: Patch Management — Research Report

## 📌 Objective
Research and document what patch management is, why it matters, why it fails, real-world incidents caused by missing patches, and best practices for effective patch management.

## 📄 Report Contents

### Sections Covered

| # | Section | Description |
|---|---------|-------------|
| 1 | **Introduction** | What patch management is and why it matters |
| 2 | **Types of Patches** | Security patches, bug fixes, hotfixes, firmware updates, service packs |
| 3 | **Patch Management Lifecycle** | NIST SP 800-40r4 model — Inventory → Monitor → Prioritize → Test → Deploy → Verify |
| 4 | **Why Patch Management Fails** | Visibility gaps, patch fatigue, compatibility fear, legacy systems, resource shortage |
| 5 | **Real-World Incidents** | 5 major breaches caused by missing patches |
| 6 | **NIST Risk Response** | Mitigate, Accept, Transfer, Avoid |
| 7 | **Patch Management Tools** | WSUS, SCCM, Ansible, Puppet, Linux package managers |
| 8 | **2025-2026 Trends** | 48K+ CVEs, 15-min exploitation window, autonomous patching, SBOM |
| 9 | **Best Practices Checklist** | 12-point actionable checklist |

### Real-World Incidents

| Incident | Year | What Went Wrong | Cost/Impact |
|----------|------|----------------|-------------|
| **WannaCry** | 2017 | Patch available 2 months before attack, not applied | 200K+ systems, $4B damages |
| **Equifax** | 2017 | Apache Struts patch ignored for 5 months | 147M records stolen, $1.4B settlement |
| **Log4Shell** | 2021 | Hidden dependency — orgs didn't know they used Log4j | Millions of apps affected worldwide |
| **VMware vSphere** | 2025-2026 | Hypervisor patching delayed due to operational concerns | Entire VM clusters encrypted by ransomware |
| **Cisco SD-WAN** | 2026 | Network infrastructure overlooked in patching process | Active exploitation within days of CVE |

### Key Stats (2025-2026)
- 48,000+ CVEs published in 2025 (140/day)
- Attackers scan for unpatched systems within 15 minutes of CVE announcement
- Risk-based prioritization is replacing "patch everything" approach
- CISA KEV catalog is now the priority reference for patching decisions

## 📂 Files in This Directory
- `patch_management_report.md` — Full research report
- `README.md` — This file

## 👤 Author
**Jay Maniya**  
Oasis Infobyte — Cybersecurity Internship (2026)
