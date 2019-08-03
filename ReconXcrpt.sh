#!/bin/bash

#-------------------------------------------------------------------------

#Reconnaissance-Framework [Bash Menu Script Way]
#ReconXcrpt,a reconnaissance framework providing beginners to play with various recon-related tools.

#-------Framework welcome page------------------------------------------------------------------
echo -e "\n"
toilet -t -F metal ReconXcrpt #banner
echo -e "\n"

echo -e "<< Welcome.2.ReconXcrpt >>\n"
echo -e "ReconXcrpt >> A Reconnaissance-Framework providing beginners to play with various reconnaissance tools.\n\n"


#-------------------------------------------------------------------------

read -p "Please enter your name: " name #taking username
mkdir /root/Desktop/$name # creating directory for given username and storing output



#-----------------creating netdiscover fn-------------------------------------------------------

netd()
{
  echo -e "\nRunning netdiscover.....\n" 
   netdiscover -r 192.168.1.0/24 -PN | awk '{print $1}'
   netdiscover -r 192.168.0.0/24 -PN >/root/Desktop/$name/netdiscover.txt
  
}

#--------------------------------------------------------------------------

#@@@@@@@@@@@@@@@@@@@@@ Passive Footprinting fn @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

kamal()
{
                 echo -e "\nMr/Mrs $name,you can try following options:\n "
#Implementing switch case >>              
                 PS3="Enter your options: "

                 select op in whois archive shodan censys pipl beenverified  wireshark tcpdump back
                 do 
                 case $op in
                 whois)
                  a="https://www.whois.com/whois/"   #whois website
                  firefox "$a" 
                  echo "done" 
                  echo " "
                  kamal;;
                
                 archive)
                  b="https://archive.org/"           #archive website
                  firefox "$b"
                  echo "done" 
                  echo " "
                  kamal;;
                 shodan)
                  c="https://www.shodan.io/"         #shodan website
                  firefox "$c"
                  echo "done" 
                  echo " "
                  kamal;;
                 censys)
                  d="https://censys.io/"             #censys website
                  firefox "$d" 
                  
                  echo "done"
                  echo " "
                  kamal;;
                 pipl)
                  e="https://pipl.com/"              #pipl website
                  firefox "$e" 
                  echo " "
                  echo "done" 
                  echo ""
                  kamal;;
                 beenverified)
                  f="https://www.beenverified.com/"  #beenverified website
                  firefox "$f" 
                  echo " "
                  echo "done" 
                  echo ""
                  kamal;;
                 wireshark)
                  g="wireshark"                      #open wireshark 
                  echo $g 
                  echo ""
                  echo "done" 
                  echo " "
                  kamal;;
                 tcpdump)                            #running tcpdump
                  xterm -geometry 100x50+0+0 -fa 'Monospace' -fs 14  -hold -e 'tcpdump'
                  echo "done" 
                  echo " "
                  kamal;;
                 back) 
                  echo ""                              
                  main;;           #go back to show options of reconXcrpt main window {main fn}
                  *)
                  echo -e "\ninvalid option...try again\n" 
                  echo ""
                  kamal;;          #go back to show options of passive recon window {kamal fn}
            esac
            done
          
}


#@@@@@@@@@@@@@@@@@@@@@@@ Active Footprinting @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

sumit()
{

echo -e "\nMr/Mrs $name,you can try following options:\n "

#Implementing switch case >> 
PS3='Please enter your choice: '
options=("ping" "nslookup" "traceroute" "whois" "enum4linux" "dnsenum" "smbclient" "nbtscan" "back")
select opt in "${options[@]}"
do
    case $opt in


    
#------------------------------------------------------------------------

        "ping")
            
            netd
            read -p "Enter ip: " target
            
            echo -e "\nRunning ping.....\n"
   	    timeout 8 ping $target                    #running ping
            echo -e "\nWait Please.....\n"
            timeout 8 ping $target > /root/Desktop/$name/ping.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/$name folder for output\n"
            
            sumit
            ;;

#------------------------------------------------------------------------

        "nslookup")

            read -p "Enter domain/ip: " target
            echo -e "\nRunning nslookup.....\n"
   	    nslookup -type=any $target                #running nslookup
            echo -e "\nWait Please.....\n"            
            nslookup -type=any $target > /root/Desktop/$name/nslookup.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/$name folder for output\n"
            sumit
           ;;

#-------------------------------------------------------------------------

  "traceroute")

            read -p "Enter domain/ip: " target
            echo -e "\nRunning traceroute.....\n"
   	    traceroute $target                      #running traceroute
            echo -e "\nWait Please.....\n" 
            traceroute $target > /root/Desktop/$name/traceroute.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/$name folder for output\n"
            sumit
           ;;

#-------------------------------------------------------------------------



"whois")
            read -p "Enter domain/ip: " target
            echo -e "\nRunning whois.....\n"
   	    whois --verbose $target               #running whois
            echo -e "\nWait Please.....\n"            
            whois --verbose $target > /root/Desktop/$name/whois.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/$name folder for output\n"
            sumit
           ;;

#-------------------------------------------------------------------------

"enum4linux")
            netd
            read -p "Enter ip: " target
            echo -e "\nRunning enum4linux.....\n"
   	    enum4linux -v $target                    #running enum4linux
            echo -e "\nWait Please.....\n" 
            enum4linux -v $target > /root/Desktop/$name/enum4linux.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/$name folder for output\n"    
            sumit       
            ;;

#-------------------------------------------------------------------------

