#!/bin/bash

function serviceStatus {
	nc -z $1 $2 > /dev/null
	if [ $? -ne 0 ]
	then 
		status="down"
	else
		status="up"
	fi
	printf '{"hostname":"%s","port":"%s","status":"%s"}' "$1" "$2" "$status"
}

function serviceStatusUDP {
	nc -uz $1 $2 > /dev/null
	if [ $? -ne 0 ]
	then 
		status="down"
	else
		status="up"
	fi
	printf '{"hostname":"%s","port":"%s","status":"%s"}' "$1" "$2" "$status"
}

echo "["
serviceStatus www.example.com 80; echo ","
# Add lines here for servers to check
serviceStatusUDP www.example.com 64453; echo ""
echo "]"
