#!/bin/bash

. ./data.sh

read -p "Write data to a file (Press Y/N)?: " answer

if [[ $answer = Y ]] || [[ $answer = y ]]
then
	stamp_date=$(date +"%d_%m_%y_%H_%M_%S.status")
	touch $stamp_date
	./data.sh > "stamp_date"
	echo "The data is written to the file of the current directory"
else
	echo "No data recorded"
fi
