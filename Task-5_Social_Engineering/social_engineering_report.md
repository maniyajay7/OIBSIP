# Social Engineering Attacks — Research Report

**Author:** Jay Maniya  
**Date:** June 2026  
**Oasis Infobyte — Cybersecurity Internship**

---

## 1. Introduction

Social engineering is the art of manipulating people into giving up confidential information, performing actions, or making security mistakes. Unlike technical attacks that exploit software vulnerabilities, social engineering exploits the biggest vulnerability in any system — the human being.

According to recent data, the human element is involved in approximately **60% of all confirmed data breaches**. In 2025-2026, social engineering has evolved dramatically — attackers now use AI-generated deepfakes, voice cloning, and multi-channel approaches that make traditional awareness training insufficient.

This report covers the major types of social engineering attacks, the psychology behind them, classic and recent 2025-2026 case studies, and defense strategies.

---

## 2. The Psychology Behind Social Engineering

Social engineering works because it exploits fundamental human psychological traits. Understanding these principles helps recognize when an attack is happening.

### 2.1 Cialdini's 6 Principles of Influence

| Principle | How Attackers Use It | Example |
|-----------|---------------------|---------|
| **Authority** | Impersonate someone in power (CEO, IT admin, police) | "This is the IT department — I need your password to fix your account" |
| **Urgency** | Create time pressure so the victim doesn't think critically | "Your account will be locked in 15 minutes unless you verify now" |
| **Social Proof** | Make the victim believe others have already complied | "All employees have already completed this security update" |
| **Reciprocity** | Offer something first, then ask for a favor | "I fixed your printer issue — can you just let me into the server room?" |
| **Liking** | Build rapport and trust before making a request | Spending days chatting with an employee before asking for credentials |
| **Scarcity** | Make something seem limited or exclusive | "Only the first 50 employees get the new laptop — click here to claim" |

---

## 3. Types of Social Engineering Attacks

### 3.1 Phishing

**What it is:**  
The most common social engineering attack. Attackers send fraudulent messages (usually email) designed to trick the victim into clicking a malicious link, downloading malware, or entering credentials on a fake website.

**Types:**
- **Email Phishing** — Mass emails sent to thousands of targets
- **Spear Phishing** — Highly targeted emails crafted for a specific person using OSINT (Open Source Intelligence)
- **Whaling** — Spear phishing specifically targeting C-level executives
- **Clone Phishing** — Attacker clones a legitimate email the victim has already received but replaces the attachment or link with a malicious one

**How it works:**
1. Attacker researches the target organization (website, LinkedIn, social media)
2. Creates a convincing email that mimics a trusted entity (bank, boss, vendor)
3. Email contains a malicious link or attachment
4. Victim clicks the link and enters credentials on a fake login page
5. Attacker captures the credentials and accesses the real account

**Real-world examples:**

*Classic Case:*  
Google and Facebook BEC (2013-2015) — Evaldas Rimasauskas impersonated Quanta Computer (a real hardware vendor) and sent fake invoices to Google and Facebook over two years. He stole over $100 million before being caught. This showed that even the world's biggest tech companies can fall for phishing.

*Recent Case:*  
AI-Powered Phishing Surge (2025-2026) — Over 80% of detected phishing emails in 2025 were generated using AI, leading to a 400% increase in successful phishing attacks. AI makes the emails grammatically perfect, highly personalized, and almost impossible to distinguish from legitimate communication.

*Recent Case:*  
Anthropic Claude Impersonation (April 2026) — Threat actors created fake websites and emails impersonating Anthropic's Claude AI services, targeting over 2,000 organizations. Similarly, attackers created a fraudulent GitHub repository mimicking "DeepSeek V4" to distribute information-stealing malware to developers who thought they were downloading a legitimate AI tool.

---

### 3.2 Vishing (Voice Phishing)

**What it is:**  
Vishing uses phone calls instead of emails to manipulate victims. The attacker calls the target and poses as a bank, tech support, government agency, or internal IT department to extract sensitive information or trick the victim into performing actions.

**How it works:**
1. Attacker spoofs the caller ID to show a legitimate number
2. Calls the victim posing as IT support, bank, or manager
3. Creates urgency — "Your account has been compromised" or "We need to verify your identity"
4. Asks for passwords, MFA codes, or directs victim to install remote access software
5. Uses the information to access the victim's systems or accounts

