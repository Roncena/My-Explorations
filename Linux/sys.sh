#!/bin/bash

mkdir ~/Research 2> /dev/null

echo "A Quick System Audti Script" > ~/Research/sys_info.txt
date >> ~/Research/sys_info.txt
echo "Machine Info:" >> ~/Research/sys_info.txt
echo $MACHTYPE >> ~/Research/sys_info.txt
echo -e "Uname Info: $(uname -a) \n" >> ~/Research/sys_info.txt
echo -e "IP Info: $(ip addr | head -9 | tail -1) \n" >> ~/Research/sys_info.txt
echo "Hostname is: $(hostname -s)" >> ~/Research/sys_info.txt
echo -e "\n777 Files:" >> ~/Research/sys_info.txt
find / -type f -perm 777 >> ~/Research/sys_info.txt
echo "DNS Servers: " >> ~/Research/sys_info.txt
cat /etc/resolv.conf >> ~/Research/sys_info.txt
echo -e "\nTop 10 Processes" >> ~/Research/sys_info.txt
echo "Currently Logged on Users" >> ~/Research/sys_info.txt
ps aux -m | awk -F" " '{print $1, $2, $3, $4, $11}' | head >> ~/Research/sys_info.txt
