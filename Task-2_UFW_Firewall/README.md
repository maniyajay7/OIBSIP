# Task 2: Basic Firewall Configuration with UFW

## 📌 Objective
Set up a basic firewall using UFW (Uncomplicated Firewall) on a Linux system to control incoming and outgoing network traffic.

## 🛠️ Tool Used
- **UFW (Uncomplicated Firewall)** — a user-friendly front-end for iptables
- **OS:** Linux (Debian-based)

## 🔧 What is UFW?
UFW stands for **Uncomplicated Firewall**. It is a simple command-line tool that makes it easy to manage firewall rules on Linux. Behind the scenes, it uses iptables — but UFW gives us a much simpler syntax to allow or deny traffic.

## 📡 Configuration Steps

### Step 1: Install UFW
```bash
sudo apt update && sudo apt install ufw -y
```

### Step 2: Reset to Clean State
```bash
sudo ufw reset
```
This removes any old rules so we start fresh.

### Step 3: Set Default Policies
```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```
- **Deny incoming** — blocks all incoming connections by default (secure baseline)
- **Allow outgoing** — allows the machine to connect to the internet normally

### Step 4: Allow SSH (Port 22)
```bash
sudo ufw allow ssh
```
SSH is needed for remote login. Without this rule, we would be locked out of the machine if connecting remotely.

### Step 5: Deny HTTP (Port 80)
```bash
sudo ufw deny http
```
HTTP traffic is unencrypted. Denying it forces the use of HTTPS (port 443), which is encrypted and more secure.

### Step 6: Enable the Firewall
```bash
sudo ufw enable
```

### Step 7: Verify the Rules
```bash
sudo ufw status verbose
sudo ufw status numbered
```

## 📊 Firewall Status Output

```
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), disabled (routed)
New profiles: skip

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW IN    Anywhere
80/tcp                     DENY IN     Anywhere
22/tcp (v6)                ALLOW IN    Anywhere (v6)
80/tcp (v6)                DENY IN     Anywhere (v6)
```

## 🔐 Explanation of Each Rule

| Rule | Port | Action | Why |
|------|------|--------|-----|
| SSH | 22/tcp | ALLOW | Allows remote login to the machine. Without SSH access, system administrators cannot manage the server remotely. |
| HTTP | 80/tcp | DENY | Blocks unencrypted web traffic. HTTP sends data in plain text, so passwords and sensitive information can be intercepted. Denying HTTP forces the use of HTTPS instead. |
| Default Incoming | All | DENY | Any port that is not explicitly allowed is automatically blocked. This is the most secure default policy. |
| Default Outgoing | All | ALLOW | The machine can still access the internet, download updates, and make outgoing connections normally. |

## 🧪 Testing the Configuration

### Test 1: HTTP Should Be Blocked
```bash
curl http://localhost
# Expected: Connection refused (port 80 is denied by firewall)
```

### Test 2: SSH Should Work
```bash
ssh localhost
# Expected: Asks for password (port 22 is allowed)
```

## 📂 Files in This Directory
- `ufw_configuration.sh` — Automated script that configures UFW with all rules
- `README.md` — This file
- `screenshots/` — Screenshots of UFW status output

## 🔄 Useful UFW Commands
| Command | What it does |
|---------|-------------|
| `sudo ufw status` | Show current rules |
| `sudo ufw disable` | Turn off the firewall |
| `sudo ufw delete 2` | Delete rule number 2 |
| `sudo ufw allow 443` | Allow HTTPS traffic |
| `sudo ufw reset` | Remove all rules |

## 👤 Author
**Jay Maniya**
Oasis Infobyte — Cybersecurity Internship (2026)
