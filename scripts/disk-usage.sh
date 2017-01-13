#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo " Usage: $0 command" >&2
	exit 1
fi

command -v $1

if [ "$?" -eq 0 ]
then
	echo "Command Found."
	exit 0
else 
	echo "Command Not Found."
	echo "Searching System..."
fi

# Accessible Path (for it21204 user): /home/it21204/
LINES=$(find /home/it21204/ -type f -name $1 2>/dev/null | wc -l)

if [ "$LINES" -eq 0 ]
then
	echo "Command Not Found."
	exit 1
else 
	echo "Command Found."
	
	FILE=$(find /home/it21204/ -type f -name $1 2> /dev/null)
	
	command -v $FILE
	
	if [ "$?" -eq 0 ]
	then
		echo "Command is Executable."
		echo "Adding Catalog to Path..."
	
		DIR=$(dirname $FILE)
	
		export PATH=${PATH}:~$DIR
		echo $PATH
		
		echo "$1 - Path: $PATH - Catalog: $DIR - Date: $(date)" >> ex1-2.log
	else
		echo "Command is Not Executable."		
	fi
	
fi

