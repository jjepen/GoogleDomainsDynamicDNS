# Script to update Dynamic DNS on Google Domains.
# Copyright 2018 Jake Weaver
# jake@jjepen.com

# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
# and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS 
# IN THE SOFTWARE.



# Get settings
[xml]$Config = Get-Content .\Settings.xml
$baseURI = $config.Settings.URI
$username = $Config.Settings.username
$password = $Config.Settings.password
$hostname = $Config.Settings.hostname
$oldIP = $Config.Settings.IPAddress

# Build the headers that contain the credentials
$credpair = "$($username):$($password)"
$encodedCredentials = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($credpair))
$headers = @{ Authorization = "Basic $encodedCredentials" }

# Get the public IP
$ip = Invoke-RestMethod http://ipinfo.io/json | Select-Object -ExpandProperty ip

# If the public IP has changed (Doesn't match the old public IP) then attempt to update it.
if ([string]$ip -ne $oldIP) {
    # Update the settings file with the new IP
    $Config.Settings.IPAddress = [string]$ip
    $config.Save("Settings.xml")

    # Send the update to the server
    $uri = "$($baseURI)?hostname=$hostname&myip=$ip"
    $response = Invoke-RestMethod -Uri $uri -Method Post -Headers $headers

    # log the response from the server
    $date = Get-Date
    $date = Get-Date
    "$($date) - $($response)" | Out-File .\DNSUpdates.txt -Append
    
}

