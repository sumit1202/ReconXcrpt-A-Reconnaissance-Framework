#!/bin/bash

#-------------------------------------------------------------------------

#Ethical-Hacking-Framework [Bash Menu Script Way]
#Ethical Hacking Framework, a framework providing beginners to play with various security-related tools.

#-------------------------------------------------------------------------


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
echo "Option 6 : nmap TCP connect scan"
echo "Option 7 : nmap SYN stealth scan"
echo "Option 8 : nmap Xmas scan"
echo "Option 9 : nmap Null scan"
echo "Option 10 : nmap Ping scan"
echo "Option 11 : nmap FIN scan"
echo "Option 12 : nmap UDP scan"
echo "Option 13 : nmap ACK scan"
echo "Option 14 : nmap version detection scan"
echo "Option 15 : nmap OS fingerprinting scan"
echo "Option 16 : whois"
echo "Option 17 : enum4linux"
echo "Option 18 : Wanna Quit"

echo -e "\nNote: Mr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"

echo -e "\nNow try any one of the options:\n "

#------------------------------------------------------------------

PS3='Please enter your choice: '
options=("Option 1" "Option 2" "Option 3" "Option 4" "Option 5" "Option 6" "Option 7" "Option 8" "Option 9" "Option 10" "Option 11" "Option 12" "Option 13" "Option 14" "Option 15" "Option 16" "Option 17" "Quit")
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
            nslookup -type=any $target > /root/Desktop/bashscripts/$name/nslookup.txt
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

"Option 6")
            echo -e "\nyou chose choice 6\n" 
            echo -e "\nRunning nmap TCP connect scan.....\n"
   	    target=45.33.32.156
            nmap -sT -v -n -T4 $target
            echo -e "\nWait please.....\n"
            nmap -sT -v -n -T4 $target > /root/Desktop/bashscripts/$name/nmapTCPconnectScan.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"

           ;;

#-------------------------------------------------------------------------

"Option 7")
            echo -e "\nyou chose choice 7\n" 
            echo -e "\nRunning nmap SYN stealth scan.....\n"
   	    target=45.33.32.156
            nmap -sS -v -n -T4 $target
            echo -e "\nWait please.....\n"
            nmap -sS -v -n -T4 $target > /root/Desktop/bashscripts/$name/nmapSYNstealthScan.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"

           ;;

#-------------------------------------------------------------------------

"Option 8")
            echo -e "\nyou chose choice 8\n" 
            echo -e "\nRunning nmap Xmas scan.....\n"
   	    target=45.33.32.156
            nmap -sX -v -n -T4 $target
            echo -e "\nWait please.....\n"
            nmap -sX -v -n -T4 $target > /root/Desktop/bashscripts/$name/nmapXmasScan.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"

           ;;

#-------------------------------------------------------------------------

"Option 9")
            echo -e "\nyou chose choice 9\n" 
            echo -e "\nRunning nmap Null scan.....\n"
   	    target=45.33.32.156
            nmap -sN -v -n -T4 $target
            echo -e "\nWait please.....\n"
            nmap -sN -v -n -T4 $target > /root/Desktop/bashscripts/$name/nmapNullScan.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"

           ;;

#-------------------------------------------------------------------------

"Option 10")
            echo -e "\nyou chose choice 10\n" 
            echo -e "\nRunning nmap Ping scan.....\n"
   	    target=45.33.32.156
            nmap -sn -v -n -T4 $target
            echo -e "\nWait please.....\n"
            nmap -sn -v -n -T4 $target > /root/Desktop/bashscripts/$name/nmapPingScan.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"

           ;;

#-------------------------------------------------------------------------

"Option 11")
            echo -e "\nyou chose choice 11\n" 
            echo -e "\nRunning nmap FIN scan.....\n"
   	    target=45.33.32.156
            nmap -sF -v -n -T4 $target
            echo -e "\nWait please.....\n"
            nmap -sF -v -n -T4 $target > /root/Desktop/bashscripts/$name/nmapFINscan.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"

           ;;

#-------------------------------------------------------------------------

"Option 12")
            echo -e "\nyou chose choice 12\n" 
            echo -e "\nRunning nmap UDP scan.....\n"
   	    target=45.33.32.156
            nmap -sU -v -n -T4 $target
            echo -e "\nWait please.....\n"
            nmap -sU -v -n -T4 $target > /root/Desktop/bashscripts/$name/nmapUDPscan.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"

           ;;

#-------------------------------------------------------------------------

"Option 13")
            echo -e "\nyou chose choice 13\n" 
            echo -e "\nRunning nmap ACK scan.....\n"
   	    target=45.33.32.156
            nmap -sA -v -n -T4 $target
            echo -e "\nWait please.....\n"
            nmap -sA -v -n -T4 $target > /root/Desktop/bashscripts/$name/nmapACKscan.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"

           ;; 


#-------------------------------------------------------------------------

"Option 14")
            echo -e "\nyou chose choice 14\n" 
            echo -e "\nRunning nmap version detection scan.....\n"
   	    target=45.33.32.156
            nmap -sV -v -n -T4 $target
            echo -e "\nWait please.....\n"
            nmap -sV -v -n -T4 $target > /root/Desktop/bashscripts/$name/nmapVersionDetectionSscan.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"

           ;; 

#-------------------------------------------------------------------------

"Option 15")
            echo -e "\nyou chose choice 15\n" 
            echo -e "\nRunning nmap OS fingerprinting scan.....\n"
   	    target=45.33.32.156
            nmap -O -v -n -T4 $target
            echo -e "\nWait please.....\n"
            nmap -O -v -n -T4 $target > /root/Desktop/bashscripts/$name/nmapOSfingerprintingScan.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"

           ;; 

#-------------------------------------------------------------------------

"Option 16")
            echo -e "\nyou chose choice 16\n" 
            echo -e "\nRunning whois.....\n"
   	    target=45.33.32.156
            whois --verbose $target
            echo -e "\nWait please.....\n"
            whois --verbose $target > /root/Desktop/bashscripts/$name/whois.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"

           ;;

#-------------------------------------------------------------------------

"Option 17")
            echo -e "\nyou chose choice 17\n" 
            echo -e "\nRunning enum4linux.....\n"
   	    target=192.168.1.9
            enum4linux -v $target
            echo -e "\nWait please.....\n"
            enum4linux -v $target > /root/Desktop/bashscripts/$name/enum4linux.txt
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
