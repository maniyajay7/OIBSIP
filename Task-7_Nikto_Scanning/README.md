# Task 7: Vulnerability Scanning with Nikto

## 📌 Objective
Use Nikto — an open-source web server vulnerability scanner — to scan OWASP Juice Shop and identify security misconfigurations, outdated software, dangerous files, and common vulnerabilities.

## 🔧 What is Nikto?
Nikto is a command-line web server scanner that checks for:
- **6,700+ dangerous files/programs**
- **Outdated server software versions** with known CVEs
- **Server misconfigurations** (directory listing, default files)
- **Missing security headers** (X-Frame-Options, X-XSS-Protection, CSP)
- **Information disclosure** (server version, PHP version exposed)

It's a go-to tool for security analysts during the reconnaissance and vulnerability assessment phase of a penetration test.

## 🎯 Target
- **Application:** OWASP Juice Shop
- **Host:** 127.0.0.1 (localhost)
- **Port:** 42000
- **Nikto Version:** v2.6.0

## 📂 Scans Performed

| # | Scan Type | Command | Output File |
|---|-----------|---------|-------------|
| 1 | **Basic Vulnerability Scan** | `nikto -h http://127.0.0.1:42000/` | `nikto_basic_scan.txt` |
| 2 | **Tuned Scan (Injection & Auth)** | `nikto -h http://127.0.0.1:42000/ -Tuning 12349` | `nikto_tuned_scan.txt` |
| 3 | **Server-Level Scan** | `nikto -h http://localhost:42000` | `nikto_server_scan.txt` |

### Tuning Options Used
| Code | Category |
|------|----------|
| 1 | Interesting File / Seen in logs |
| 2 | Misconfiguration / Default File |
| 3 | Information Disclosure |
| 4 | Injection (XSS/Script/HTML) |
| 9 | SQL Injection |

---

## 🔍 Scan Results — Findings, Consequences & Remediation

Nikto reported **28 items** across all scans. Below is the breakdown of each critical finding, what it means from an attacker's perspective, and how to fix it.

### 🚨 Critical Findings

| # | Finding | Consequence | Solution |
|---|---------|-------------|----------|
| 1 | **`.htpasswd` file accessible** | This file stores username-password hashes for HTTP Basic Authentication. If an attacker downloads it, they can crack the hashes offline using tools like Hashcat or John the Ripper and gain direct access to protected areas. | Move `.htpasswd` outside the web root directory. Add a server rule to deny access: `<Files .htpasswd> Deny from all </Files>`. |
| 2 | **`PasswordsData.json` exposed** | A JSON file containing password data is directly accessible via the browser. An attacker simply navigates to the URL and downloads it — no exploitation needed. | Remove sensitive data files from the web root entirely. If the file is needed by the app, enforce authentication before serving it and restrict access with proper ACLs. |
| 3 | **`users.json` / `accounts.json` exposed** | Same issue — user account data is publicly browsable. Attackers get usernames, emails, and potentially hashed or plaintext credentials without any effort. | Never store user data in static JSON files served by the web server. Use a proper database with access controls. |
| 4 | **`.bash_history` / `.sh_history` accessible** | Shell command history files are being served by the web server. These files can contain previously typed commands, including passwords, API keys, database credentials, and internal server paths typed by administrators. | Ensure the web root does not overlap with any user's home directory. Set `HISTFILE=/dev/null` for service accounts. Block access to dotfiles in the server config. |

### ⚠️ High Severity Findings

| # | Finding | Consequence | Solution |
|---|---------|-------------|----------|
| 5 | **`access-control-allow-origin: *`** (Open CORS) | The server allows any website on the internet to make cross-origin requests to it. An attacker can host a malicious page that silently makes API calls to this server using a victim's browser session, stealing data or performing actions on their behalf. | Replace the wildcard `*` with specific trusted domains. For example: `Access-Control-Allow-Origin: https://yourdomain.com`. Never use `*` in production. |
| 6 | **JAMonAdmin.jsp — CVE-2013-6235** (XSS) | The JAMon Application Monitor admin interface is exposed and contains a known Cross-Site Scripting vulnerability. An attacker can inject malicious JavaScript that executes in the browser of anyone who visits the admin page, potentially stealing session tokens or performing admin actions. | Remove or restrict access to admin monitoring interfaces. If JAMon is needed, update to a patched version and restrict access to internal IPs only. |
| 7 | **`.mysql_history` accessible** | MySQL command history is served by the web server. This file can contain raw SQL queries, including `CREATE USER`, `GRANT`, and `INSERT` statements with plaintext passwords and database structure details. | Block all dotfiles from being served. Add to server config: deny access to any file starting with a dot (`.`). |
| 8 | **`/ftp/` directory accessible** | An FTP directory is publicly browsable through the web server. Attackers can browse and download any files stored there, which may include backups, configuration files, or internal documents. | Disable directory listing. Restrict access to `/ftp/` via authentication or remove it from the web root entirely. |

