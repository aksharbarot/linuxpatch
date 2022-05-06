#!/bin/bash

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"
BLUE="\033[0;34m"

echo -e "${BLUE}**************Linux Patching Script*****************${NOCOLOR}"
echo ""

echo -e "${GREEN}Patching Script for Prod/Non${NOCOLOR}"

echo ""

echo -e "${RED}Please Read Instruction and Run script${NOCOLOR}"
echo -e "${BLUE}*************************************************${NOCOLOR}"
echo "Provide Machine IP address"
echo ""
echo ""
echo "Provide Environment (prod/dev)"
echo ""
echo ""
echo ""
echo -e "${BLUE}*************************************************${NOCOLOR}"

echo ""
read -p 'Provide Machine IP address: ' lid
echo ""
read -p 'Provide Environment (prod/dev): ' rid
`echo $lid > ./inventory`
echo ""

echo -n "Do you want to patch provided VM? (yes/no):"
read choice

if [ "$choice" ==  "yes" ] ; then
       ansible-playbook rhsm.yml --extra-vars "envkey=$rid bip=$lid" -v
else
        echo "Bye!"
fi
