#!/bin/bash

echo " " && echo "Here is /etc/hosts for ansible-host" && echo "" && for i in ansible-host ansible-guest01 ansible-guest02 ansible-guest03;do v1=$i && v2=$(/mnt/c/Program\ Files/Oracle/VirtualBox/VBoxManage.exe guestproperty get $i "/VirtualBox/GuestInfo/Net/1/V4/IP" | cut -d':' -f2 | xargs) && echo "$v1    $v2";done && echo "" && echo "If IPs are missing and the VMs are running wait a minute and run this script again" && echo ""
echo " "
echo "Set the hostnames after you get Ansible setup with:"
echo "for i in {1..3};do ansible all -b -m hostname -a name=ansible-guest0$i --limit ansible-guest0$i;done"
echo " "
