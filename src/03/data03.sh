#!/bin/bash

function stamp {
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
