#What is Yuri?
http://futurama.wikia.com/wiki/Yuri

Yuri is a little script that takes the list of IPs that zendesk publishes as valid IPs to expect commands from, then adds them to a security group and attaches it to the ELB of your choosing.


#Where to get the list from:
At this time this list must be manually copied and pasted into your list-of-ips.txt file, from https://support.zendesk.com/hc/en-us/articles/203660846-Zendesk-Public-IP-addresses

I have asked zendesk to publish this list on S3. When they do, I can modify the script to directly pull it off of there.

#What will the new security group be named?
It will be called **zendesk_ips_allow**. If there is one already, it will be used. So if you want to use a different name, pass it as the second parameter.

#Which ELB will it add this SG to?
You must specify the name of the ELB as the first parameter.