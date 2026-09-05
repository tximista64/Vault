---
tags:
  - writeup/htb
  - ctf
  - osint
  - whois
  - domain-analysis
---

## OSINT Investigation Challenge

Progress: 9/9 completed

WHOIS AnalysisEasy

### Question 1: What is the registrant's email address from the WHOIS record?

**Explanation:** Email addresses in WHOIS records often reveal patterns in threat actor infrastructure. Disposable email services like tempmail.com are red flags for malicious domains.

Contact IntelligenceEasy

### Question 2: What is the complete phone number including country code?

**Explanation:** Phone numbers are crucial pivot points in OSINT investigations. The same number across multiple domains indicates shared ownership or campaign infrastructure.

Temporal AnalysisMedium

### Question 3: When was the domain created? (Format: YYYY-MM-DD)

**Explanation:** Domain creation dates help establish campaign timelines. Clusters of domains registered around the same time often indicate coordinated malicious activity.

Entity ResearchMedium

### Question 4: What is the exact organization name from WHOIS?

**Explanation:** Organization names in WHOIS can be fabricated, but they provide searchable intelligence. The 'LLC' designation suggests an attempt to appear legitimate.

Geolocation IntelligenceEasy

### Question 5: What city is listed in the registrant's address?

**Explanation:** Geographic information helps build threat actor profiles. San Jose's proximity to Silicon Valley makes it a common choice for tech-related social engineering campaigns.

Technical AnalysisHard

### Question 6: What is the domain's transfer status?

**Explanation:** Domain status codes reveal security posture. 'clientTransferProhibited' prevents unauthorized transfers but is also used by threat actors to maintain control of malicious domains.

Entity ResearchMedium

### Question 7: What company is being targeted?

WHOIS AnalysisEasy

### Question 8: What email service is the threat actor using?

Technical AnalysisEasy

### Question 9: How many GitHub Pages IPs are configured?

