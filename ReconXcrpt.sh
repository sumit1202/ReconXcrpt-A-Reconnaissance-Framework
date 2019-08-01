#!/bin/bash

#-------------------------------------------------------------------------

#Reconnaissance-Framework [Bash Menu Script Way]
#ReconXcrpt,a reconnaissance framework providing beginners to play with various recon-related tools.

#-------------------------------------------------------------------------
echo -e "\n"
toilet -t -F metal ReconXcrpt
echo -e "\n"
#toilet -t -F gay ReconXcrpt
echo -e "<< Welcome.2.ReconXcrpt >>\n"
echo -e "ReconXcrpt >> An ethical-hacking-framework providing beginners to play with various reconnaissance tools.\n\n"

#-------------------------------------------------------------------------

read -p "Please enter your name:" name
mkdir /root/Desktop/bashscripts/$name

#--------------------------------------------------------------------------

netd()
{
  echo -e "\nRunning netdiscover.....\n" 
  `netdiscover -r 192.168.1.0/24 -PN >/root/Desktop/bashscripts/$name/netdiscover.txt`

   cat netdiscover.txt | awk '{print $1}'
  
}

#--------------------------------------------------------------------------


sumit()
{



echo -e "\nMr/Mrs $name,you can try any one of the options:\n "


PS3='Please enter your choice: '
options=("ping" "nslookup" "traceroute" "whois" "enum4linux" "dnsenum" "smbclient" "nbtscan" "Quit")
select opt in "${options[@]}"
do
    case $opt in


    
#------------------------------------------------------------------------

        "ping")
            
            netd
            read -p "Enter ip:" target
            
            echo -e "\nRunning ping.....\n"
   	    timeout 8 ping $target
            echo -e "\nWait Please.....\n"
            timeout 8 ping $target > /root/Desktop/bashscripts/$name/ping.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"
            
            sumit
            ;;

#------------------------------------------------------------------------

        "nslookup")

            read -p "Enter domain/ip:" target
            echo -e "\nRunning nslookup.....\n"
   	    nslookup -type=any $target
            echo -e "\nWait Please.....\n"            
            nslookup -type=any $target > /root/Desktop/bashscripts/$name/nslookup.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"
            sumit
           ;;

#-------------------------------------------------------------------------

  "traceroute")

            read -p "Enter domain/ip:" target
            echo -e "\nRunning traceroute.....\n"
   	    traceroute $target
            echo -e "\nWait Please.....\n" 
            traceroute $target > /root/Desktop/bashscripts/$name/traceroute.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"
            sumit
           ;;

#-------------------------------------------------------------------------



"whois")
            read -p "Enter domain/ip:" target
            echo -e "\nRunning whois.....\n"
   	    whois --verbose $target
            echo -e "\nWait Please.....\n"            
            whois --verbose $target > /root/Desktop/bashscripts/$name/whois.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"
            sumit
           ;;

#-------------------------------------------------------------------------

"enum4linux")
            netd
            read -p "Enter ip:" target
            echo -e "\nRunning enum4linux.....\n"
   	    enum4linux -v $target
            echo -e "\nWait Please.....\n" 
            enum4linux -v $target > /root/Desktop/bashscripts/$name/enum4linux.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"    
            sumit       
            ;;

#-------------------------------------------------------------------------

"dnsenum")
            read -p "Enter domain/ip:" target
            echo -e "\nRunning dnsenum.....\n"
            dnsenum --noreverse $target
            echo -e "\nWait Please.....\n" 
            dnsenum --noreverse $target > /root/Desktop/bashscripts/$name/dnsenum.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"
            sumit
            ;;


#-------------------------------------------------------------------------

"smbclient")
            netd
            read -p "Enter ip:" target
            echo -e "\nRunning smbclient.....\n"
            
            smbclient -L $target
            echo -e "\n\nMr/Mrs $name, check above for smbclient run-time output\n"
            sumit            
           ;;

#-------------------------------------------------------------------------

"nbtscan")
            
            echo -e "\nRunning nbtscan.....\n"
            
            nbtscan -r 192.168.1.0/24
            echo -e "\nWait please.....\n"
            nbtscan -r $target > /root/Desktop/bashscripts/$name/nbtscan.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/bashscripts/$name folder for output\n"
            sumit
           ;;
#-------------------------------------------------------------------------
        "Quit")
            
            echo -e "\nQuitting.....\n"
                      
            main
            
            ;;

#-------------------------------------------------------------------------
            *)
             
             echo -e "\nInvalid option $REPLY"
             echo -e "\nScroll up & try options available above\n "
             
             main
             ;;
