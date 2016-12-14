# databoxVPN

This repo automate deployment of a set of VPN and proxy tools on a remote machine.

## Service Provided

* L2TP/IPsec based on [Libreswan](https://libreswan.org/)
* [OpenConnect](http://www.infradead.org/ocserv/index.html) / (Cisco AnyConnect)[https://www.cisco.com/c/en/us/products/security/anyconnect-secure-mobility-client/index.html]
* [OpenVPN](https://openvpn.net/)
* [Shadowsocks](https://shadowsocks.org/en/index.html), a fast and secure socks5 proxy.
* SSH, served as Socks proxy.

## Install

This toolset is deployed using [Ansible](https://www.ansible.com/), an automation tool that is used to provision and configure files and packages on remote servers. You need to have **TWO MACHINES**: one **master machine**, and one **remote server**. The final target is to deploy all these VPN tools on the remote server.

- Prerequisites on master machine:
  * OS: Linux, BSD, or OS X
  * Python 2.7
  * Make sure an SSH key is present in ~/.ssh/id_rsa.pub
  * Git
  * pip
    * On Debian and Ubuntu

      `sudo apt-get install python-paramiko python-pip python-pycurl python-dev build-essential`
    * On Fedora

      `sudo yum install python-pip`
    * On OS X

      ```
      sudo easy_install pip
      sudo pip install pycurl
      ```
  * [Install Ansible](https://docs.ansible.com/ansible/intro_installation.html)

- Prerequisites on remote server
  * Ubuntu 16.04 (Tested so far: DigitalOcean)
  * Must accept the SSH key of master machine as authrized_keys. If not, run:

    `ssh-copy-id *username*@*remote-server-ip*`

- Execution:
  On the **master machine**
  1. Clone the databoxVPN repository and Enter

    `git clone https://github.com/jzstark/databoxVPN.git && cd databoxVPN`
  1. (Optional) Make sure the remote server can be accessed:

    `ansible all -m ping -i hosts`

  1. Execute the script:

    `./databoxVPN.sh`
  1. Wait for the setup to complete (several minutes) and in the databoxVPN/generated-docs folder open the html file, which will leads you to setup and connect VPNs.  
