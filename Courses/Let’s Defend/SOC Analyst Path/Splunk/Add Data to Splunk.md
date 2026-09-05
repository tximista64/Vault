---
tags:
  - splunk
  - siem
  - log-analysis
  - soc
  - course/lets-defend
---

# Add Data to Splunk


In
 Splunk, you can add data in different ways. Here we are going to see 
the forwarder installed on the Win10 computer and with the upload of a 
log file.

### Add Data from Forwarder

- Go to Settings >Add Data

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/forwarder3.png)

- Select "Forward" at the bottom

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/forwarder4.png)

Add the computer to the selected host and give it a Server Class Name

Click "Next"

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/data1.png)

Select what you want to monitor, in this case, we want to collect the local event log from this computer.

Select which log you want

Click "Next"

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/data2.png)

Select the index where the logs need to be put.

I choose to create a new one named "WinLog_clients". For this, click on "create a new Index"

Click Review to check and then submit.

Now, you can click "start searching" to try to find your last connection on the client's computer.

### Check Your Indexes

Go to Settings > Indexes

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/indexes1.png)

Search the index you create previously

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/indexes2.png)

As you see there is no incoming event, you are going to configure it now.

### Add Receiver

Go to Setting > Forwarding and receiving

Click to add new receiving

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/receive2.png)

Add the 9997 port (it's the default one, remember it in the previous document)

Wait a few minutes and check your indexes again, you will see new values

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/indexes3.png)

Try a quick search

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/search1.png)

### Add Data From Uploaded Logs

Go to Settings > Add Data

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/forwarder3.png)

Select "Upload" in the bottom left corner

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/upload1.png)

Push the file you want to upload, then click "Next"

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/upload2.png)

Check how Splunk will read your file, then press Next if everything is okay

Select a host field value if needed, and the index which is going to be used (left default in the exercise)

Continue to the end, and start searching on it

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Splunk/images/upload3.png)

