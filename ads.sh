#!/bin/bash
 bold=`echo -en "\e[1m"`
 normal=`echo -en "\e[0m"`
 red=`echo -en "\e[31m"`
 LIGHTYELLOW=`echo -en "\e[103m"`
 DEFAULT=`echo -en "\e[49m"`

clear

echo "${LIGHTYELLOW}${red}${bold}   The file that will open next is for the database credentials."
echo "${LIGHTYELLOW}${red}${bold} Remember to replace all data after the = with your own selection."
echo "${LIGHTYELLOW}${red}${bold}      When you're done, press CTRL+X and Y to Save."
echo "$normal"
sleep 30
