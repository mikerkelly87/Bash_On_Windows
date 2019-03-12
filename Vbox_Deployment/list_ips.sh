#!/bin/bash

echo " " && echo "Here is /etc/hosts for ansible-host" && echo "" && for i in ansible-host ansible-guest01 ansible-guest02 ansible-guest03;do v1=$i && v2=$(/mnt/c/Program\ Files/Oracle/VirtualBox/VBoxManage.exe guestproperty get $i "/VirtualBox/GuestInfo/Net/1/V4/IP" | cut -d':' -f2 | xargs) && echo "$v1    $v2";done && echo "" && echo "If IPs are missing and the VMs are running wait a minute and run this script again" && echo ""
