# Mouse-Keybinds-Remap
Automated remaping script for Any mouse : changing buttons layout/behavior


This script switches between two or more mapping input device
##Making it work:
  - First launch the script from your terminal, without any argument.
  - The script will complain about having no argument, and will display ```xinput list``` output so you can know your mouse id.
  - Then, simply call the script with the input device id as argument:
     e.g.: for id=14, type : ```./mouseKeybindsRemap.sh 14```
  
  - In order to know your current mapping use >xev< command.
  - To modify the mapping you want, you need to hardcode it in the script. For correct mapping, refer to [here](http://wiki.mbirth.de/know-how/software/linux/remapping-mouse-buttons.html)
  - To add an option, just set new custom mapping under ```mappings```
  
  e.g.: 
  ```custom3='1 2 3 4 5 6 7 8 9 2'```
  
  then, add a new option in ```case``` before the ```#invalid Option```
  
  e.g.:
  ```
  #Option 3
    	[3] ) echo -e "setting opt3 (\033[0;0m$opt0\033[1;32m)"
    	#calling xinput to remap the buttons
    	echo `xinput set-button-map $ids $custom3`
    	;;
  ```


##How does it work?
After you've hardcoded the mapping you want in a ```custom[0-9]``` variable and made the corresponding changes in the ```case``` and called the script with the device id as argument:

1. The script will ask the ser for mapping between the ones available (hardcoded configs as explained above) 
2. Depending on the choosen number it will either apply one of the coded configs or leave 
3. xinput applies the new mapping :  
  ```echo `xinput set-button-map $ids $custom3` ```  
4. the script exits

##Sources
Refer to http://wiki.birth-online.de/know-how/software/linux/remapping-mousebuttons and http://ubuntuforums.org/archive/index.php/t-2094829.html for more informations