**Subcategory — TOAD (Telephone-Oriented Attack Delivery):**  
Attacker sends a phishing email with a phone number instead of a link. The email says something like "Your Norton subscription has been renewed for $399.99 — call this number to cancel." When the victim calls, the attacker guides them through installing remote access malware.

**Real-world examples:**

*Classic Case:*  
IRS Scam (2013-2018) — A massive vishing operation from call centers in India targeted US citizens. Callers impersonated IRS agents, threatening arrest if victims didn't pay "tax debts" immediately via gift cards or wire transfers. Over $300 million was stolen from thousands of victims before the operation was shut down.

*Recent Case:*  
HK$145M AI Voice Clone Crypto Scam (January 2025) — Fraudsters used AI voice cloning to impersonate a company's finance manager on WhatsApp. The AI-generated voice was so realistic that the victim transferred approximately HK$145 million (~$18.5M USD) to fraudulent cryptocurrency accounts. The attackers created the voice clone from publicly available recordings.

*Recent Case:*  
Vishing Overtakes Email (2025-2026) — Multiple security reports confirmed that vishing has overtaken email as the preferred social engineering vector for gaining initial access to corporate networks. Attackers call employees posing as IT helpdesk staff, reference real internal systems, and guide employees to malicious portals or request MFA codes.

---

### 3.3 Smishing (SMS Phishing)

**What it is:**  
Smishing uses text messages (SMS) to deliver social engineering attacks. The messages typically contain a link to a fake website or a phone number to call.

**Common smishing lures:**
- "Your package delivery failed — click here to reschedule"
- "Unusual activity detected on your bank account — verify here"
- "You've won a prize — claim it within 24 hours"
- "Your toll bill is overdue — pay now to avoid penalties"

**Real-world examples:**

*Classic Case:*  
USPS/FedEx Package Scams (2020-2023) — During and after the COVID-19 pandemic, SMS-based package delivery scams exploded. Attackers sent millions of texts impersonating USPS, FedEx, and Amazon, directing victims to fake tracking websites that harvested credit card information.

*Recent Case:*  
Toll Road Smishing Campaign (2025-2026) — A massive, coordinated smishing campaign targeted millions of users across the US, UK, and Europe with fake toll payment messages. The messages claimed unpaid tolls and linked to convincing replica payment portals. The campaign was linked to Chinese-language cybercrime groups operating Smishing-as-a-Service platforms.

---

### 3.4 Pretexting

**What it is:**  
Pretexting is the practice of creating a fabricated scenario (the "pretext") to trick the victim into providing information or performing an action. Unlike phishing, which often relies on a single email, pretexting involves building a story and often involves multiple interactions over time.

Pretexting accounted for over **50% of social engineering incidents** in recent data.

**How it works:**
1. Attacker researches the target using LinkedIn, social media, and company websites
2. Creates a believable identity — vendor, auditor, new employee, IT contractor
3. Contacts the victim and builds rapport over time
4. Eventually makes a request — wire transfer, credential sharing, or physical access
5. The request seems normal because the attacker has established trust

**Real-world examples:**

*Classic Case:*  
Hewlett-Packard Pretexting Scandal (2006) — HP hired private investigators who used pretexting to obtain phone records of journalists and HP board members. They impersonated the targets when calling phone companies to get detailed call logs. The scandal led to criminal charges and new privacy laws.

*Recent Case:*  
Multi-Stage Vendor Impersonation (2025-2026) — Modern pretexting attacks now involve multi-stage interactions where attackers spend days or even weeks building rapport with employees. They pose as vendors, reference real projects and internal systems discovered through LinkedIn and company blogs, then request payroll changes, wire transfers, or VPN credentials. The "Payroll Paydate Change" and "Leadership Request" pretexts became the most common patterns in 2025.

---

### 3.5 Baiting

**What it is:**  
Baiting exploits human curiosity or greed by offering something enticing — a free download, a USB drive, or a prize — that contains malware or leads to a credential-harvesting page.

**Types:**

**Physical Baiting:**
- Dropping infected USB drives in parking lots, lobbies, or cafés with labels like "Confidential — Q3 Payroll" or "Employee Layoff List 2026"
- When someone plugs it into their computer, malware automatically installs

