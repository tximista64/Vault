---
tags:
  - siem
  - phishing
  - email-analysis
  - malware-analysis
  - incident-response
  - course/lets-defend
---

# Email Analysis



In this section, we will 
analyze emails to gather information relevant to our investigation, as 
emails are often a key source of evidence and provide valuable insight 
into potential security threats.

## Navigating to Email Security

To begin the email 
analysis, navigate to the Email Security tab. This section provides 
tools and features for examining emails in detail.

- Click on the email security tab.
- Use the search bar to find the email related to the investigation.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/How+to+investigate+SIEM+alert/4.Email+Analysis/image4_1.png)

### Using Detailed Search

Use the detailed search 
bar in the Email Security tab to find the specific email related to the 
investigation. Fill in the following fields as needed:

- Sender
- Recipient
- Subject
- Sender IP Address
- Attachment Name
- Email Body
- Date
- Action

### Examining Email Content

Once you've found the 
email in question, examine it to find the answers to the last two 
questions in the first step of the playbook.

- Is the content of the email suspicious?
- Are there any attachments?

**Steps to follow**:

- Click on the email to see its content.
- Review the email body, attachments, sender information, and other details.
- Scroll down to view any attachments.

## Continue the Playbook

Once you have gathered the information you need, make a note of it to complete this step.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/How+to+investigate+SIEM+alert/4.Email+Analysis/image4_2.png)

- Head back to the playbook.
- Click Next to proceed to the next step of the playbook.

### Next Step of the Playbook

The next step instructs us to check for attachments or URLs in the email.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/How+to+investigate+SIEM+alert/4.Email+Analysis/image4_3.png)

**To determine this**:

- **Look for attachments:** Look at the bottom of the email to see if there are any attached files.
- **Review the body of the email:** Check the text to see
if it contains any hyperlinks. Hyperlinks can lead to malicious websites or downloads, so it’s important to identify and analyze them.

### Analyze URLs/Attachments

The next step of the 
playbook is about analyzing URLs/Attachments. If the email contains any 
attachments or URLs, it is crucial to analyze them using third-party 
sandboxes. These sandboxes allow us to safely check if the content is 
malicious without putting our systems at risk.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/How+to+investigate+SIEM+alert/4.Email+Analysis/image4_4.png)

**Note**: It is recommended to 
use a virtual machine to download the attachments or files provided by 
alerts, as they may contain malware. You can use a sandbox for this 
purpose. The password for the zip files is always "
  **infected**" unless stated otherwise.

Follow these steps:

- **Download Attachment/s:** Download the email attachment.
- **Analyze URLs/Attachments:** Use the provided tools to check the safety of attachments and URLs.

**You can use the following free products/services:**

- [**AnyRun](https://app.any.run/):** An interactive malware analysis service, sandbox.
- [**VirusTotal](https://www.virustotal.com/):** A service that analyzes files and URLs for viruses.
- [**URLHouse](https://urlhaus.abuse.ch/):** A database of malicious URLs.
- [**URLScan](https://urlscan.io/):** A tool for scanning and analyzing websites.
- [**HybridAnalysis](https://www.hybrid-analysis.com/):** A free malware analysis service.

If you are unfamiliar with using these tools, you can check out our 
  [VirusTotal for SOC Analysts](https://app.letsdefend.io/training/lessons/virustotal-for-soc-analysts) course.

**If the content is malicious:**

- Click "Malicious" to indicate that the content poses a threat.

**If the content is not malicious:**

- Click "Non-malicious" to indicate that the content is safe.

Alternatively, you can 
use sandbox machines in LetsDefend for static analysis. These machines 
contain various malware analysis tools and are safe to use.

**Sandbox**: “
  [https://app.letsdefend.io/sandbox](https://app.letsdefend.io/sandbox)”

![](https://ld-images-2.s3.us-east-2.amazonaws.com/How+to+investigate+SIEM+alert/4.Email+Analysis/image4_5.png)

### Next Step of the Playbook

In the next step of the 
playbook, we need to find out if the email has been delivered to the 
user. To understand the reach and potential impact of the suspicious 
email, this step is critical.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/How+to+investigate+SIEM+alert/4.Email+Analysis/image4_6.png)

**Check if the mail was delivered to the user:**

To determine this, we 
need to examine the 'Device Action' part of the alert details, as this 
section provides information about the actions taken by the security 
system regarding the email.

Steps to follow:

**Navigate to Alert Details**

- Go back to the Alert Details page in the Investigation Channel.

**Check the "Device Action" Section**

- Find the part of the alert that details the actions taken by the security system.

**Determine the Email Delivery status**

- Look for entries that indicate whether the email was delivered or not. Common terms you might see include " **Allowed**", " **Deleted**" or " **Quarantined**".

**Answer the Playbook Question**

- Based on the information found in the "device action" section, determine if the email was delivered to the user.
- If the email was delivered, select " **Delivered**".
- If the email was not delivered, select " **Not Delivered**".

![](https://ld-images-2.s3.us-east-2.amazonaws.com/How+to+investigate+SIEM+alert/4.Email+Analysis/image4_7.png)

As you can see in the 
screenshot above, the Device Action section shows the action taken on 
the email. So if it is 'allowed', it means that the email reached the 
user. If it is 'Blocked' or 'Quarantined', it means that the email was 
intercepted and did not reach the user.

**Continue the Playbook**

After determining the email's delivery status, document your findings and continue to the next playbook step.

### Playbook Step 5

This step is crucial to prevent any damage that could be caused by the e-mail if it were to be accessed by the user.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/How+to+investigate+SIEM+alert/4.Email+Analysis/image4_8.png)

**Delete the Email from the Recipient**

To remove the malicious email from the recipient’s mailbox, follow these instructions:

**Navigate to the Email Security tab:**

- Return to the Email Security tab where you previously found the email.

**Locate the Suspicious Mail:**

- Use the search functionality to find the specific email that has been identified as malicious.

**Delete the Email:**

- Click on the email to open its detailed view.
- Delete the email by clicking the 'Delete' button at the top right of the Email Security panel.

**Continue the Playbook**

After successfully deleting the email, document the action taken and proceed to the next step in the playbook:

- **Head back to the playbook**: Navigate back to the playbook to continue with the investigation process.

## Summary

In this section, we 
examined the content of a suspicious email to determine its potential 
threat and analyzed any URLs or attachments using third-party sandboxes.
 We also checked the delivery status of the email and ensured that any 
malicious emails were deleted from the recipient's mailbox to prevent 
any damage.

## Next Chapter

In the following section,
 we will continue our investigation by performing network and log 
analysis. This involves checking log data to see if anyone accessed the 
malicious file or URLs. We will look for connections to command and 
control (C2) addresses to identify any further indicators of compromise.
 Stay tuned as we delve deeper into the investigation process.

