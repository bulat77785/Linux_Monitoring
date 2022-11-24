#!/bin/bash

. ./data05.sh

START=$(date +%s)

if [[ -n $1 ]]
then
	if [[ -d $1 ]]
	then
		if [[ ${1: -1} = "/" ]]
		then
			if [[ -n $2 ]]
			then
				echo "More than one parameter have been entered"
			else	
				TOTAL=$(sudo find $1 -mindepth 1 -type d 2>/dev/null | wc -l)
				TOP1=$(sudo du -ha $1 2>/dev/null | sort -hr | head -n 2 | tail -1 | awk '{print $2}')
				TOP01=$(sudo du -ha $1 2>/dev/null | sort -hr | head -n 2 | tail -1 | awk '{print $1}' | sed 's/[a-zA-Z]$//')
	  			TOP001=$(sudo du -ha $1 2>/dev/null | sort -hr | head -n 2 | tail -1 | awk '{print $1}' | rev | cut -c -1)
				TOP2=$(sudo du -ha $1 2>/dev/null | sort -hr | head -n 3 | tail -1 | awk '{print $2}')
				TOP02=$(sudo du -ha $1 2>/dev/null | sort -hr | head -n 3 | tail -1 | awk '{print $1}' | sed 's/[a-zA-Z]$//')
				TOP002=$(sudo du -ha $1 2>/dev/null | sort -hr | head -n 3 | tail -1 | awk '{print $1}' | rev | cut -c -1)
				TOP3=$(sudo du -ha $1 2>/dev/null | sort -hr | head -n 4 | tail -1 | awk '{print $2}')
				TOP03=$(sudo du -ha $1 2>/dev/null | sort -hr | head -n 4 | tail -1 | awk '{print $1}' | sed 's/[a-zA-Z]$//')
				TOP003=$(sudo du -ha $1 2>/dev/null | sort -hr | head -n 4 | tail -1 | awk '{print $1}' | rev | cut -c -1)
				TOP4=$(sudo du -ha $1 2>/dev/null | sort -hr | head -n 5 | tail -1 | awk '{print $2}')
				TOP04=$(sudo du -ha $1 2>/dev/null | sort -hr | head -n 5 | tail -1 | awk '{print $1}' | sed 's/[a-zA-Z]$//')
				TOP004=$(sudo du -ha $1 2>/dev/null | sort -hr | head -n 5 | tail -1 | awk '{print $1}' | rev | cut -c -1)
				TOP5=$(sudo du -ha $1 2>/dev/null | sort -hr | head -n 6 | tail -1 | awk '{print $2}')
				TOP05=$(sudo du -ha $1 2>/dev/null | sort -hr | head -n 6 | tail -1 | awk '{print $1}' | sed 's/[a-zA-Z]$//')
				TOP005=$(sudo du -ha $1 2>/dev/null | sort -hr | head -n 6 | tail -1 | awk '{print $1}' | rev | cut -c -1)
				total=$(find "$1" -type f 2>/dev/null | wc -l)
				config_files=$(find "$1" -name "*.conf" 2>/dev/null | wc -l)
				text_files=$(find "$1" -name "*.txt" 2>/dev/null | wc -l)
				exec_files=$(find "$1" -type f -executable 2>/dev/null | wc -l)
				log_files=$(find "$1" -name "*.log" 2>/dev/null | wc -l)
				arc_files=$(find "$1" -name "*.zip" -o -name "*.tar" -o -name "*.rar" -o -name "*.7z" 2>/dev/null | wc -l)
				sym_links=$(find "$1" -type l 2>/dev/null | wc -l)
				stamp
				ten_files $1
				ten_exec_files $1
				exec_time
			fi
		else
			echo "Parameter must end in \"/\""
		fi
	else
		echo "There is no such folder"
	fi
else
	echo "No parameter has been entered"
fi
