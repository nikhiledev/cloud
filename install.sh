#Login to your Cloud Instance via Terminal
ssh root@xyz.com

#Download our Instance configuration shell script
curl -O https://www.edev.in/install.sh

#Run the shell script to install the necessary web components
bash install.sh --nginx yes --apache yes --phpfpm no --vsftpd yes --proftpd no --exim no --dovecot no --spamassassin no --clamav no --named yes --iptables no --fail2ban no --mysql yes --postgresql no --remi yes --quota no -f

#Installation will take approximately about 5-10 minutes depending on your network Inbound speed.
