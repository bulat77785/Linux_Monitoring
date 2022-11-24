#!/bin/bash

function stamp {
	echo "Total number of folder (including all nested) = $TOTAL"
	echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
	echo "1 - $TOP1/, $TOP01 $(testo $TOP001)"
	echo "2 - $TOP2/, $TOP02 $(testo $TOP002)"
	echo "3 - $TOP3/, $TOP03 $(testo $TOP003)"
	echo "4 - $TOP4/, $TOP04 $(testo $TOP004)"
	echo "5 - $TOP5/, $TOP05 $(testo $TOP005)"
	echo "Total number of files $total"
	echo "Number of:"
	echo "Configuration files (with the .conf extension) = $config_files"
	echo "Text files = $text_files"
	echo "Executable files = $exec_files"
	echo "Log files (with the extension .log) = $log_files"
	echo "Archive files = $arc_files"
	echo "Symbolic links = $sym_links"
}

wordb="^[B]$"
wordk="^[K]$"
wordm="^[M]$"
wordg="^[G]$"
function testo {
	if [[ $1 =~ $wordk ]]
	then
		echo "kB"
	elif [[ $1 =~ $wordm ]]
	then
		echo "MB"
	elif [[ $1 =~ $wordg ]]
	then
		echo "GB"
	elif [[ $1 =~ $wordb ]]
	then	
		echo "B"
	fi
}

function ten_files {
	echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
	for num in {1..10}
	do
		ten_str=$(find $1 2>/dev/null -type f -exec du -h {} + | sort -hr | head -10 | sed "${num}q;d")
		if [[ -n $ten_str ]]
		then
			echo -e "$num - $(echo $ten_str | awk '{print $2}'), $(echo $ten_str | awk '{print $1}' | sed -e 's:K: kB:g' | sed -e 's:M: MB:g' | sed -e 's:G: GB:g'), $(echo $ten_str | awk '{print $2}' | rev | cut -d "." -f 1 | rev)"
		fi
	done
}

function ten_exec_files {
	echo "Top 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
	for num in {1..10}
	do
		ten_exec_str=$(find $1 2>/dev/null -type f -executable -exec du -h {} + | sort -hr | head -10 | sed "${num}q;d")
		if [[ -n $ten_exec_str ]]
		then
			echo -e "$num - $(echo $ten_exec_str | awk '{print $2}'), $(echo $ten_exec_str | awk '{print $1}' | sed -e 's:K: KB:g' | sed -e 's:M: MB:g' | sed -e 's:G: GB:g'), $(md5sum $(echo $ten_exec_str | awk '{print $2}') | awk '{print $1}')"
		fi
	done
}

function exec_time {
	DIFF=$(echo "$(date +%s.%N) - $START" | bc)
	printf "Script execution time (in seconds) = %.1f\n" $DIFF
}
