#!/bin/sh -e
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root." 1>&2
   exit 1
fi
# Install dependencies
apt-get install macchanger hostapd dnsmasq apache2 php5
# Configure components
cp -f hostapd.conf /etc/hostapd/
cp -f dnsmasq.conf /etc/
cp -f dnsmasq.hosts /etc/
rm -f /var/www/html/index.html
cp -f html/* /var/www/html/
cp -f rc.local /etc/
# All done
echo "Rogue captive portal installed. Reboot to execute."
exit 0