**Digital Baiting:**
- Fake download links for popular software (Zoom, Outlook, VPN clients)
- "Free" movie or game downloads bundled with malware
- Malvertising — malicious ads on legitimate websites that redirect to exploit kits

**Real-world examples:**

*Classic Case:*  
US Department of Homeland Security USB Test (2011) — DHS deliberately dropped USB drives in government and contractor parking lots. 60% of the drives were plugged into company computers. When the drives had official-looking logos, the success rate jumped to 90%.

*Recent Case:*  
ClickFix Campaign (2025-2026) — A major digital baiting trend where users searching for legitimate software (like Zoom, Outlook, or security tools) are redirected to convincing clone websites. Instead of downloading the software, users are tricked into copying and pasting malicious PowerShell commands into their terminal under the guise of "verifying" they are human or "installing a security update." This bypasses antivirus because the user manually executes the malware.

---

### 3.6 Tailgating / Piggybacking

**What it is:**  
A physical social engineering attack where an unauthorized person follows an authorized employee through a secured door or gate. The attacker relies on social courtesy — people naturally hold doors open for others.

**How it works:**
1. Attacker approaches a secured entrance while an employee is entering
2. Pretends to be a delivery person, new employee, or someone with full hands
3. The employee holds the door open out of politeness
4. Attacker gains physical access to the facility

**Countermeasures:**
- Install mantrap/vestibule entrances that only allow one person at a time
- Train employees to politely challenge unfamiliar people
- Use badge-based access with anti-passback systems
- Deploy security cameras and guards at entry points

---

### 3.7 Quid Pro Quo

**What it is:**  
The attacker offers a service or favor in exchange for information. The name means "something for something" in Latin. It's similar to baiting, but instead of a physical item, the attacker offers help or a service.

**How it works:**
1. Attacker calls random employees posing as IT support
2. Offers to help with a "known issue" or "speed up their computer"
3. Asks the employee to disable their antivirus or install a "patch" (which is actually malware)
4. Or asks for their login credentials to "fix" the issue

---

### 3.8 Deepfake Social Engineering (NEW — 2025-2026)

**What it is:**  
A new category of social engineering that uses AI-generated synthetic media — deepfake videos, cloned voices, and fabricated images — to impersonate real people. This is the fastest-growing social engineering technique in 2025-2026.

**How it works:**
1. Attacker collects publicly available audio/video of the target person (YouTube, conference talks, social media)
2. Uses AI tools to create a realistic voice clone (only 3 seconds of audio is needed) or video deepfake
3. Calls or video-calls the victim while impersonating the executive or trusted person
4. Requests an urgent wire transfer, credential sharing, or access to sensitive systems

**Scale of the problem (2026):**
- Deepfakes account for an estimated **11% of all global fraudulent activity**
- **Deepfake-as-a-Service (DaaS)** platforms allow even low-skill attackers to launch convincing campaigns
- Voice clones can be created from as little as **3 seconds of audio**

**Real-world examples:**

*Case 1:*  
Multinational CFO Deepfake ($25.6M Loss) — Employees at a multinational firm joined a video conference call where every other participant was an AI-generated deepfake. The employee, trusting the visual and auditory cues of their "CFO" and colleagues, authorized multiple wire transfers totaling $25.6 million.

*Case 2:*  
Maine Municipal Deepfake Scam (2025) — Municipal officials were targeted by a combination of deepfake voice messages and highly personalized phishing emails. The attackers impersonated local officials, convincing staff to authorize unauthorized financial transfers.

**Countermeasures:**
- Implement multi-channel verification — always confirm requests through a separate, known communication channel
- Use code words or PINs for high-value transactions
- Deploy AI-powered deepfake detection tools
- Never authorize wire transfers based solely on a video or phone call
- Train employees to recognize that voice and video can now be faked

---

## 4. Social Engineering Attack Lifecycle

