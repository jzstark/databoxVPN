# OpenVPN Instruction

- [run.sh](/ovpn/run.sh): install and start container "ovpn"; user need to manually input a key that is requred every time a client configuration file is created. Creating DH parameters may take a long time in this step. 
- [generate.sh](/ovpn/generate.sh): generate a client configuration file databox.ovpn.
- follow the suggestions in [openvpn.md](/ovpn/openvpn.md) to install the config file to user devices on different platforms.
- stop the container: `docker stop ovpn`
