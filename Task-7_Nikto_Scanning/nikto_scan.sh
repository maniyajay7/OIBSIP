#!/bin/bash
# ============================================================================
# Nikto Vulnerability Scanner Script
# Task 7: Vulnerability Scanning with Nikto
# Author: Jay Maniya
# Oasis Infobyte — Cybersecurity Internship 2026
# ============================================================================

figlet "Jay Maniya"
echo ""
echo "Task 7: Vulnerability Scanning with Nikto"
echo ""

echo "========================================="
echo "  Nikto Vulnerability Scanner"
echo "  Target: OWASP Juice Shop (localhost:3000)"
echo "  Author: Jay Maniya"
echo "========================================="
echo ""

# Step 1: Check if Nikto is installed
echo "[*] Step 1: Checking if Nikto is installed..."
if command -v nikto &> /dev/null; then
    echo "[+] Nikto is installed."
    nikto -Version
else
    echo "[-] Nikto not found. Installing..."
    sudo apt update -y && sudo apt install nikto -y
    echo "[+] Nikto installed successfully."
fi
echo ""

# Step 2: Basic scan against OWASP Juice Shop
echo "========================================="
echo "  SCAN 1: Basic Vulnerability Scan"
echo "========================================="
echo ""
echo "[*] Running: nikto -h http://localhost:3000/"
echo "[*] This scans for common vulnerabilities, misconfigurations,"
echo "    outdated software, and dangerous files/directories."
echo ""
nikto -h http://localhost:3000/ -o /home/yumdvr/Downloads/OIBSIP/Task-7_Nikto_Scanning/nikto_basic_scan.txt -Format txt
echo ""
echo "[+] Basic scan complete. Results saved to nikto_basic_scan.txt"
echo ""

# Step 3: Scan with specific tuning options
echo "========================================="
echo "  SCAN 2: Tuned Scan (Injection & Auth)"
echo "========================================="
echo ""
echo "[*] Running: nikto -h http://localhost:3000/ -Tuning 1 2 3 4 9"
echo ""
echo "[*] Tuning options:"
echo "    1 = Interesting File / Seen in logs"
echo "    2 = Misconfiguration / Default File"
echo "    3 = Information Disclosure"
echo "    4 = Injection (XSS/Script/HTML)"
echo "    9 = SQL Injection"
echo ""
nikto -h http://localhost:3000/ -Tuning 12349 -o /home/yumdvr/Downloads/OIBSIP/Task-7_Nikto_Scanning/nikto_tuned_scan.txt -Format txt
echo ""
echo "[+] Tuned scan complete. Results saved to nikto_tuned_scan.txt"
echo ""

# Step 4: SSL/TLS check (against localhost on port 3000 if available)
echo "========================================="
echo "  SCAN 3: Port & Header Analysis"
echo "========================================="
echo ""
echo "[*] Running: nikto -h http://localhost:3000"
echo "[*] Scanning the root web server for server-level issues."
echo ""
nikto -h http://localhost:3000 -o /home/yumdvr/Downloads/OIBSIP/Task-7_Nikto_Scanning/nikto_server_scan.txt -Format txt
echo ""
echo "[+] Server scan complete. Results saved to nikto_server_scan.txt"
echo ""

# Step 5: Display summary
echo "========================================="
echo "  SCAN COMPLETE — RESULTS SUMMARY"
echo "========================================="
echo ""
echo "Scan results saved to:"
echo "  1. nikto_basic_scan.txt    — Full OWASP Juice Shop vulnerability scan"
echo "  2. nikto_tuned_scan.txt    — Injection & misconfiguration focus"
echo "  3. nikto_server_scan.txt   — Server-level analysis"
echo ""
echo "Common findings to look for:"
echo "  - Missing security headers (X-Frame-Options, X-XSS-Protection)"
echo "  - Server version disclosure (Apache, PHP version exposed)"
echo "  - Directory listing enabled"
echo "  - Default/backup files accessible"
echo "  - Outdated software versions with known CVEs"
echo ""
echo "========================================="
echo "  Task 7 Complete!"
echo "========================================="
