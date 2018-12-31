# Google Domains Dynamic DNS Updates

This script provides a method to update dynamic DNS records for domain names hosted on Google Domains.

To use, copy DynamicDNSUpdate.ps1 and Settings.xml to a folder. Then edit the Settings.xml file and 
replace "yourdomain.com" with your domain name, and update the username and password with the dynamic
update credentials provided by Google Domains for your specifc domain.
Ignore the IPAddress field as this will be updated to our current IP address automatically on the first run.

Next, create a scheduled task to run the script at whatever interval is appropriate for your environment.

The script will check your current IP address and if it is different from the last time it checked, it will
preform the DNS update on the domain and log the result to a file named DNSUpdates.txt.

#### Copyright 2018 Jake Weaver
#### jake@jjepen.com
