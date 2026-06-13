#!/bin/bash
# ============================================================================
# Wireshark Traffic Capture & Analysis Script
# Task 8: Network Traffic Analysis using Wireshark/tshark
# Author: Jay Maniya
# Oasis Infobyte — Cybersecurity Internship 2026
# ============================================================================

echo "========================================="
echo "  Wireshark Traffic Capture & Analysis"
echo "  Author: Jay Maniya"
echo "========================================="
echo ""

# ---- CONFIGURATION ----
INTERFACE="eth0"
CAPTURE_DIR="/home/yumdvr/Downloads/OIBSIP/Task-8_Wireshark_Capture"
CAPTURE_FILE="${CAPTURE_DIR}/capture.pcap"
DURATION=60

echo "[*] Detecting available network interfaces..."
echo ""
tshark -D
echo ""

read -p "[?] Enter the interface to capture on (e.g., eth0, wlan0, any): " INTERFACE
echo ""

# ============================================================================
# PHASE 1: LIVE TRAFFIC CAPTURE
# ============================================================================

echo "========================================="
echo "  PHASE 1: LIVE TRAFFIC CAPTURE"
echo "========================================="
echo ""

echo "[*] Capturing traffic on ${INTERFACE} for ${DURATION} seconds..."
echo "    Command: sudo tshark -i ${INTERFACE} -a duration:${DURATION} -w ${CAPTURE_FILE}"
echo ""
sudo tshark -i "${INTERFACE}" -a duration:${DURATION} -w "${CAPTURE_FILE}"
echo ""
echo "[+] Capture saved to: ${CAPTURE_FILE}"
echo ""

# ============================================================================
# PHASE 2: PROTOCOL ANALYSIS
# ============================================================================

echo "========================================="
echo "  PHASE 2: PROTOCOL ANALYSIS"
echo "========================================="
echo ""

echo "[*] Analysis 1: Protocol Hierarchy Statistics"
echo "    Shows breakdown of all protocols captured"
echo "    Command: tshark -r ${CAPTURE_FILE} -q -z io,phs"
echo ""
tshark -r "${CAPTURE_FILE}" -q -z io,phs
echo ""

echo "-------------------------------------------"
echo ""

echo "[*] Analysis 2: Top Conversations (Endpoints)"
echo "    Shows which hosts communicated the most"
echo "    Command: tshark -r ${CAPTURE_FILE} -q -z conv,ip"
echo ""
tshark -r "${CAPTURE_FILE}" -q -z conv,ip
echo ""

echo "-------------------------------------------"
echo ""

echo "[*] Analysis 3: DNS Queries"
echo "    Shows all DNS domain lookups"
echo "    Command: tshark -r ${CAPTURE_FILE} -Y 'dns.qry.name' -T fields -e dns.qry.name | sort | uniq -c | sort -rn | head -20"
echo ""
tshark -r "${CAPTURE_FILE}" -Y 'dns.qry.name' -T fields -e dns.qry.name | sort | uniq -c | sort -rn | head -20
echo ""

echo "-------------------------------------------"
echo ""

echo "[*] Analysis 4: HTTP Requests"
echo "    Shows all HTTP GET/POST requests"
echo "    Command: tshark -r ${CAPTURE_FILE} -Y 'http.request' -T fields -e http.request.method -e http.host -e http.request.uri | head -20"
echo ""
tshark -r "${CAPTURE_FILE}" -Y 'http.request' -T fields -e http.request.method -e http.host -e http.request.uri | head -20
echo ""

echo "-------------------------------------------"
echo ""

echo "[*] Analysis 5: TCP SYN Packets (New Connections)"
echo "    Shows all new TCP connections initiated"
echo "    Command: tshark -r ${CAPTURE_FILE} -Y 'tcp.flags.syn==1 && tcp.flags.ack==0' -T fields -e ip.src -e ip.dst -e tcp.dstport | head -20"
echo ""
tshark -r "${CAPTURE_FILE}" -Y 'tcp.flags.syn==1 && tcp.flags.ack==0' -T fields -e ip.src -e ip.dst -e tcp.dstport | head -20
echo ""

echo "-------------------------------------------"
echo ""

echo "[*] Analysis 6: ARP Traffic"
echo "    Shows ARP requests and replies on the network"
echo "    Command: tshark -r ${CAPTURE_FILE} -Y 'arp' | head -20"
echo ""
tshark -r "${CAPTURE_FILE}" -Y 'arp' | head -20
echo ""

echo "-------------------------------------------"
echo ""

echo "[*] Analysis 7: TLS Handshakes (HTTPS Connections)"
echo "    Shows which servers were connected to via HTTPS"
echo "    Command: tshark -r ${CAPTURE_FILE} -Y 'tls.handshake.type==1' -T fields -e ip.dst -e tls.handshake.extensions_server_name | head -20"
echo ""
tshark -r "${CAPTURE_FILE}" -Y 'tls.handshake.type==1' -T fields -e ip.dst -e tls.handshake.extensions_server_name | head -20
echo ""

# ============================================================================
# PHASE 3: SUMMARY
# ============================================================================

echo "========================================="
echo "  PHASE 3: CAPTURE SUMMARY"
echo "========================================="
echo ""

TOTAL_PACKETS=$(tshark -r "${CAPTURE_FILE}" -q -z io,stat,0 2>/dev/null | grep -oP '\d+(?=\s*$)' | tail -1)
echo "[+] Total Packets Captured: $(tshark -r "${CAPTURE_FILE}" 2>/dev/null | wc -l)"
echo "[+] Capture File: ${CAPTURE_FILE}"
echo "[+] Capture Duration: ${DURATION} seconds"
echo "[+] Interface: ${INTERFACE}"
echo ""

echo "========================================="
echo "  ANALYSIS COMPLETE"
echo "========================================="
echo ""
echo "Open the capture file in Wireshark GUI for detailed inspection:"
echo "  wireshark ${CAPTURE_FILE}"
echo ""
echo "========================================="