#-------------------------------------------------------------------------

    esac
done

}

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

michael()
{

op7=1
while [ "$op7" > "0" ]
do
if [ "$op7" = "1" ]
then
echo enter you option
echo 1.scanning
echo 2.scripts
read op2
while [ "$op2" > "0" ]
do
if [ "$op2" = "1" ]
then

echo "netdiscover running...."
sleep 5s
`netdiscover -r 192.168.1.0/24 -PN >netdiscover.txt`

cat netdiscover.txt | awk '{print $1}'

read -p "Enter the ip: " ip

echo what scan do you want?
echo 1.synscan
echo 2.ackscan
echo 3.finscan
echo 4.xmasscan
echo 5.tcpscan
echo 6.nullscan
echo 7.osscan

read op1

while [ "$op1" > "0" ]
do

if [ "$op1" = "1" ]
then
  	read -p "do you want a specfic port? " y
	if [ "$y" = "yes" ] || [ "$y" = "y" ]
	then
		read -p "enter the port: " p1
		read -p "do you want the output in a file? " w2
		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]
			then
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sS -oN scan.txt -v -p$p1 $ip	
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		else
			nmap -sS -v -p$p1 $ip	
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		fi
	
	else
		read -p "do you want the output in a file? " w2
		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]
		then
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sS -oN scan.txt -v $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		else
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sS -v $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		fi
	fi
elif [ "$op1" = "2" ]
then
	read -p "do you want a specfic port? " y
	if [ "$y" = "yes" ] || [ "$y" = "y" ]
	then
		read -p "do you want the output in a file? " w2
		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]
		then
			read -p "enter the port: " p2
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sA -oN scan.txt -v -p$p2 $ip
		       	sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		else
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sA -v -p$p2 $ip
		       	sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		fi
	else
		
		read -p "do you want the output in a file? " w2
		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]
		then
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sA -oN scan.txt  -v $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		else 
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sA -v $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		fi
	fi
elif [ "$op1" = "3" ]
then
	read -p "do you want a specfic port? " y
	if [ "$y" = "yes" ] || [ "$y" = "y" ]
	then
		read -p "enter the port: " p3
		read -p "do you want the output in a file? " w2
		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]
		then
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sF -oN scan.txt  -v -p$p3 $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		else
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sF -v -p$p3 $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		fi
			
	else
		read -p "do you want the output in a file? " w2
		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]
		then
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sF -oN scan.txt -v $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		else
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sF -v $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		fi
	fi
elif [ "$op1" = "4" ]
then
	read -p "do you want a specfic port? " y
	if [ "$y" = "yes" ] || [ "$y" = "y" ]
	then
		read -p "enter the port: " p4
		read -p "do you want the output in a file? " w2
		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]
		then
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sX -oN scan.txt -v -p$p4 $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		else
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sX -v -p$p4 $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		fi	
	else
		read -p "do you want the output in a file? " w2
		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]
		then
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sX -oN scan.txt  -v $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		else
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sX -v $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		fi
	fi
elif [ "$op1" = "5" ]
then
  	read -p "do you want a specfic port? " y
	if [ "$y" = "yes" ] || [ "$y" = "y" ]
	then
		read -p "enter the port: " p5
		read -p "do you want the output in a file? " w2
		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]
			then
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sT -oN scan.txt -v -p$p5 $ip	
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		else
			nmap -sT -v -p$p5 $ip	
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		fi
	
	else
		read -p "do you want the output in a file? " w2
		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]
		then
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sT -oN scan.txt -v $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		else
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sT -v $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		fi
	fi
elif [ "$op1" = "6" ]
then
  	read -p "do you want a specfic port? " y
	if [ "$y" = "yes" ] || [ "$y" = "y" ]
	then
		read -p "enter the port: " p6
		read -p "do you want the output in a file? " w2
		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]
			then
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sN -oN scan.txt -v -p$p6 $ip	
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		else
			nmap -sN -v -p$p6 $ip	
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		fi
	
	else
		read -p "do you want the output in a file? " w2
		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]
		then
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sN -oN scan.txt -v $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		else
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -sN -v $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		fi
	fi
