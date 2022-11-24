#!/bin/bash
. ./color.conf

function stamp {
END_COLOR="\033[37m\033[0m"
echo -e "${left_text}${left_back}HOSTNAME${END_COLOR} = ${right_text}${right_back}$HOSTNAME${END_COLOR}"
echo -e "${left_text}${left_back}TIMEZONE${END_COLOR} = ${right_text}${right_back}$TIMEZONE${END_COLOR}"
echo -e "${left_text}${left_back}USER${END_COLOR} = ${right_text}${right_back}$USER${END_COLOR}"
echo -e "${left_text}${left_back}OS${END_COLOR} = ${right_text}${right_back}$OS${END_COLOR}"
echo -e "${left_text}${left_back}DATE${END_COLOR} = ${right_text}${right_back}$DATE${END_COLOR}"
echo -e "${left_text}${left_back}UPTIME${END_COLOR} = ${right_text}${right_back}$UPTIME${END_COLOR}"
echo -e "${left_text}${left_back}UPTIME_SEC${END_COLOR} = ${right_text}${right_back}$UPTIME_SEC${END_COLOR}"
echo -e "${left_text}${left_back}IP${END_COLOR} = ${right_text}${right_back}$IP${END_COLOR}"
echo -e "${left_text}${left_back}MASK${END_COLOR} = ${right_text}${right_back}$MASK${END_COLOR}"
echo -e "${left_text}${left_back}GATEWAY${END_COLOR} = ${right_text}${right_back}$GATEWAY${END_COLOR}"
echo -e "${left_text}${left_back}RAM_TOTAL${END_COLOR} = ${right_text}${right_back}$RAM_TOTAL${END_COLOR}"
echo -e "${left_text}${left_back}RAM_USED${END_COLOR} = ${right_text}${right_back}$RAM_USED${END_COLOR}"
echo -e "${left_text}${left_back}RAM_FREE${END_COLOR} = ${right_text}${right_back}$RAM_FREE${END_COLOR}"
echo -e "${left_text}${left_back}SPACE_ROOT${END_COLOR} = ${right_text}${right_back}$SPACE_ROOT${END_COLOR}"
echo -e "${left_text}${left_back}SPACE_ROOT_USED${END_COLOR} = ${right_text}${right_back}$SPACE_ROOT_USED${END_COLOR}"
echo -e "${left_text}${left_back}SPACE_ROOT_FREE${END_COLOR} = ${right_text}${right_back}$SPACE_ROOT_FREE${END_COLOR}"
echo ""
}

function choose {
	code=0

	case "$1" in
		1) code=7;;
		2) code=1;;
		3) code=2;;
		4) code=4;;
		5) code=5;;
		6) code=0;;
	esac

	return $code
}

function sample {
	if [[ $1 -eq 1 ]]
	then
		echo "Column 1 background = default (black)"
	else
		echo -n "Column 1 background =" ${column1_background}
		name_color ${column1_background}
	fi

	if [[ $2 -eq 1 ]]
	then
		echo "Column 1 font color = default (white)"
	else
		echo -n "Column 1 font color =" ${column1_font_color}
		name_color ${column1_font_color}
	fi

	if [[ $3 -eq 1 ]]
	then
		echo "Column 2 background = default (red)"
	else
		echo -n "Column 2 background =" ${column2_background}
		name_color ${column2_background}
	fi

	if [[ $4 -eq 1 ]]
	then
		echo "Column 2 font color = default (blue)"
	else
		echo -n "Column 2 font color =" ${column2_font_color}
		name_color ${column2_font_color}
	fi
}

function name_color {
	case "$1" in
		1) echo " (white)";;
		2) echo " (red)";;
		3) echo " (green)";;
		4) echo " (blue)";;
		5) echo " (purple)";;
		6) echo " (black)";;
	esac
}

function choose_all {
	if ! [[ $column1_background =~ $number ]]
	then
		left_back="\033[40m"
		default1=1
	else
		choose $column1_background
		left_back="\033[4$?m"
	fi

	if ! [[ $column1_font_color =~ $number ]]
	then
		left_text="\033[37m"
		default2=1
	else
		choose $column1_font_color
		left_text="\033[3$?m"
	fi

	if ! [[ $column2_background =~ $number ]]
	then
		right_back="\033[41m"
		default3=1
	else
		choose $column2_background
		right_back="\033[4$?m"
	fi

	if ! [[ $column2_font_color =~ $number ]]
	then
		right_text="\033[34m"
		default4=1
	else
		choose $column2_font_color
		right_text="\033[3$?m"
	fi
}
