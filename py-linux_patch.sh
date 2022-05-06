#!/bin/bash
var1=$1
var2=$2
#echo -n "Do you want to patch provided VM? (yes/no):"
#read choice
`echo $var1 > /root/aws-patch/single_linux_patch/inventory`

ansible-playbook /root/aws-patch/single_linux_patch/rhsm.yml -i /root/aws-patch/single_linux_patch/inventory --extra-vars "envkey=$var2 bip=$var1" -v
