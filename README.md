# Mouse-Keybinds-Remap
Automated remaping script for Logitech m505/M705 mouse : changing buttons layout/behavior


This script switches between two or more mapping for your unifying Logitech device
##Making it work:
You need to manually edit the device name, since i couldn't automate this command:
  to know your current mapping use >xev< command, for your device list use >xinput list<
  To add an option, just add a new "elif"

this has been done for M505 and M705, but it should work for others

Simply uncomment the mouse name or add a new one.

##How does it work?
After you've hardcoded the device name in variable $NAME, the script will look for the ID corresponding to it:
ids=$(xinput list | grep "$NAME" | grep -o -e "id=.." | sed "s/id=//g")
1- xinput is called and lists attached input devices
2- grep catches the line containing the device $NAME
3- second grep catches the id from the line previousy greped
4- sed removes the "id=" from the output
5- only the ID number is left so the script can process it.

Then it asks user what to do (choosing between coded configs)

Depending on the choosen number it will either apply one of the coded configs or leave

##Sources
Refer to http://wiki.birth-online.de/know-how/software/linux/remapping-mousebuttons and http://ubuntuforums.org/archive/index.php/t-2094829.html for more informations
