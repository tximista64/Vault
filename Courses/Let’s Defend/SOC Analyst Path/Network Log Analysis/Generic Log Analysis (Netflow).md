---
tags:
  - log-analysis
  - netflow
  - soc
  - course/lets-defend
---

# Generic Log Analysis (Netflow)


Netflow is a network protocol that collects IP traffic information. Although it
 was developed by Cisco, it supports Netflow from different 
manufacturers. Some manufacturers support Sflow or different similar 
protocols. It is important for it to provide visibility on the network 
with this protocol regardless of its brand or the developer of the 
protocol.

Thanks to this visibility;

- ISPs can bill for services
- It is used in network design or analysis
- It is used for network monitoring. (The sources that generate the most traffic, the most used port information, etc.)
- Service quality can be measured
- It provides information for SOC analysts for the detection of anomalies.

Netflow works in a stateful structure and monitors and reports all IP
 traffic passing over the monitored interface. Every IP communication 
here is defined as a flow. Flow is the set of packets that make up the 
communication between the source and destination. The information 
collected for the formation of Flow are as follows;

- Source IP Address
- Destination IP Address
- Source Port (Only for UDP ve TCP protocols)
- Destination Port (Only for UDP ve TCP protocols)
- IP Protocol
- Interface Information
- IP Version Information

An example NetFlow output;

**NOTE:** Devices producing NetFlow data usually do not produce 
this data in legible format as text. The output below is taken from 
applications that convert this data into a format that we can read.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Network+Log+Analysis/images/generic-1.png)

In order to create NetFlow data, NetFlow settings are configured on 
the supported routers or switches on the network. These configurations 
can be made over the host’s command line or web interface. Hosts 
transmit this data to network devices such as “Netflow Collector” or 
“Netflow Analyzer”. These will process the incoming NetFlow data and 
generate them into a report by visualizing the data on their interfaces 
according to their capabilities.

Via the NetFlow outputs, we can detect:

- Abnormal traffic volume increases
- Data leaks
- Access to private systems
- New IPs in the network
- Systems accessed for the first time as well as analyze related issues

