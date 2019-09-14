#! /bin/bash 

read -n 1 -s -r -p "Once the above is complete - press any key to continue"

echo
echo "Enter Jenkins Target IP Address"
echo

read target

echo "Scanning Target with Nmap" $target
echo

nmap -sS -Pn -oN /root/results_portscan.txt $target 

echo 

echo "Executing scan"
echo "done"


