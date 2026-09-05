---
tags:
  - windows
  - windows-services
  - course/lets-defend
---

# Windows Services



What are Services?
Services are programs that have their own processes running in the background on Windows. Services can run without interacting with the user and needing to open a window on the screen. Each service has its own reason for running. As the system has its own services, there may also be services belonging to the programs installed later in the system. Services running on Windows are important from the security aspect. Attackers can gather information about the system through running services or use services to infiltrate the system. If there is an incident or suspicious activity, the SOC analysts should monitor the processes of all services, including the services added to the system through the event logs to be able to detect any suspicious activities. A newly created service with a potentially suspicious name may indicate an attacker's activity. In this part of the training, we will cover the Windows services.

Note: Event logs will be explained in the following parts of the training.
Managing Windows Services with a Graphical User Interface (GUI)
It is possible to view and manage Windows services via the graphical user interface (GUI). For example, let's see the running services: Let's open the "Run" application with the "Windows + R" key combination and type the application name we want to run: "services.msc"

As seen in the image above, the "services" application, which we can manage Windows services, has been opened successfully. With this application, you can have detailed information about the services. The status of the services can be seen and the services can be started and stopped. For example, let's open the "properties" window of the Windows update service:

We can see different details about the services through the “Services” application. For example, the "Path to executable" section contains the command that will run after the service is activated. This command may have essential hints about the attacker. It is one of the most important components where we can check to understand what the attacker wants to do with the service. The service can be started or stopped through this window. We don’t have to open this window to start or stop the service. Services can be managed without opening this window. For example, let's stop the "Windows update" service from the main window and run it again:

As seen in the images above, Windows services are easily manageable via the Graphical User Interface (GUI).
Managing Windows Services with Command Line
It is possible to manage Windows services from the command line. The "sc" command is used for this.
Display all running services
We can display all running services on the command line by applying the "sc query" command. For example, let's see the running services by executing the command:

The image above shows that all the running services have been successfully displayed.

Note: Since the output of the command is too long, only the first part is visible in the image.
View all services
We can display all services available in the system by applying the “sc query type=service state=all” command. For example, let's see by executing the command:

The image above shows that all the running and not running services at the moment have been successfully displayed.

Note: Since the output of the command is too long, only the first part is visible in the image.
Get information about the service
We may need to request information about only one single service because it may be hard to view all services in a single window. In this case, the service name should be given as a parameter to the "sc query" command. For example, let's execute the "sc query wuauserv" command to get information about the Windows update service:

As seen in the image above, the information on the Windows update service has been successfully displayed.
Starting and Stopping the Service
We can start/stop services using the command line. For example, let's run the “Windows Update Service” that was not running in the previous example. We need to apply the "sc start wuauserv" command for this:

As seen in the image above, the Windows update service has been successfully started. We can stop the service by using the “sc stop wuauserv” command.

The image above shows that the service has been stopped successfully. The most important thing we should pay attention here is that the command line must be opened with administrator privileges before executing the service stop command. If the command line is not opened with administrator privileges, the service stop command will not work and will result in an authorization error.

In this part of the training, we covered what services are in Windows, their importance in terms of security as well as how they are managed via the graphical user interface and the command line. The next part of the tutorial will cover “Scheduled Tasks”

