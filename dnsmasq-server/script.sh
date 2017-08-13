#!/bin/bash
set -e


# Must be run as root
if [[ `whoami` != "root" ]]
then
  echo "This install must be run as root or with sudo."
  exit
fi

apt-get install -y dnsmasq
cat - > /etc/dnsmasq.conf <<DNSMASQCONF
# dnsmasq.conf for raspberry pi    
# Details found here:
# http://lopqto.net/2017/08/12/install-dnsmasq-on-raspberry-pi/  

domain-needed
no-resolv
server=8.8.8.8
server=8.8.4.4

cache-size=4096
domain=raspberry.local

DNSMASQCONF

service dnsmasq restart

echo 'Installation complete. Enjoy!'