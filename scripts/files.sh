#!/bin/bash

# Accessible Path (for it21204 user): /home/it21204/

clear

while true ; do

echo -n "*************************
 Harokopio University
 OS   : `uname`
 USER : $USER
*************************

 MENU
 1. Execute Command
 2. Find Files
 3. Show Usage
 4. Files' Full Path
 5. Modified Files
 6. Exit 

 Option: "

read opt
 
case $opt in

1) clear
	echo -n "Command: "
	
	read command
	
	find . | xargs $command
	
	until [ $? -eq 0 ]
		do $command

	if [ $? -ne 0 ] 
	then
		echo " "
		echo -n "Command: "
     	read command
     	echo $command
    	$command
	fi
	done
	echo " "
	echo " "
	;;

2) clear
	echo -n "Minimum Size of Files (MB): "
	
	read size
	
	echo "Files Bigger Than $size MB: "
	echo " "
	
	find . -type f -size +$((size*1024*1024))c
	
	echo " "
	echo " "
	;;

3) clear
	echo "Calculating Disk Usage! Please Wait..."
	echo " "
	
	DU1=$(du -s -k /$home | awk '{ print $1 }')
	DU2=$(((DU1*100)/5368709120))
	DU3=$((DU1/(1024*1024*1024)))
	
	echo "Disk Usage: $DU1 Bytes"
	echo "Disk Usage: $DU3 GB"
	
	CON=$(who am i | awk '{ print $6 }')
	
	if [ "$CON" == "(vpn.hua.gr)" ]; then
		echo "Disk Usage: $DU2 %"
	fi
	
	echo " "
	echo " "
	;;

4) clear
	echo "Files' Full Path (current directory): "
	ls -d -1 $PWD/*.*
	echo " "
	echo " "
	;;

5) clear
	echo -n " Modified Files
 1. Last Hour
 2. Last Day
	 
Option: "
	 
	read opt5
	
	echo " "
	
	if [ "$opt5" == "1" ] 
	then 
		echo "Modified Files Last Hour: " 
		find /home/it21204 -ctime 0
	elif [ "$opt5" == "2" ] 
	then
		echo "Modified Files Last Day: "
		find /home/it21204 -mtime -1
	fi
	
	echo " "
	echo " "
	;;

6) clear
    exit 1 
    ;;

esac

done
