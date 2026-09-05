---
tags:
  - splunk
  - siem
  - soc
  - course/lets-defend
---

# Splunk Reports


### What is a Report?

Basically, reports are saved search results. Reports can be scheduled or can be executed when needed.

### Exercise

For this part, we are going to use a simple request to find connections failed with account that contain admin. Our request is: *source="WinEventLog:*" index="winlog_clients" EventCode=4625 AND Nom_du_compte=Admin*

Maybe you need to change the "Nom_du_compte" to "accountname".

- Try your request in the search bar

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/report1.png)

- Goes to the Save As menu and select

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/report2.png)

- Give a title and a description of your report

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/report3.png)

- Save and go to View

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/report4.png)

### Edit or Delete an Existing Report

- From the Search App, go to the Reports sections

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/report5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/report6.png)

Here you can find all existing reports.

- Select the report created a few minutes ago.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/report7.png)

- From here you can see information about your report.
- Select the Edit button

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/report8.png)

### Exercise

We are going to schedule this report for every day at 08 AM to have the connections fail yesterday.

- Select "Edit Schedule"
- Check "Schedule Report"

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/schedule1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/schedule2.png)

- Configure it.

In this exercise, you don't use trigger actions, but I invited you to 
check what you can do when your report is generated (like sending an 
email, launching a script, etc.)

- Save and review the information in your report.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/schedule3.png)

