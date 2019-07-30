#!/bin/bash
# Bash Menu Script Example

echo -e "\nPlease enter your name:\n"
read name
mkdir /root/Desktop/bashscripts/$name

echo -e "\nMr/Mrs $name following options can be performed:\n "

echo "Active Footprinting-"
echo "Option 1 : netdiscover"
echo "Option 2 : ping"
echo "Option 3 : nslookup"
echo "Option 4 : traceroute"
echo "Option 5 : nmap aggressive scan"
echo "Option 6 : Wanna Quit"

echo -e "\nNote: Mr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"

echo -e "\nNow try any one of the options:\n "

#------------------------------------------------------------------

PS3='Please enter your choice: '
options=("Option 1" "Option 2" "Option 3" "Option 4" "Option 5" "Quit")
select opt in "${options[@]}"
do
    case $opt in


        "Option 1")
            echo -e "\nyou chose choice 1\n"
            echo -e "\nRunning netdiscover.....\n"
   	    netdiscover -r 192.168.1.0/24 -f -PN | awk '{print $1}' | sed '/^$/d' | sed '$d'
            netdiscover -r 192.168.1.0/24 -f -PN | awk '{print $1}' | sed '/^$/d' | sed '$d'> /root/Desktop/bashscripts/$name/netdiscover.txt 
	    echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"
            
            ;;

#------------------------------------------------------------------------

        "Option 2")
            echo -e "\nyou chose choice 2\n" 
            echo -e "\nRunning ping.....\n"
   	    target=45.33.32.156
            timeout 8 ping $target
            timeout 8 ping $target > /root/Desktop/bashscripts/$name/ping.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"

           ;;

#------------------------------------------------------------------------

        "Option 3")
            echo "you chose choice $REPLY which is $opt" 
            echo -e "\nyou chose choice 3\n" 
            echo -e "\nRunning nslookup.....\n"
   	    target=45.33.32.156
            nslookup $target
            nslookup $target > /root/Desktop/bashscripts/$name/nslookup.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"

           ;;

#-------------------------------------------------------------------------

  "Option 4")
            echo -e "\nyou chose choice 4\n" 
            echo -e "\nRunning traceroute.....\n"
   	    target=45.33.32.156
            traceroute $target
            echo -e "\nWait please.....\n"
            traceroute $target > /root/Desktop/bashscripts/$name/traceroute.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"

           ;;

#-------------------------------------------------------------------------

"Option 5")
            echo -e "\nyou chose choice 5\n" 
            echo -e "\nRunning nmap aggressive scan.....\n"
   	    target=45.33.32.156
            nmap -A -v -n -T4 $target
            echo -e "\nWait please.....\n"
            nmap -A -v -n -T4 $target > /root/Desktop/bashscripts/$name/nmapAggressiveScan.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"

           ;;

#-------------------------------------------------------------------------
        "Quit")
            break            
            ;;

#-------------------------------------------------------------------------
            *) 
             echo "invalid option $REPLY"
             ;;
#-------------------------------------------------------------------------

    esac
done
