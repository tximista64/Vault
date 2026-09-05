---
tags:
  - siem
  - log-analysis
  - soc
  - course/lets-defend
---

# Log Storage



In our previous articles, we talked about logs and log aggregators. The next step is to store incoming logs.

One of the common mistakes made in SIEM structures is to focus on storage size. High-sized storage is important, as well as the speed of accessing this data. For example, let’s say we collect all the logs such as WAF, Firewall, Proxy, etc. and imagine that it takes 15 minutes to make a search in these logs. In a situation where it is so difficult to access data, the studies will not be very productive. For this reason, the speed of data access should also be considered in storage.

When we look at the popular storage technologies in the market (Example: mysql), we see that it is focused on adding, editing, and deleting data. But our focus is on indexing the data, we do not intend to edit the stored log later. Our purpose is to access data as quickly as possible. For this, WORM (write once read many) based technologies are more suitable to be used in SIEM.

More info about worm, write once read many: [https://en.wikipedia.org/wiki/Write_once_read_many](https://en.wikipedia.org/wiki/Write_once_read_many)

You can understand the difference by pressing the "Search" button in 2 different storage areas below.

The result of the first query was quite slow, while the second query returned results instantly. While minor delays during investigation or processing of new incoming data are acceptable, excessive delays can be risky.

