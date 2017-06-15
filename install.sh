#!/bin/sh -e

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root." 1>&2
   exit 1
fi

echo "Installing dependencies..."
apt-get install macchanger hostapd dnsmasq apache2 php5

echo "Configuring components..."
cp -f hostapd.conf /etc/hostapd/
cp -f dnsmasq.conf /etc/
cp -Rf html /var/www/
chown -R www-data:www-data /var/www/html
chown root:www-data /var/www/html/.htaccess
cp -f rc.local /etc/

echo "Rogue captive portal installed. Reboot to execute."
exit 0