Every social engineering attack follows a predictable lifecycle:

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│ 1. RECON     │────▶│ 2. HOOK      │────▶│ 3. PLAY      │────▶│ 4. EXIT      │
│              │     │              │     │              │     │              │
│ Research the │     │ Establish    │     │ Execute the  │     │ Close the    │
│ target using │     │ contact and  │     │ attack —     │     │ interaction  │
│ OSINT, social│     │ build trust  │     │ get creds,   │     │ without      │
│ media, and   │     │ or create    │     │ wire money,  │     │ raising      │
│ public data  │     │ urgency      │     │ install      │     │ suspicion    │
│              │     │              │     │ malware      │     │              │
└──────────────┘     └──────────────┘     └──────────────┘     └──────────────┘
```

---

## 5. Social Engineering vs Technical Attacks

| Aspect | Social Engineering | Technical Attack |
|--------|--------------------|------------------|
| **Target** | People (the human layer) | Systems (software, hardware, network) |
| **Exploits** | Trust, fear, curiosity, urgency | Code vulnerabilities, misconfigurations |
| **Tools** | Phone, email, fake websites, deepfakes | Exploits, malware, scripts |
| **Defense** | Awareness training, verification procedures | Patching, firewalls, IDS/IPS |
| **Detection** | Very difficult — looks like normal activity | Easier — generates logs and alerts |
| **Success Rate** | Very high — humans are the weakest link | Varies — depends on security posture |

---

## 6. 2025-2026 Trends Summary

| Trend | Details |
|-------|---------|
| **AI-Powered Phishing** | 80%+ of phishing emails use AI. 400% increase in success rate |
| **Deepfake-as-a-Service** | Low-skill attackers can now launch deepfake attacks using commercial DaaS platforms |
| **Vishing > Email** | Voice phishing has overtaken email as the primary SE vector for corporate access |
| **ClickFix Attacks** | Users tricked into pasting malicious commands into their own terminals |
| **Multi-Channel Attacks** | Attackers blend email, voice, video, and SMS in coordinated campaigns |
| **3-Second Voice Clones** | AI can create convincing voice clones from just 3 seconds of audio |
| **60% of Breaches** | The human element is involved in ~60% of all confirmed data breaches |
| **Pretexting at 50%+** | Pretexting now accounts for over half of all social engineering incidents |

---

## 7. Defense Strategies

### 7.1 For Organizations

| Strategy | Implementation |
|----------|---------------|
| **Security Awareness Training** | Regular training that goes beyond "don't click links" — teach employees to recognize urgency manipulation, authority impersonation, and verification procedures |
| **Multi-Channel Verification** | For any request involving money, credentials, or access — verify through a separate, known channel (e.g., call back on a known number) |
| **Zero Trust Architecture** | Never trust, always verify. Even internal requests must be authenticated and authorized |
| **Simulated Attacks** | Conduct regular phishing and vishing simulations to test employee readiness |
| **Incident Response Plan** | Have a clear process for reporting suspected social engineering attempts |
| **Access Controls** | Implement least privilege, MFA, and role-based access to limit damage from compromised accounts |

### 7.2 For Individuals

- **Verify the caller/sender** — If someone calls claiming to be from IT or your bank, hang up and call back on the official number
- **Never share MFA codes** — No legitimate service will ever ask for your MFA/OTP code
- **Check URLs carefully** — Look for misspellings, extra characters, or unusual domains
- **Be suspicious of urgency** — If someone pressures you to act NOW, that itself is a red flag
- **Don't plug in unknown USB drives** — Even if found in your office
- **Limit personal information on social media** — Attackers use your posts for reconnaissance

---

## 8. Conclusion

Social engineering is the most effective attack method in cybersecurity because it targets the one vulnerability that cannot be patched — human psychology. In 2025-2026, the threat has evolved dramatically with AI-powered deepfakes, voice cloning, and multi-channel campaigns that make traditional defenses insufficient.

The key takeaway is that technology alone cannot stop social engineering. Organizations need a combination of security awareness training, verification procedures, zero trust architecture, and a culture where employees feel comfortable questioning suspicious requests — no matter how authoritative they seem.

---

## References

- Verizon DBIR 2025 — https://www.verizon.com/business/resources/reports/dbir/
- MITRE ATT&CK: Social Engineering — https://attack.mitre.org/
- KnowBe4 Social Engineering Report — https://www.knowbe4.com/
- SANS Social Engineering Framework — https://www.social-engineer.org/
- CISA Social Engineering Awareness — https://www.cisa.gov/topics/cybersecurity-best-practices
