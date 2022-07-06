Networks Fundamentals II Homework 9: In a Network Far, Far Away!
Mission 1
Issue: Due to the DoS attack, the Empire took down the Resistance's DNS and primary email servers.
Determine and document the mail servers for starwars.com using NSLOOKUP.


Explain why the Resistance isn't receiving any emails.
	The listed mail servers are incorrect.

Explain why the Resistance isn't receiving any emails.
	It should be:
asltx.l.google.com instead of aspmx.l.google.com for primary mail server
asltx.2.google.com instead of alt1.aspx.l.google.com or alt2.aspmx.l.google.com for secondary which has the same priority number


Mission 2
Issue: Now that you've addressed the mail servers, all emails are coming through. However, users are still reporting that they haven't received mail from the theforce.net alert bulletins.
Determine and document the SPF for theforce.net using NSLOOKUP.


Explain why the Force's emails are going to spam.
The IP address listed is incorrect.

Document what a corrected DNS record should be.
It should be changed to 45.23.176.21

Mission 3
Issue: You have successfully resolved all email issues and the resistance can now receive alert bulletins. However, the Resistance is unable to easily read the details of alert bulletins online.
Document how a CNAME should look by viewing the CNAME of www.theforce.net using NSLOOKUP.


Explain why the sub page of resistance.theforce.net isn't redirecting to theforce.net.
The reason why the subpage resistance.theforce.net is not redirecting to the force.net is because there’s no recorded canonical name for theforce.net

Document what a corrected DNS record should be.
Entry should be:
theforce.net		canonical name = resistance.theforce.net

Mission 4
Issue: During the attack, it was determined that the Empire also took down the primary DNS server of princessleia.site.
Confirm the DNS records for princessleia.site.



Document how you would fix the DNS record to prevent this issue from happening again.
	ns2.galaxybackup.com should be added to the name server.

Mission 5
Issue: The network traffic from the planet of Batuu to the planet of Jedha is very slow.
View the Galaxy Network Map and determine the OSPF shortest path from Batuu to Jedha.


Confirm your path doesn't include Planet N in its route.


Document this shortest path so it can be used by the Resistance to develop a static route to improve the traffic.
		Batuu - D - C - E - F - J - I - L - Q - T - V - Jedha 























Mission 6
Issue: Due to all these attacks, the Resistance is determined to seek revenge for the damage the Empire has caused.
Figure out the Dark Side's secret wireless key by using Aircrack-ng.

















Use the Dark Side's key to decrypt the wireless traffic in Wireshark.










Once you have decrypted the traffic, figure out the following Dark Side information:


Host IP Addresses and MAC Addresses by looking at the decrypted ARP traffic.


Document these IP and MAC Addresses, as the resistance will use these IP addresses to launch a retaliatory attack.	
IP address: 172.16.0.101
MAC address: 00:13:ce:55:98:ef
Mission 7
As a thank you for saving the galaxy, the Resistance wants to send you a secret message!
Your Mission:
View the DNS record from Mission #4.


The Resistance provided you with a hidden message in the TXT record, with several steps to follow.


Follow the steps from the TXT record.


Note: A backup option is provided in the TXT record (as a website) in case the main telnet site is unavailable

Take a screen shot of the results.


