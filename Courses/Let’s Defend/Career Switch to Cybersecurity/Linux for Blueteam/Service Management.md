---
tags:
  - linux
  - linux-fundamentals
  - service-management
  - course/lets-defend
---

# Service Management


**What is Service?**

Services are programs that run or wait to run in the background in 
Linux. Many services can be offered as services in Linux. For example, 
when FTP file sharing is turned on, FTP's service is running, or when 
the webserver service is turned on, the webserver service starts in the 
background. Services are often important to cybersecurity because 
services that are turned on have the risk of creating security 
vulnerabilities. For example, when the FTP service is running on the 
system, the port used by this service becomes open for external scans. 
The attacker may be able to access the system through various brute 
force attacks and seize an authorized user account and eventually access
 the files publicly available in the system. Therefore, any service that
 is not needed in the system should be turned off or disabled. Security 
hardening of the system is vital and should be implemented to ensure the
 security of our systems. However, these services should still be 
monitored regularly by the SOC analysts to be able to detect any 
suspicious activities on these services.

**Listing All Services Available in the System**

It is necessary to know how to manage the services when working with 
these services on Linux. First, let's see all the services in the 
system:

As seen in the image above, the "systemctl" command will display all the services in the system.

When the command is executed, all the services (running or not running) 
on the system are listed. As seen in the image above, we have displayed 
the information of the services by running the "systemctl" command.

Note: Since the output is long, only the beginning part is shown.

**Listing All the Running Services in the System**

To be able to list all the running services in the system, we type the 
"--state=running" parameter in addition to the "systemctl" command.

As in the image above we have typed the command to view the running services.

When the command is executed, all services running on the system are 
printed on the screen. As seen in the image above, the status of all 
services is in a “running” state.

Note: Since the output is long, only the beginning part is shown.

**Viewing the Status of a Particular Service**

We can display the status of a single service instead of bringing up the
 status of all services using the "systemctl" command, the "status" 
parameter, and the exact name of the service that we want to display its
 status.

For example, let's view the status of the "apache2" service:

We executed “systemctl status apache2.service” as our command, and the 
information about the "apache2" web service is displayed as “running” 
state as seen in the screenshot above.

**Stopping the Service**

The "systemctl" command is used to stop the running service. “stop” 
parameter is added to the command along with the name of the service to 
be stopped. For example, let's stop the "apache2" service running in the
 previous example:

As seen in the image above, the status of the "apache2" service has been
 turned to “inactive” and that means the service has been successfully 
stopped.

**Starting a Service**

The service that was stopped in the previous example may need to be run 
again. The command to start the service is very similar to the stop 
command. Only if the same command is applied by typing "start" instead 
of "stop", the service will be operational again. For example, let's 
start the service that was stopped in the previous example:

As seen in the image above, the "apache2" service has been started successfully.

In this part of the training, services and service management are 
explained. The next part of the training describes scheduled tasks.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/service1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/service2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/service3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/service4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/service5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/service6.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/service7.png)

