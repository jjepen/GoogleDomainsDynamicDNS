[title]
Google Domains Dynamic DNS Updates

This script provides a method to update dynamic DNS records for domain names hosted on Google Domains.

To use, copy DynamicDNSUpdate.ps1 and Settings.xml to a folder. Then edit the Settings.xml file and 
replace "yourdomain.com" with your domain name, and update the username and password with the dynamic
update credentials provided by Google Domains for your specifc domain.
Ignore the IPAddress field as this will be updated to our current IP address automatically on the first run.

Next, create a scheduled task to run the script at whatever interval is appropriate for your environment.

The script will check your current IP address and if it is different from the last time it checked, it will
preform the DNS update on the domain and log the result to a file named DNSUpdates.txt.

Copyright 2018 Jake Weaver
jake@jjepen.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS 
IN THE SOFTWARE.