#!/bin/bash
#this script switches between two or more mapping for any mouse-like device
#you need to pass the device id to the script as argument when launching it
#to know your current mapping use >xev< command, for your device list use >xinput list<
#to add an option, just add a new "elif"
#refer to http://wiki.birth-online.de/know-how/software/linux/remapping-mousebuttons and http://ubuntuforums.org/archive/index.php/t-2094829.htmlfor more informations

#uses argument $1 as mouse id
ids=$1

#mappings
default='1 2 3 4 5 6 7 8 9 10'
custom1='6 2 7 4 5 1 3 8 9 10'
custom2='1 2 3 4 5 6 7 8 9 1'

#checks if the user passed the argument to the script after the script name
if [ -z $1 ]
	then 
	echo "No argument passed to script"
	#echo "Check using >xinput list< command first to find your device id"
	echo "Find your device name in the list below"
	echo "Then use the number corresponding to id=[] as argument to launch the script"
	echo "e.g.: for id=14"
	echo "./mouseKeybindsRemap.sh 14"
	echo ""
	echo `xinput --list` | sed -e "s/\[[a-z]* [a-z]*[ ]*([0-9])\][ ]*/\\n/g"
	echo ""
	echo "NB: to modify the available modes, edit the script."
	sleep 10
exit; fi

#switches between modes
echo -e "\033[1;32myour are going to switch mapping settings of your \033[0;0m Mice! \033[1;32m"
#echo -e "your mice ID is : \033[0;0m$ids\033[1;32m"
echo "option 0 is default mappig!"
echo "option 1 and 2 are remapped settings : custom left/right click"
echo "option 1 : use wheel right and left click to emulate standard right and left click"
echo "option 2 : use thumb click to emulate left click"

read -p 'option 1/2? (anything else to exit):' opt0
echo "your choice is $opt0"
case $opt0 in
	#check which option has been choosen
	#Option 0
	[0] ) echo -e "setting opt0 (\033[0;0m$opt0\033[1;32m)"
	#calling xinput to remap the buttons
	echo `xinput set-button-map $ids $default`
	;;
	#Option 1
	[1] ) echo -e "setting opt1 (\033[0;0m$opt0\033[1;32m)"
	#calling xinput to remap the buttons
	echo `xinput set-button-map $ids 6 2 7 4 5 1 3 8 9 10`
	;;
	#Option 2
	[2] ) echo -e "setting opt2 (\033[0;0m$opt0\033[1;32m)"
	#calling xinput to remap the buttons
	echo `xinput set-button-map $ids $custom2`
	;;
	#invalid Option
	* ) echo -e "\033[1;31msomething went wrong : \033[1;32mnot a valid option!"
	;;
esac
echo -e "\033[0;0mwill now exit"
sleep 10
