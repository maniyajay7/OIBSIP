#!/bin/bash
echo "========================================="
echo "  UFW Firewall Configuration Script"
echo "  Author: Jay Maniya"
echo "========================================="

sudo apt update -y && sudo apt install ufw -y
sudo ufw --force reset
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw deny http
sudo ufw --force enable

echo "========================================="
echo "  FIREWALL STATUS"
echo "========================================="
sudo ufw status verbose
sudo ufw status numbered

echo ""
echo "  - Default incoming: DENY"
echo "  - Default outgoing: ALLOW"
echo "  - Port 22 (SSH):    ALLOWED"
echo "  - Port 80 (HTTP):   DENIED"
echo "========================================="
