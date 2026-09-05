---
tags:
  - splunk
  - siem
  - soc
  - course/lets-defend
---

# Search on Splunk


Let's take a tour on the Search page. As you see, there is a lot of information to learn, let's try to clarify them.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/search_all.png)

### Traps and Tips

- Field names are case sensitive
- Field values are not case sensitive
- The wildcard is available (use *)
- You can use operators such as AND, OR, NOT

### Date Selection

The first thing to do is to select the data range.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/date1.png)

From here you can choose:

- Presets (today, last week, last year, last 24 hours, etc.)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/date2.png)

- Relative (beginning of the hour, X minutes ago, X weeks ago, etc.)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/date3.png)

- Real-time
- Date range (between 00:00 DD/MM/YYYY and 24:00 DD/MM/YYYY)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/date4.png)

- Date & time range (same but you can choose an hour)

### Timeline

When you perform a search, Splunk displays a Timeline

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/timeline1.png)

### Search Mode

There are three modes, you will use mostly the Smart Mode.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/mode1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/mode2.png)

### Search Bar

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/searchbar1.png)

This is where you make your request. As we said previously, you can use 
the wildcard character ("*") and operators. You can mix it all!

- Search for a username with "Je" on it. Try "Username=Je*" You will find username like Jeanne, Jean, etc.
- Search for connection on the computer named computer1. Try "eventid=4624 AND computername=computer1"
- Search for every connection on the computer except the domain controller. Try "eventid=4624 NOT computername=domaincontroller"
- Remember to use "Search History"

### Fields

Fields are available on the left. Here you have each field available in your search.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/field1.png)

Select the field to have information about it.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/field2.png)

### Save As

In this menu, you can choose to save your request as a report, alert, or dashboard.

