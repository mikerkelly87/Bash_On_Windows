#!/bin/bash

for i in ansible-host ansible-guest01 ansible-guest02 ansible-guest03;
do
    echo "Creating VM Directory on Disk"
    mkdir /mnt/c/Users/miker/VirtualBox\ VMs/$i
    echo ""
    echo "Creating Virtual Hard Drive from Base"
    /mnt/c/Program\ Files/Oracle/VirtualBox/VBoxManage.exe clonevdi C:/Users/miker/VirtualBox\ VMs/base/base.vdi C:/Users/miker/VirtualBox\ VMs/$i/$i.vdi
    echo ""
    echo "Creating VM"
    /mnt/c/Program\ Files/Oracle/VirtualBox/VBoxManage.exe  createvm --name $i --ostype "RedHat_64" --register
    /mnt/c/Program\ Files/Oracle/VirtualBox/VBoxManage.exe  storagectl $i --name "SATA Controller" --add sata --controller IntelAHCI
    /mnt/c/Program\ Files/Oracle/VirtualBox/VBoxManage.exe  storageattach $i --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium 'C:\Users\miker\VirtualBox VMs\'$i'\'$i'.vdi'
    /mnt/c/Program\ Files/Oracle/VirtualBox/VBoxManage.exe  storagectl $i --name "IDE Controller" --add ide
    /mnt/c/Program\ Files/Oracle/VirtualBox/VBoxManage.exe  modifyvm $i --memory 1024 --vram 128
    /mnt/c/Program\ Files/Oracle/VirtualBox/VBoxManage.exe  modifyvm $i --hostonlyadapter4 "VirtualBox Host-Only Ethernet Adapter"
    /mnt/c/Program\ Files/Oracle/VirtualBox/VBoxManage.exe  modifyvm $i --nic4 hostonly
    echo ""
    echo "Starting VM"
    /mnt/c/Program\ Files/Oracle/VirtualBox/VBoxManage.exe  startvm $i
done
