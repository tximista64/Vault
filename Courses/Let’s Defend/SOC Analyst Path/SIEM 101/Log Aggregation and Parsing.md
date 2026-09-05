---
tags:
  - siem
  - log-analysis
  - soc
  - course/lets-defend
---

# Log Aggregation and Parsing


The first place where the generated logs are sent is the log aggregator. We can edit the logs coming here before sending them to the destination. For example, if we want to get only status codes from a web server logs, we can filter among the incoming logs and send only the desired parts to the target.

Aggregator EPS

What is EPS?

EPS is an event per seconds. The formula is Events/Time period of seconds. For example, if the system receives 1000 logs in 5 seconds, EPS would be 1000/5 = 200. As the EPS value increases, the aggregator and storage area that should be used also increases.

Scaling the Aggregator

More than one aggregator can be added so that the incoming logs do not load the same aggregator each time. And sequential or random selection can be provided.

Log Aggregator Process

The log coming to the Aggregator is processed and then directed to the target. This process can be parsing, filtering, and enrichment.

Log Modification

In some cases, you need to edit the incoming log. For example, while the date information of most logs you collect comes in the format dd-mm-yyyy, if it comes from a single source as mm-dd-yyyy, you would want to convert that log. Another example, you may need to convert UTC + 2 incoming time information to UTC + 1.

Log Enrichment

Enrichment can be done to increase the efficiency of the collected logs and to save time. Example enrichments:

Geolocation
DNS
Add/Remove

Geolocation

The geolocation of the specified IP address can be found and added to the log. Thus, the person viewing the log saves time. It also allows you to analyze location-based behavior.

DNS

With DNS queries, the IP address of the domain can be found or the IP address can be found by doing reverse DNS.

