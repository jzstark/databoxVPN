#!/bin/sh

#if lsmod | grep af_key &> /dev/null ; then
sudo modprobe af_key
#fi

IFACE=eth0
IP=`/sbin/ifconfig $IFACE | awk '/inet addr/{print substr($2,6)}'`
# Assuming public IP (A big if)
# IP=`curl --silent ipecho.net/plain`

servername=Databox
user=databox
password="test"
psk="test"

rm -f vpn.env 
cat > vpn.env <<EOF
VPN_IPSEC_PSK=$psk
VPN_USER=$servername
VPN_PASSWORD=$password
EOF

docker run \
    --name l2tp \
    --env-file vpn.env \
    --restart=always \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -v /lib/modules:/lib/modules:ro \
    -d --privileged \
    hwdsl2/ipsec-vpn-server

cat > l2tp.md <<EOF
L2TP/IPsec
----------
L2TP/IPsec is a great first choice. It is natively supported by Android, iOS, OS X, and Windows. There is no additional software to install. Setup should only take a few minutes.

If the connection appears to time out, first check to make sure the passwords were entered correctly. If you still can't connect then it's possible that your country or ISP is blocking the L2TP/IPsec protocol.

---
* Platforms
* [Windows](#windows)
* [OS X](#osx)
* [Linux](#linux)
* [Android](#android)
* [iOS](#ios)
* [Chromebook](#chromebook)

<a name="windows"></a>
### Windows ###
1. Click on the Start Menu and go to the Control Panel.
1. Go to the *Network and Internet* section.
1. Click *View network status and tasks*.
1. Click *Set up a new connection or network*.
1. Select *Connect to a workplace* and click *Next*.
1. Click *Use my Internet connection (VPN)*.
1. Enter \`$IP\` in the *Internet address* field.
1. Enter \`$servername\` in the *Destination name* field.
1. Check the *Don't connect now; just set it up so I can connect later* checkbox.
1. Click *Next*.
1. Enter \`$user\` in the *User name* field.
1. Enter \`$password\` in the *Password* field.
1. Check the *Remember this password* checkbox.
1. Click *Connect*, then click the *Close* button.
1. Return to the Control Panel's *Network and Internet* section and click on the *Connect to a network* option.
1. Right-click on the new *$servername* connection and choose *Properties*.
1. Click the *Options* tab and uncheck *Include Windows logon domain*.
1. Click the *Security* tab and select *Layer 2 Tunneling Protocol with IPsec (L2TP/IPSec)* from the *Type of VPN* drop-down menu.
1. Click the *Advanced settings* button.
1. Select *Use preshared key for authentication* and enter \`$psk\` for the *Key*.
1. Click *OK* to close the *Advanced settings*.
1. Click *OK* to save the VPN connection details.
1. To connect to the VPN, simply right-click on the wireless/network icon in your system tray, select *$servername*, and click *Connect*.

You can verify that your traffic is being routed properly by [looking up your IP address on Google](https://encrypted.google.com/search?hl=en&q=ip%20address). It should say *Your public IP address is $IP*.

<a name="osx"></a>
### OS X ###
1. Open System Preferences and go to the Network section.
1. Click the *+* button in the lower-left corner of the window.
1. Select *VPN* from the *Interface* drop-down menu.
1. Select *L2TP over IPSec* from the *VPN Type* drop-down menu.
1. Enter \`$servername\` for the *Service Name*.
1. Click *Create*.
1. Enter \`$IP\` for the *Server Address*.
1. Enter \`$user\` for the *Account Name*.
1. Click the *Authentication Settings* button.
1. In the *User Authentication* section, select the *Password* radio button and enter \`$password\` as its value.
1. In the *Machine Authentication* section, select the *Shared Secret* radio button and enter \`$psk\` as its value.
1. Click *OK*.
1. Check the *Show VPN status in menu bar* checkbox.
1. Click the *Advanced* button and make sure the *Send all traffic over VPN connection* checkbox is selected.
1. Click the *TCP/IP* tab, and make sure *Link-local only* is selected in the *Configure IPv6* section.
1. Click *OK* to close the Advanced settings, and then click *Apply* to save the VPN connection information.

You can connect to the VPN using the VPN icon in the menu bar, or by selecting the VPN in the Network section of System Preferences and choosing *Connect*. You can verify that your traffic is being routed properly by [looking up your IP address on Google](https://encrypted.google.com/search?hl=en&q=ip%20address). It should say *Your public IP address is $IP*.

<a name="linux"></a>
### Linux ###
L2TP/IPsec connections are not supported out-of-the-box on most Linux distributions without requiring the installation of additional software. This nullifies one of the biggest appeals of L2TP/IPsec (i.e. its native client-side support). It is recommended to use another connection method like OpenVPN instead, but if you would like to configure L2TP/IPsec on your Linux desktop, here are the settings you will need: 

Server Address: $IP

IPsec pre-shared key: $psk

CHAP user: $user
CHAP pass: $password

<a name="android"></a>
### Android ###
1. Launch the *Settings* application.
1. Tap *More...* in the *Wireless & Networks* section.
1. Tap *VPN*.
1. Tap the *+* icon in the top-right of the screen.
1. Enter \`$servername\` in the *Name* field.
1. Select *L2TP/IPSec PSK* in the *Type* drop-down menu.
1. Enter \`$IP\` in the *Server address* field.
1. Enter \`$psk\` in the *IPSec pre-shared key* field.
1. Tap *Save*.
1. Tap the *$servername* connection.
1. Enter \`$user\` in the *Username* field.
1. Enter \`$password\` in the *Password* field.
1. Check the *Save account information* checkbox.
1. Tap *Connect*.
1. Once connected, you will see a VPN icon in the notification bar. You can verify that your traffic is being routed properly by [looking up your IP address on Google](https://encrypted.google.com/search?hl=en&q=ip%20address). It should say *Your public IP address is $IP*.

<a name="ios"></a>
### iOS ###
1. Go to Settings -> General -> VPN.
1. Tap *Add VPN Configuration...*.
1. Tap *Type*.
1. Select *L2TP* and go back.
1. Tap *Description* and enter \`$servername\`.
1. Tap *Server* and enter \`$IP\`.
1. Tap *Account* and enter \`$user\`.
1. Tap *Password* and enter \`$password\`.
1. Tap *Secret* and enter \`$psk\`.
1. Tap *Done*.
1. Slide the *VPN* switch on.
1. Once connected, you will see a VPN icon in the status bar. You can verify that your traffic is being routed properly by [looking up your IP address on Google](https://encrypted.google.com/search?hl=en&q=ip%20address). It should say *Your public IP address is $IP*.

<a name="chromebook"></a>
### Chromebook ###
1. Go to *Settings*.
1. Under *Internet Connection* click *Add connection*.
1. Select *Add private network...*.
1. Enter \`$IP\` for the *Server hostname*.
1. Enter \`$servername\` for the *Service name*.
1. Make sure *Provider type* is *L2TP/IPSec + pre-shared key*.
1. Enter \`$psk\` for the *Pre-shared key*.
1. Enter \`$user\` for the *Username*.
1. Enter \`$password\` for the *Password*.
1. Click *Connect*.
1. Once connected, you will see a VPN icon overlay on the network status icon. You can verify that your traffic is being routed properly by [looking up your IP address on Google](https://encrypted.google.com/search?hl=en&q=ip%20address). It should say *Your public IP address is $IP*.
EOF
