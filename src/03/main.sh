#!/bin/bash

. ./data03.sh

if [[ -n $1 ]]
then
	if [[ -n $2 ]] && [[ -n $3 ]] && [[ -n $4 ]]
	then
		if [[ -n $5 ]]
		then
			echo "More than four parameters have been entered"
		else
			number="^[1-6]$"
			if [[ $1 =~ $number ]] && [[ $2 =~ $number ]] && [[ $3 =~ $number ]] && [[ $4 =~ $number ]]
			then
				if [[ $1 == $2 ]] || [[ $3 == $4 ]]
				then
					echo "The value of 1 must not match the value of 2. The value of 3 must the value of 4. Please call the script again."
				else
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

					choose $1
					left_back="\033[4$?m"
					choose $2
					left_text="\033[3$?m"
					choose $3
					right_back="\033[4$?m"
					choose $4
					right_text="\033[3$?m"
					END_COLOR="\033[37m\033[0m"

					stamp
				fi
			else
				echo "Incorrect parameters. Please enter 4 digits in the range from 1 to 6"
			fi
		fi
	else
		echo "Not all parameters are specified"
	fi
else
	echo "No parameter has been entered"
fi
