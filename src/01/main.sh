#!/bin/bash

if [[ -n $1 ]]
then
	if [[ -n $2 ]]
	then
		echo "More than one parameter has been entered"
	else
		number="^[-+]?[0-9]+([.][0-9]+)?$"
		if [[ $1 =~ $number ]]
		then
			echo "Incorrect input"
		else
			echo $1
		fi
	fi
else
	echo "No parameter has been entered"
fi
