#!/bin/bash

echo -e "===== System Health Report =====\n"

#Basic Info
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"
echo -e "Current User: $(whoami)\n"



echo "--- CPU ---"

#TO BE MODIFIED
#here we will have to get the cpu load average only.

uptime | awk '{print $8,$9,$10,$11,$12}' | tr -d ,
echo -e "\n"


echo "--- Memory ---"
#TO BE MODIFIED
#here we will have to only write the values.


#total -> free -h | awk '{print $2}' | head -2 | tail -1
#used -> free -h | awk '{print $3}' | head -2 | tail -1
#free / available - > free -h | awk '{print $7}' | head -2 | tail -1


echo "Available Memory : $(free -h | awk '{print $2}' | head -2 | tail -1)"
echo "Used Memory : $(free -h | awk '{print $3}' | head -2 | tail -1)"
echo -e "Free Memory : $(free -h | awk '{print $7}' | head -2 | tail -1)\n"




echo "--- Disk ---"
df -h
echo -e "\n"


echo "--- Services ---"

for service in sshd NetworkManager firewalld
do
echo $service : $(systemctl is-active $service)
done
