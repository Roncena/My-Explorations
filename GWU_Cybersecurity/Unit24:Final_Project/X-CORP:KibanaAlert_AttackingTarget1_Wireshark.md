Alert and Attacking Target 1

Overview
You are working as a Security Engineer for X-CORP, supporting the SOC infrastructure. The SOC analysts have noticed some discrepancies with alerting in the Kibana system and the manager has asked the Security Engineering team to investigate.
To start, your team needs to confirm that newly created alerts are working. Once the alerts are verified to be working, you will monitor live traffic on the wire to detect any abnormalities that aren't reflected in the alerting system.
You will then report back all your findings to both the SOC manager and the Engineering Manager with appropriate analysis.

Configuring Alerts
Complete the following to configure alerts in Kibana:

1.  Access Kibana at 192.168.1.100:5601

2.  Click on Management > License Management and enable the Kibana Premium Free Trial.

3.  Click Management > Watcher > Create Alert > Create Threshold Alert

4.  Implement three of the alerts you designed at the end of Project 2.

You can configure any alerts you'd like, but you are recommended to start with the following:

  HTTP Request Size Monitor

  Select the packetbeat indice

    WHEN sum() of http.request.bytes OVER all documents IS ABOVE 3500 FOR THE LAST 1 minute
    
  Excessive HTTP Errors

  Select the packetbeat indice

    WHEN count() GROUPED OVER top 5 'http.response.status_code' IS ABOVE 400 FOR THE LAST 5 minutes

  CPU Usage Monitor

  Select the metricbeat indice

    WHEN max() OF system.process.cpu.total.pct OVER all documents IS ABOVE 0.5 FOR THE LAST 5 minutes

Blue Team: Summary of Operations:  https://docs.google.com/document/d/1pLW6g3Fyq7ehrtfIMNQWomLdxfXoFXcf4S7ra4UKnzY/edit?usp=sharing

Attacking Target 1

1.  Scan the network to identify the IP addresses of Target 1.

2.  Document all exposed ports and services.

3.  Enumerate the WordPress site. One flag is discoverable after this step.

4.  Use SSH to gain a user shell. Two flags can be discovered at this step.

5.  Find the MySQL database password.

6.  Use the credentials to log into MySQL and dump WordPress user password hashes.

7.  Crack password hashes with john.

8.  Secure a user shell as the user whose password you cracked.

9.  Escalate to root. One flag can be discovered after this step.

Red Team: Summary of Operations: https://docs.google.com/document/d/1YduPENeUaFkWQ6Bz0eru7MNr-Nlimy6kKgRx2jJ9TYE/edit?usp=sharing

Wireshark Strikes Back

Overview
You are working as a Security Engineer for X-CORP, supporting the SOC infrastructure. The SOC analysts have noticed some discrepancies with alerting in the Kibana system and the manager has asked the Security Engineering team to investigate.
Yesterday, your team confirmed that newly created alerts are working. Today, you will monitor live traffic on the wire to detect any abnormalities that aren't reflected in the alerting system.
You are to report back all your findings to both the SOC manager and the Engineering Manager with appropriate analysis.

Time Thieves
At least two users on the network have been wasting time on YouTube. Usually, IT wouldn't pay much mind to this behavior, but it seems these people have created their own web server on the corporate network. So far, Security knows the following about these time thieves:

  They have set up an Active Directory network.
  They are constantly watching videos on YouTube.
  Their IP addresses are somewhere in the range 10.6.12.0/24.

You must inspect your traffic capture to answer the following questions in your Network Report:

1.  What is the domain name of the users' custom site?

2.  What is the IP address of the Domain Controller (DC) of the AD network?

3.  What is the name of the malware downloaded to the 10.6.12.203 machine?

4.  Upload the file to VirusTotal.com.

5.  What kind of malware is this classified as?


Vulnerable Windows Machines
The Security team received reports of an infected Windows host on the network. They know the following:

  Machines in the network live in the range 172.16.4.0/24.
  The domain mind-hammer.net is associated with the infected computer.
  The DC for this network lives at 172.16.4.4 and is named Mind-Hammer-DC.
  The network has standard gateway and broadcast addresses.

Inspect your traffic to answer the following questions in your network report:

1.  Find the following information about the infected Windows machine:

    Host name
    IP address
    MAC address

2.  What is the username of the Windows user whose computer is infected?

3.  What are the IP addresses used in the actual infection traffic?

4.  As a bonus, retrieve the desktop background of the Windows host.

Network Forensic Analysis Report:  https://docs.google.com/document/d/1HHLNbmfQ1luglKxlgaQf-9iq9uNyOPyMCLJ78LUYUbI/edit?usp=sharing

Presentation of Offensive, Defensive and Network Administration Analyses: 
https://docs.google.com/presentation/d/1WP6MxuaPo1CBRuZsKVyf00F9GiOHGeRgWb4ZI-V3djs/edit?usp=sharing 


