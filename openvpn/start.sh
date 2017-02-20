#!/bin/bash
# Set up Certificate Store
OVPN_DATA="/root/dockerVPN/ovpn/conf"
IFACE=eth0
#docker run --name $OVPN_DATA -v /etc/openvpn busybox

# Userinput: wlan0 or eth0
IP=`/sbin/ifconfig $IFACE | awk '/inet addr/{print substr($2,6)}'`
docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://$IP:1194
docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki

# Run OpenVPN
docker run --name ovpn -v $OVPN_DATA:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn
