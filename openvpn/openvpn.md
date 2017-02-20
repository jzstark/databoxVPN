OpenVPN
-------
For security reasons, OpenVPN clients typically have their own unique certificate and private key. The server you will be connecting to has been configured to allow clients to share the same certificate and private key, but you may still wish to give your phone and laptop different keys, for example.

---
* Platforms
    * [Windows](#windows)
    * [OS X](#osx)
    * [Linux](#linux)
    * [Linux (Ubuntu)](#linux-ubuntu)
    * [Android](#android)
    * [iOS](#ios)

<a name="windows"></a>
### Windows ###
1. Download and run a suitable 32-bit or 64-bit OpenVPN [Windows Installer](https://openvpn.net/index.php/open-source/downloads.html).
1. Click *Next* and accept the license agreement by selecting *I Agree*.
1. Click *Next* on the *Choose Components* screen. Leave all of the default options checked.
1. Make note of the Destination Folder. This is where you will place the `databox.ovpn` client configuration profile after installation. Click *Install*.
1. A Windows Security notice will appear and ask *Would you like to install this device software?*. Click *Install*.
1. Click *Next* on the *Installation Complete* screen.
1. Uncheck *Show Readme* and click *Finish*.
1. Right-click on the OpenVPN GUI desktop icon and choose *Properties*.
1. Go to the *Compatibility* tab and click the *Run this program as an administrator* checkbox in the *Privilege Level* section.
1. Double-click the OpenVPN GUI desktop icon to launch the application.
1. Download [OpenVPN profile](/ovpn/databox.ovpn)
1. Open the *config* directory that is located in the Destination Folder. For most users, this will either be in *C:\Program Files\OpenVPN\config* or *C:\Program Files (x86)\OpenVPN\config*. You will see a single README file in this directory.
1. Drag and drop the downloaded `databox.ovpn` file to this location alongside the README.
1. Right-click on the OpenVPN icon in your taskbar and choose *Connect*.
1. You will see a log scroll by as the connection is established, followed by a taskbar notification indicating your assigned IP.
1. Success! You can verify that your traffic is being routed properly by [looking up your IP address on Google](https://encrypted.google.com/search?hl=en&q=ip%20address). It should say *Your public IP address is 178.62.33.140*.

<a name="osx"></a>
### OS X ###
1. Download and open [Tunnelblick](https://tunnelblick.net/downloads.html).
1. Type your password to allow the installation process to complete, and click *OK*.
1. Click *Launch* after the installation is finished.
1. Click *I have configuration files*.
1. Download [OpenVPN profile](/ovpn/databox.ovpn)
1. Double-click the OpenVPN profile.
1. You will be asked to choose whether the profile should be available for all users or only the current user. After making your selection, you will be asked to enter your password.
1. Look for the Tunnelblick icon in your menu bar. Click on it, and choose *Connect*.
1. Success! You can verify that your traffic is being routed properly by [looking up your IP address on Google](https://encrypted.google.com/search?hl=en&q=ip%20address). It should say *Your public IP address is 178.62.33.140*.

<a name="linux"></a>
### Linux ###
1. Install OpenVPN:

`sudo apt-get install openvpn` OR `sudo yum install openvpn` OR `esoteric-package-manager hipster openvpn` OR [other platform](https://openvpn.net/index.php/access-server/download-openvpn-as-sw.html).

   * If installing OpenVPN via your package manager is not an option, you can also download and compile the [OpenVPN source code](https://openvpn.net/index.php/download/58-open-source/downloads.html).
1. Download [OpenVPN profile](/ovpn/databox.ovpn)
1. Copy the downloaded `databox.ovpn` file to the location of your choice. */etc/openvpn/* is a decent option.
1. On some distributions, the pushed DHCP DNS option from the OpenVPN server will be ignored. This means that your DNS queries will still be routed through your ISP's servers which makes them vulnerable to what is known as a DNS leak.
   * You can test whether or not your DNS is leaking [here](https://dnsleaktest.com/).
   * You can ensure that the correct DNS servers are used by adding the following lines to the top of the `databox.ovpn` file:
     * `script-security 2`
     * `up /etc/openvpn/update-resolv-conf`
     * `down /etc/openvpn/update-resolv-conf`
1. Change direction to the profile location, execute OpenVPN, and pass it the .ovpn profile as an option: 
    `sudo openvpn databox.ovpn`

1. Success! You can verify that your traffic is being routed properly by [looking up your IP address on Google](https://encrypted.google.com/search?hl=en&q=ip%20address). It should say *Your public IP address is 178.62.33.140*.

<a name="android"></a>
### Android ###
1. Install [OpenVPN for Android](https://play.google.com/store/apps/details?id=de.blinkt.openvpn).
1. Download [OpenVPN profile](/ovpn/databox.ovpn)
1. Copy the `databox.ovpn` file to your phone.
1. Launch OpenVPN for Android.
1. Tap the folder icon in the lower-right of the screen.
1. Select the `databox.ovpn` profile that you copied to your phone.
1. Tap the save icon (floppy disk) in the lower-right of the screen after the import is complete.
1. Tap the profile.
1. Accept the Android VPN connection warning.
1. Success! You can verify that your traffic is being routed properly by [looking up your IP address on Google](https://encrypted.google.com/search?hl=en&q=ip%20address). It should say *Your public IP address is 178.62.33.140*.

<a name="ios"></a>
### iOS ###
1. Download [OpenVPN Connect](https://itunes.apple.com/us/app/openvpn-connect/id590379981) and launch it.
1. Download [OpenVPN profile](/ovpn/databox.ovpn)
1. Open iTunes on your computer and connect your phone.
1. Select your phone, click on the *Apps* tab, and find OpenVPN under the *File Sharing* section.
1. Drag and drop the downloaded `databox.ovpn` file into the file sharing window.
1. OpenVPN on your phone will say that *1 new OpenVPN profile is available for import*.
1. Tap the green *+* button to import the profile.
1. Tap the slider to connect to the OpenVPN server.
1. Success! You can verify that your traffic is being routed properly by [looking up your IP address on Google](https://encrypted.google.com/search?hl=en&q=ip%20address). It should say *Your public IP address is 178.62.33.140*.
