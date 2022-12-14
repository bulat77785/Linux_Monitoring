#!/bin/bash

. ./data02.sh

HOSTNAME=$(hostname)
timedatectl set-timezone Europe/Moscow
TIMEZONE="$(cat /etc/timezone) $(date -u "+%Z") $(date "+%z")"
USER=$(sudo grep "session opened" /var/log/auth.log | tail -1 | awk '{print $13}' | cut -d "(" -f 1)
OS=$(cat /etc/issue.net)
DATE=$(date +"%d %B %Y %H:%M:%S")
UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | cut -d " " -f 1 | cut -d "." -f 1)
IP=$(hostname -I | cut -d " " -f 1)
MASK=$(sudo ifconfig | grep -m1 "mask" | cut -d " " -f 13)
GATEWAY=$(ip route show match 0/0 | cut -d " " -f 3)
RAM_TOTAL=$(free -m | awk '/Mem:/{printf "%.3f GB\n", $2/1024}')
RAM_USED=$(free -m | awk '/Mem:/{printf "%.3f GB\n", $3/1024}')
RAM_FREE=$(free -m | awk '/Mem:/{printf "%.3f GB\n", $4/1024}')
SPACE_ROOT=$(df /root | awk '/dev/ {printf "%.2f MB\n", $2/1024}')
SPACE_ROOT_USED=$(df /root | awk '/dev/ {printf "%.2f MB\n", $3/1024}')
SPACE_ROOT_FREE=$(df /root | awk '/dev/ {printf "%.2f MB\n", $4/1024}')

stamp

read -p "Write data to a file (Press Y/N)?: " answer

if [[ $answer = Y ]] || [[ $answer = y ]]
then
	today_date=$(date +"%d_%m_%y_%H_%M_%S.status")
	touch $today_date
	stamp > "$today_date"
	echo "The data is written to the file of the current directory"
else
	echo "No data recorded"
fi
