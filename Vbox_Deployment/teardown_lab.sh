#!/bin/bash

for i in ansible-host ansible-guest01 ansible-guest02 ansible-guest03;
do
    echo ""
    echo "Stop VM $i"
    echo ""
    /mnt/c/Program\ Files/Oracle/VirtualBox/VBoxManage.exe controlvm $i poweroff
    echo ""
    echo "Waiting for VM to shutdown"
    sleep 10s
    echo ""
    echo "Delete VM $i"
    echo ""
    /mnt/c/Program\ Files/Oracle/VirtualBox/VBoxManage.exe unregistervm $i
    echo ""
    echo "Delete Files for $i"
    echo ""
    rm -rf /mnt/c/Users/miker/VirtualBox\ VMs/$i/
done