"dnsenum")
            read -p "Enter domain/ip: " target
            echo -e "\nRunning dnsenum.....\n"
            dnsenum --noreverse $target                 #running dnsenum
            echo -e "\nWait Please.....\n" 
            dnsenum --noreverse $target > /root/Desktop/$name/dnsenum.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/$name folder for output\n"
            sumit
            ;;


#-------------------------------------------------------------------------

"smbclient")
            netd
            read -p "Enter ip:" target
            echo -e "\nRunning smbclient.....\n"
            
            smbclient -L $target                        #running smbclient
            echo -e "\n\nMr/Mrs $name, check above for smbclient run-time output\n"
            sumit            
           ;;

#-------------------------------------------------------------------------

"nbtscan")
            
            echo -e "\nRunning nbtscan for 192.168.1.0/24.....\n"
            
            nbtscan -r 192.168.1.0/24                    #running nbtscan
            echo -e "\nWait please.....\n"
            nbtscan -r $target > /root/Desktop/$name/nbtscan.txt
            echo -e "\nMr/Mrs $name, you can check /root/Desktop/$name folder for output\n"
            sumit
           ;;
#-------------------------------------------------------------------------
        "back")
            echo ""                    
            main                  #go back to show options of reconXcrpt main window {main fn}
            
            ;;

#-------------------------------------------------------------------------
            *)
             
             echo -e "\ninvalid option...try again\n"
             
             sumit               #go back to show options of active recon window {sumit fn}
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
echo -e "Mr/Mrs $name,you can try following options:\n"
echo 1.scanning
echo 2.scripts
echo -e "3.back"
read -p "enter you option: " op2
while [ "$op2" > "0" ]
do
#...............................
if [ "$op2" = "1" ]
then

echo "netdiscover running...."
netd

read -p "Enter the ip: " ip

echo -e "what scan do you want?\n"
echo 1.synscan
echo 2.ackscan
echo 3.finscan
echo 4.xmasscan
echo 5.tcpscan
echo 6.nullscan
echo 7.osscan
echo -e "8.back\n"

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
			nmap -sS -oN /root/Desktop/$name/synscan.txt -v -p$p1 $ip	
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
			nmap -sS -oN /root/Desktop/$name/synscan.txt -v $ip
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
			nmap -sA -oN /root/Desktop/$name/ackscan.txt -v -p$p2 $ip
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
			nmap -sA -oN /root/Desktop/$name/ackscan.txt  -v $ip
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
			nmap -sF -oN /root/Desktop/$name/finscan.txt  -v -p$p3 $ip
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
			nmap -sF -oN /root/Desktop/$name/finscan.txt -v $ip
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
			nmap -sX -oN /root/Desktop/$name/xmasscan.txt -v -p$p4 $ip
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
			nmap -sX -oN /root/Desktop/$name/xmasscan.txt  -v $ip
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
			nmap -sT -oN /root/Desktop/$name/tcpscan.txt -v -p$p5 $ip	
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
			nmap -sT -oN /root/Desktop/$name/tcpscan.txt -v $ip
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
			nmap -sN -oN /root/Desktop/$name/nullscan.txt -v -p$p6 $ip	
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
			nmap -sN -oN /root/Desktop/$name/nullscan.txt -v $ip
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
			nmap -O -oN /root/Desktop/$name/osscan.txt -v -p$p7 $ip	
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
			nmap -O -oN /root/Desktop/$name/osscan.txt -v $ip
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

elif [ "$op1" = "8" ]
then
echo ""
michael



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
                echo 8.back
		read -p "enter the option " op1
	else
		echo "-------------thankyou-------------"
		unset op2
		echo ""
                michael
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
	netd

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
					nmap --script=$sp2 -oN /root/Desktop/$name/script.txt -v -p$p1 $ip	
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
					nmap -O --script=$sp2 -oN /root/Desktop/$name/script.txt -v $ip
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
			
                        michael
		fi
	else
		op4=1
	fi
		
done	
#.............................
elif [ "$op2" = "3" ]
then
    echo ""
    main


#.............................
else

	echo "invalid option .... try again!"
	read -p "enter the option " op2
fi


done 	
fi
done

}	

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



#>>>>>>>>>>>>>>>>>>>ReconXcrpt{main fn}>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


main()
{

PS3='Please enter your choice: '
options=("Passive Reconnaissance" "Active Reconnaissance" "Scanning" "Quit")
select opt in "${options[@]}"
do
    case $opt in

        "Passive Reconnaissance")
                  echo -e "\nTry Passive Reconnaissance >>>"
                  kamal 
                  ;;


        "Active Reconnaissance")
                  echo -e "\nTry Active Reconnaissance >>>"
                  sumit 
                  ;;

        "Scanning")
                  echo -e "\nTry Scanning >>>\n"
                  michael
                  ;;

        "Quit")
               
               toilet -t -F gay ReconXcrpt
               echo -e "\nQuitting ReconXcript.....\n"
               echo -e "~Made with ♥ by ReconXcript team:\n"
               echo -e ">> Kishan"
               echo -e ">> Kamal"
               echo -e ">> Michael"
               echo -e ">> Sai"
               echo -e ">> Sumit\n"
               echo -e "~Under mentorship of >> Meenakshi ma'am\n"
                            
               echo "------------------------------------------------------------------------"
               echo -e "Note: Mr/Mrs $name, you can check /root/Desktop/$name folder for output."
               echo "------------------------------------------------------------------------"
               exit
               ;;

             *)
              echo -e "\nInvalid option $REPLY\n"
              main          
               ;;
esac
done

}

main
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