### ⚠️ Medium Severity Findings

| # | Finding | Consequence | Solution |
|---|---------|-------------|----------|
| 9 | **Missing `Content-Security-Policy` header** | Without CSP, the browser has no restrictions on what scripts, styles, or resources can be loaded. This makes XSS attacks significantly easier — an injected script can load external malicious payloads freely. | Add a strict CSP header: `Content-Security-Policy: default-src 'self'; script-src 'self'`. This restricts the browser to only execute scripts from the same origin. |
| 10 | **Missing `Strict-Transport-Security` header** | Without HSTS, users can be downgraded from HTTPS to HTTP via SSL-stripping attacks (MITM). An attacker on the same network can intercept all traffic in plaintext. | Add: `Strict-Transport-Security: max-age=31536000; includeSubDomains`. This forces browsers to always use HTTPS for one year. |
| 11 | **Missing `X-Content-Type-Options` header** | Without this header, browsers may "sniff" the MIME type of a response and interpret a file differently than intended. An attacker could upload a file disguised as an image that the browser executes as JavaScript. | Add: `X-Content-Type-Options: nosniff`. This tells the browser to trust the declared Content-Type and not guess. |
| 12 | **Missing `Referrer-Policy` header** | The browser sends the full URL (including query parameters with tokens, session IDs, or sensitive data) to external sites via the Referer header when a user clicks a link. | Add: `Referrer-Policy: strict-origin-when-cross-origin`. This limits what URL information is leaked to third parties. |
| 13 | **Missing `Permissions-Policy` header** | Without this header, the browser allows the page to use sensitive APIs like camera, microphone, geolocation, and payment by default. A successful XSS attack could silently activate these features. | Add: `Permissions-Policy: camera=(), microphone=(), geolocation=()`. This explicitly disables browser APIs the application doesn't need. |

### ℹ️ Low Severity Findings

| # | Finding | Consequence | Solution |
|---|---------|-------------|----------|
| 14 | **`robots.txt` found** | While not a vulnerability itself, `robots.txt` reveals directory paths that the site owner wants hidden from search engines. Attackers use this as a reconnaissance shortcut to find admin panels, backup directories, and sensitive areas. | Don't rely on `robots.txt` for security. Use proper authentication and access controls instead. |
| 15 | **`x-recruiting` header found** | The application includes a custom `x-recruiting` header (common in Juice Shop). This is informational, but in a real app, custom headers can leak internal information about the technology stack. | Remove unnecessary custom headers in production deployments. |
| 16 | **Multiple `.json` config files exposed** (`login.json`, `master.json`, `connections.json`, `conndb.json`, `conn.json`) | Configuration files may reveal database connection strings, API endpoints, internal service URLs, and authentication mechanisms. This gives attackers a detailed blueprint of the backend architecture. | Never place configuration files in the web root. Store configs outside the document root and load them via the application backend. |

---

## 📊 Scan Summary

| Metric | Value |
|--------|-------|
| **Total Requests Sent** | ~8,800 per scan |
| **Items Found** | 28 per scan |
| **Scan Duration** | ~90-127 seconds per scan |
| **Critical Findings** | 4 (credential/data files exposed) |
| **High Findings** | 4 (open CORS, known CVE, history files, open directory) |
| **Medium Findings** | 5 (missing security headers) |
| **Low Findings** | 3 (robots.txt, custom headers, config files) |

---

## 📂 Files in This Directory
- `nikto_scan.sh` — Automated scan script (runs all 3 scans)
- `nikto_basic_scan.txt` — Basic vulnerability scan results
- `nikto_tuned_scan.txt` — Injection-focused scan results
- `nikto_server_scan.txt` — Server-level scan results
- `screenshots/` — Terminal screenshots
- `README.md` — This file

## ▶️ How to Run
```bash
chmod +x nikto_scan.sh
sudo bash nikto_scan.sh
```

## 👤 Author
**Jay Maniya**  
Oasis Infobyte — Cybersecurity Internship (2026)
