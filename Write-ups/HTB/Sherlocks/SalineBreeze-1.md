---
tags:
  - writeup/htb
  - ctf
  - threat-intelligence
  - apt
  - salt-typhoon
  - cve-2022-3236
---

# SalineBreeze-1


## Mitre Attack & Cisco Talos

https://blog.talosintelligence.com/salt-typhoon-analysis/

**Starting with the MITRE ATT&CK page, which country is thought be behind Salt Typhoon?
- China https://attack.mitre.org/groups/G1045/
**According to that page, Salt Typhoon has been active since at least when? (Year)
- 2019 https://attack.mitre.org/groups/G1045/
**What kind of infrastructure does Salt Typhoon target?
- network https://home.treasury.gov/news/press-releases/jy2792
**Salt Typhoon has been associated with multiple custom built malware, what is the name of the malware associated with the ID S1206?
- JumbledPath https://attack.mitre.org/software/S1206/
**What operating system does this malware target?
- Linux  https://attack.mitre.org/software/S1206/
**What programming language is the malware written in?
- GO https://attack.mitre.org/software/S1206/
**On which vendor's devices does the malware act as a network sniffer?
- cisco https://blog.talosintelligence.com/salt-typhoon-analysis/
**The malware can perform 'Indicator Removal' by erasing logs. What is the MITRE ATT&CK ID for this?** 
- T1070.002 https://attack.mitre.org/techniques/T1070/002/
**On December 20th, 2024, Picus Security released a blog on Salt Typhoon detailing some of the CVEs associated with the threat actor. What was the CVE for the vulnerability related to the Sophos Firewall?** 
- CVE-2022-3236 https://www.picussecurity.com/resource/blog/salt-typhoon-telecommunications-threat
**The blog demonstrates how the group modifies the registry to obtain persistence with a backdoor known as Crowdoor. Which registry key do they target?
- HKCU\Software\Microsoft\Windows\CurrentVersion\Run"
**On November 25th, 2024, TrendMicro published a blog post detailing the threat actor. What name does this blog primarily use to refer to the group?
- [Earth Estries](https://www.trendmicro.com/en_us/research/23/h/earth-estries-targets-government-tech-for-cyberespionage.html "open on a new tab")
**The blog post identifies additional malware attributed to the threat actor. Which malware do they describe as a 'multi-modular backdoor...using a custom protocol protected by Transport Layer Security'
- telcom.grishamarkovgf8936.workers.dev
**What is the filename for the first GET request to the C&C server used by the malware?

**Communication protocol**

The communication requests that are used by the GHOSTSPIDER stager follow a common format. A connection ID is placed in the HTTP header's cookie as “phpsessid”. The connection ID is calculated using CRC32 or CRC64 with UUID4 values. Figure 10 shows an example of a stager's first request to the C&C server. 

![Figure 10. Example of a stager's first request to the C&C server](https://www.trendmicro.com/content/dam/trendmicro/global/en/research/24/k/earth-estries/EarthEstries-Fig10.jpg)

## Attack Summary

This investigation focuses on the threat actor known as **Salt Typhoon**, a state-linked group associated with China.

The group targets:

- network infrastructure
- telecom environments
- enterprise systems

They leverage:

- custom malware (e.g. `JumbledPath`)
- exploitation of known vulnerabilities (e.g. CVE-2022-3236)
- persistence mechanisms (registry modification)
- log deletion for defense evasion

The attack pattern is consistent with:

> **advanced persistent threat (APT) activity focused on cyber-espionage**

---

## Timeline

- **Since at least 2019**
    - Initial activity of Salt Typhoon
- **Ongoing campaigns**
    - Targeting of network infrastructure
    - Deployment of custom malware (`JumbledPath`)
- **Persistence techniques observed**
    - Registry key modification:
        - `HKCU\Software\Microsoft\Windows\CurrentVersion\Run`
- **2024 publications**
    - Cisco Talos → technical analysis
    - TrendMicro → attribution as _Earth Estries_
    - Picus Security → CVE exploitation details

---

## Threat Context

Salt Typhoon is assessed as a **nation-state threat actor**, likely operating in support of Chinese strategic interests.

Observed capabilities:

- development of custom malware (Go-based, Linux targeting)
- network-level monitoring (sniffing on Cisco devices)
- use of encrypted custom C2 protocols
- log manipulation for stealth (`T1070.002`)

Aliases:

- Salt Typhoon
- Earth Estries

This threat actor focuses on:

> **long-term access to critical infrastructure for intelligence gathering**

Unlike opportunistic attackers, this group demonstrates:

- persistence
- stealth
- targeted operations

---

## Remediation (CERT-style)

### Immediate actions

- Identify and isolate affected systems
- Apply patches for known vulnerabilities:
    - CVE-2022-3236 (Sophos Firewall)
- Block known malicious infrastructure

---

### Detection & investigation

- Monitor for:
    - unusual network traffic on infrastructure devices
    - unauthorized sniffing activity
- Investigate:
    - registry persistence keys
    - abnormal process execution

---

### Hardening

- Restrict administrative access to network devices
- Implement strict access control policies
- Segment critical infrastructure

---

### Monitoring & detection

- Enable logging on:
    - network devices
    - authentication systems
- Detect:
    - log deletion attempts (MITRE T1070.002)
    - suspicious registry modifications

---

### Long-term prevention

- Implement threat intelligence integration (IOC feeds)
- Regularly patch exposed services and appliances
- Deploy EDR / NDR solutions
- Conduct continuous monitoring of critical infrastructure

