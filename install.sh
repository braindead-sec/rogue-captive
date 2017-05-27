#!/bin/bash

apt-get install macchanger hostapd dnsmasq apache2 php5
cp -f hostapd.conf /etc/hostapd/
cp -f dnsmasq.conf /etc/
cp -f dnsmasq.hosts /etc/
rm -f /var/www/html/index.html
cp -f html/* /var/www/html/
cp -f rc.local /etc/
echo "Rogue captive portal installed. Reboot to execute.\n"