elif [ "$op1" = "7" ]
then
  	read -p "do you want a specfic port? " y
	if [ "$y" = "yes" ] || [ "$y" = "y" ]
	then
		read -p "enter the port: " p7
		read -p "do you want the output in a file? " w2
		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]
			then
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -O -oN scan.txt -v -p$p7 $ip	
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		else
			nmap -O -v -p$p7 $ip	
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		fi
	
	else
		read -p "do you want the output in a file? " w2
		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]
		then
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -O -oN scan.txt -v $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		else
			gnome-terminal -e "tcpdump -v dst host $ip"
			nmap -O -v $ip
			sleep 10s
			pid=$(ps -e | pgrep tcpdump)    
			kill -2 $pid
			op1=66
		fi
	fi
elif [ "$op1" = "66" ]
then
	read -p "do you wanna continue? " w1
	if [ "$w1" = "y" ] || [ "$w1" = "yes" ]
	then
		echo 1.synscan
		echo 2.ackscan
		echo 3.finscan
		echo 4.xmasscan
		echo 5.tcpscan
		echo 6.nullscan
		echo 7.osscan
		read -p "enter the option " op1
	else
		echo "-------------thankyou-------------"
		unset op2
		#break
                main
	fi
	
else

	echo "invalid option .... try again!"
	read -p "enter the option " op1
fi

done 

elif [ "$op2" = "2" ]
then
	op4=1
	echo "netdiscover running...."
	sleep 5s
	`netdiscover -r 192.168.1.0/24 -PN >netdiscover.txt`

	cat netdiscover.txt | awk '{print $1}'
	
	
	read -p "Enter the ip: " ip

	cat nmapls.txt

	read -p "enter the name: " sp1

	sp2=`cat nmapls.txt | grep $sp1`
	
	while [ "$op4" > "0" ]
	do
	if [ "$op4" = "1" ]
	then

		if [ "$sp1" = "$sp2" ]
		then
		read -p "do you want a specfic port? " y
			if [ "$y" = "yes" ] || [ "$y" = "y" ]
			then
				read -p "enter the port: " p1
				read -p "do you want the output in a file? " w2
				if [ "$w2" = "y" ] || [ "$w2" = "yes" ]
				then
					gnome-terminal -e "tcpdump -v dst host $ip"
					nmap --script=$sp2 -oN scan.txt -v -p$p1 $ip	
					sleep 10s
					pid=$(ps -e | pgrep tcpdump)    
					kill -2 $pid
					op4=2
				else
					nmap --script=$sp2 -v -p$p1 $ip	
					sleep 10s
					pid=$(ps -e | pgrep tcpdump)    
					kill -2 $pid
					op4=2
				fi
			
			else
				read -p "do you want the output in a file? " w2
				if [ "$w2" = "y" ] || [ "$w2" = "yes" ]
				then
					gnome-terminal -e "tcpdump -v dst host $ip"
					nmap -O --script=$sp2 -oN scan.txt -v $ip
					sleep 10s
					pid=$(ps -e | pgrep tcpdump)    
					kill -2 $pid
					op4=2
				else
					gnome-terminal -e "tcpdump -v dst host $ip"
					nmap -O --script=$sp2 -v $ip
					sleep 10s
					pid=$(ps -e | pgrep tcpdump)    
					kill -2 $pid
					op4=2
				fi
			fi 
		else
	
			echo "invalid script name... try again!"
			cat nmapls.txt
		
			read -p "enter the name: " sp1
		
			sp2=`cat nmapls.txt | grep $sp1`
			
			op4=1
		fi
		
	elif [ "$op4" = "2" ]
	then
		read -p "do you wanna continue? " w1
		if [ "$w1" = "y" ] || [ "$w1" = "yes" ]
		then
			cat nmapls.txt
		
			read -p "enter the name: " sp1
		
			sp2=`cat nmapls.txt | grep $sp1`
			
			op4=1
		else
			echo "-------------thankyou-------------"
			unset op2
			#break
                        main
		fi
	else
		op4=1
	fi
		
done	
else

	echo "invalid option .... try again!"
	read -p "enter the option " op2
fi


done 	
fi
done

}	

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#}

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
main()
{

PS3='Please enter your choice: '
options=("Active Footprinting" "Scanning" "Quit")
select opt in "${options[@]}"
do
    case $opt in


        "Reconnaissance")
                  echo "Try Reconnaissance >>"
                  sumit 
                  echo "hello"
                  ;;
        "Scanning")
                  echo "Try Scanning >>"
                  michael
                  ;;

        "Quit")
               
               toilet -t -F gay ReconXcrpt
               echo -e "\nQuitting ReconXcript.....\n"
               echo "--------thankyou---------"

               exit
               ;;

             *)
              echo -e "\nInvalid option $REPLY"
              main          
               ;;
esac
done

}
main
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
