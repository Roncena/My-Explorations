#!/bin/bash

# Check if script was run as root. Exit if false.
if [ $UID -ne 0 ]
then
echo "Please run this script with sudo."
fi

# Define Variables
output=$HOME/Research/sys_info.txt
ip=$(ip addr | head -9 | tail -1)
execs=$(find/home -type f -perm 777)
files=(
'/etc/passwd'
'etc/shadow'
)

# Check for research directory.  Create it if needded
if [ ! -d $HOME/Research ]
then
mkdir $HOME/Research
fi

# Check for output of file.  Clear it if needed.
if [ -f $output ]
then rm $output
fi

echo "A Quick System Audit Script" >> $output
date >> $output
echo "Machine Info:" >> $output
echo $MACHTYPE >> $output
echo -e "Uname Info: $(uname -a) \n" >> $output

# Display IP address
echo -e "IP Info:" >> $output
echo -e "$ip \n" >> $output
echo "DNS Servers: " >> $output
cat /etc/resolv.conf >> $output

# Display Memory info
echo -e "\nMemory Info:" >> $output
free >> $output

# Displays CPU usage
echo -e "\CPU Info:" >> $output
lscpu | grep CPU >> $output

# Displays Disk Usage
echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output

# Display current user
echo -e "\nWho is logged in: \n $(who -a) \n" >> $output
echo "Hostname is: $(hostname -s)" >> $output
echo -e "\n777 Files:" >> $output
echo -e "\nexec Files:" >> $output
echo $execs >> $output
echo -e "\nTop 10 Processes" >> $output
echo "Currently Logged on Users" >> $output
ps aux -m | awk -F" " '{print $1, $2, $3, $4, $11}' | head >> $output
fi

echo -e "\nThe permissions for sensitive /etc files: \n' >> $output
for file in ${files[@]}
do
    ls -l $file >> $output
done

for user in $(ls /home)
do
    sudo -lU $user
done

# For loop instead of variables
commands = (
'date'
'uname -a'
'hostname -s'
)

for x in {0..2}
do
    results=$(${commands[$x]})
    echo "Results of \"$commands[$x]}\" command:"
    echo $results
    echo ""
done
