---
tags:
  - incident-management
  - soc
  - playbooks
  - course/lets-defend
---

# Case/Alert Naming


It is important that the ticket/case/records created in the Incident 
management system have meaningful title as having unified naming 
conventions will help in the retrospective inquiries for quickly finding
 the relevant record or extracting statistics easily when an 
investigation is made. For these and similar reasons, it is necessary to
 have an idea about the ticket/case just by looking at the title.

There are several methods for naming tickets. The naming method in 
LetsDefend "Case Management" is as follows.

EventID: {Alert ID Number} - [{Alert Name}]

Thanks to this naming convention, analysts can quickly access the alarm 
details they want to reach, by the alarm ID or Name, while examining the
 past records.

When we look at real-world examples, we see that the naming format we 
described above is a common practice in the industry. In addition, 
sometimes the following fields may be included in the title:

Alert CategoryEvent SourceDescription

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Incident+Management+101/images/alert-naming-siem.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Incident+Management+101/images/soar.png)

- Alert Category
- Event Source
- Description

