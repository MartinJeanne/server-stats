#!/bin/bash
echo -e "\e[34mSERVER USAGE\e[0m"
# make two iteration of top, keep %Cpu(s) line, keep the id part, 100-free cpu%
top -bn2 | grep "%Cpu(s):" | cut -d ',' -f 4 | tail -n 1 | awk '{print "CPU usage: " 100-$1 "%"}'

# show free ram, keep the frist lien, keep the "total" and "used" columns
read total used <<<$(free | grep Mem: | awk '{ print $2, $3 }')
memoryUsed=$((used * 100 / total))
echo -e "Memory usage: $memoryUsed%"

# get all disk, keep the "/" one, print the "Use%" column
diskUsed=$(df | grep /$ | awk '{ print $5 }') 
echo "Disk usage: $diskUsed"

echo -e "\e[34m\nTop 5 processes by CPU usage: \e[0m"
# list all process, keep column 11 and 3, sort numeric reverse on column 2
ps aux | awk '{ print $3"%", $11 }' | sort -nr -k 1 | head -n 5 

echo -e "\e[34m\nTop 5 processes by memory usage: \e[0m"
# list all process, keep column 11 and 4, sort numeric reverse on column 2
ps aux | awk '{ print $4"%", $11 }' | sort -nr -k 1 | head -n 5 
