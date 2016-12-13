#!/usr/bin/env bash

# Attribute to : Steisand Project

echo
echo -e "\033[38;5;255m\033[48;5;234m\033[1m  D A T A B O X V P N  \033[0m"
echo

required_ansible_version="2.1.1.0"

if [[ "$(ansible --version | grep -oe '2\(.[0-9]\)*')" < $required_ansible_version ]]
then
    echo "Ansible $required_ansible_version or higher is required."
    exit -1;
fi

ansible-playbook playbook/databox.yml
