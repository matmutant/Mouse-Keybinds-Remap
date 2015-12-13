#!/bin/bash
#this script switches between two or more mapping for your unifying Logitech device
#you need to manually edit the device name, since i couldn't automate this command
#to know your current mapping use >xev< command, for your device list use >xinput list<
#to add an option, just add a new "elif"
#this has been done for M505, but should work for others
#
#Source code and README available here: https://github.com/matmutant/m505-Remap
#
#refer to http://wiki.birth-online.de/know-how/software/linux/remapping-mousebuttons and http://ubuntuforums.org/archive/index.php/t-2094829.htmlfor more informations
NAME='Logitech M505/B605'
#looking for device ID
ids=$(xinput list | grep "$NAME" | grep -o -e "id=.." | sed "s/id=//g")
echo -e "\033[1;32myour are going to switch mapping settings of your \033[0;0m Logitech Mice! \033[1;32m"
echo -e "make sure your device is \033[0;0m$NAME\033[1;32m"
echo "check using >xinput list< command first"
echo -e "your mice ID is : \033[0;0m$ids\033[1;32m"
echo "option 1 is remapped settings : custom left/right click"
echo "option 2 is default mappig!"
read -p 'option 1/2? (anything else to exit):' opt0
echo "your choice is $opt0"
if [ $opt0 -eq 1 ]
then
	echo -e "setting opt1 (\033[0;0m$opt0\033[1;32m)"
	#calling xinput to remap the buttons
	echo `xinput set-button-map $ids 6 2 7 4 5 1 3`
elif [ $opt0 -eq 2 ]
then
	echo -e "setting opt2 (\033[0;0m$opt0\033[1;32m)"
	#calling xinput to remap the buttons
	echo `xinput set-button-map $ids 1 2 3 4 5 6 7`
	#sleep 10
else
	echo -e "\033[1;31msomething went wrong : \033[1;32mnot a valid option!"
fi
echo -e "\033[0;0mwill now exit"
sleep 10
