#!/bin/bash



#-------------------------------------------------------------------------



#Reconnaissance-Framework [Bash Menu Script Way]

#ReconXcrpt,a reconnaissance framework providing beginners to play with various recon-related tools.



#------------------------Trap-------------------------------------------------------------------

#trap "main && echo -e "\nyou interrupted,so on main page >>"; sleep 2" 2



#-------Framework welcome page------------------------------------------------------------------



toilet -t -F metal ReconXcrpt #banner

echo -e "\n"



echo -e "<< Welcome.2.ReconXcrpt >>\n"

echo -e "ReconXcrpt >> A Reconnaissance-Framework providing beginners to play with various reconnaissance tools.\n"







#-------------------------------------------------------------------------



read -p "Please enter your name: " name #taking username

mkdir /root/Desktop/$name # creating directory for given username and storing output







#-----------------creating netdiscover fn-------------------------------------------------------



netd()

{



  echo -e "\nBefore you run netdiscover, check in which private address range and interface you're connected to internet"
            echo ""
            ip a s | grep -w inet > /root/Desktop/$name/ipaddrrange.txt

            cat /root/Desktop/$name/ipaddrrange.txt

            

            read -p "Enter the internet protocol address range: " ipd

             

              while [[ ! $ipd =~ ^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$ ]]

              do

                   echo "Wrong"

	           read -p " The given range is invalid enter again: " ipd

              done

                if [[ $ipd == $(cat /root/Desktop/$name/ipaddrrange.txt | grep -o "$ipd") ]]

                then

                    echo Okay

                read -p "Do you want 'netdiscover' output in a file(y/n)? " w2

                if [ "$w2" = "y" ] || [ "$w2" = "yes" ] || [ "$w2" = "Y" ] || [ "$w2" = "Yes" ]

			  then

                          read -p "Give your file a name: " netdscvr

                          file="/root/Desktop/$name/$netdscvr.txt"

                              if [ -f "$file" ]

                              then

                                 echo "File exists Try again"

                                 echo " "
                                 
                                 netd

                              else

                                 echo "Netdiscover running...."

                                  sleep 5s

                                  netdiscover -PN -r $ipd | awk '{print $1}' | sed '/^$/d' | sed '$d' > $file

                                  cat $file

                                      echo ""         

                                      echo "success"

	                               echo -e "\nMr/Mrs $name,you can check /root/Desktop/$name folder for output\n"

                                        fi

              else

                    echo "Netdiscover running...."

                     sleep 5s

                   netdiscover -PN -r $ipd | awk '{print $1}' | sed '/^$/d' | sed '$d'

                     echo " Success "

                     echo " "

                   

               fi

           else

                    echo Wrong

                      fi  



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

                  echo "Passive Reconnaissance"

                  kamal;;

                

                 archive)

                  b="https://archive.org/"           #archive website

                  firefox "$b"

                  echo "done" 

                  echo " "

                  echo "Passive Reconnaissance"

                  kamal;;

                 shodan)

                  c="https://www.shodan.io/"         #shodan website

                  firefox "$c"

                  echo "done" 

                  echo " "

                  echo "Passive Reconnaissance"

                  kamal;;

                 censys)

                  d="https://censys.io/"             #censys website

                  firefox "$d" 

                  

                  echo "done"

                  echo " "

                  echo "Passive Reconnaissance"

                  kamal;;

                 pipl)

                  e="https://pipl.com/"              #pipl website

                  firefox "$e" 

                  echo " "

                  echo "done" 

                  echo ""

                  echo "Passive Reconnaissance"

                  kamal;;

                 beenverified)

                  f="https://www.beenverified.com/"  #beenverified website

                  firefox "$f" 

                  echo " "

                  echo "done" 

                  echo ""

		  echo "Passive Reconnaissance"

                  kamal;;

                 wireshark)

                                        #open wireshark 

                  wireshark 

                  echo ""

                  echo "done" 

                  echo " "

                  echo "Passive Reconnaissance"

                  kamal;;

                 tcpdump)                            #running tcpdump

                  xterm -geometry 100x50+0+0 -fa 'Monospace' -fs 14  -hold -e 'tcpdump'

                  echo "done" 

                  echo " "

                  echo "Passive Reconnaissance"

                  kamal;;

                 back) 

                  echo ""                              

                  main;;           #go back to show options of reconXcrpt main window {main fn}

                  *)

                  echo -e "\ninvalid option...try again\n" 

                  echo ""

                  echo "Passive Reconnaissance"

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

            read -p "Enter the internet protocol address to Ping:"  ikt

            read -p "Do you want the output in a file(y/n)? " w2

            if [ "$w2" = "y" ] || [ "$w2" = "yes" ] || [ "$w2" = "Y" ] || [ "$w2" = "Yes" ]

	    then 

            read -p "Give your file a name: " lie

            file="/root/Desktop/$name/$lie.txt"

                 if [ -f "$file" ]

                        then

                         echo "File exists try again"

                         echo " "

                        else

                          echo -e "\nRunning ping.....\n"

                          echo -e "\nWait please.....\n"

                          read -p "Provide count to Ping:" ip

                          ping -c $ip $ikt

                          ping  -c $ip $ikt > $file

                          echo "Success"

                         

                        fi

            else

                         echo -e "\nRunning ping.....\n"

                          echo -e "\nWait please.....\n"

                            read -p "Provide count for Ping:" ip

                          ping -c $ip $ikt

                          echo "Success"

                          echo " "

                         



              fi

            echo -e "\nMr/Mrs $name, you can check /root/Desktop/$name folder for output\n"

            echo "Active Reconnaissance"

            sumit

            ;;



#------------------------------------------------------------------------



        "nslookup")



            read -p "Enter the internet protocol address/Domain name: " target

            read -p "Do you want the output in a file(y/n)? " w2

       if [ "$w2" = "y" ] || [ "$w2" = "yes" ] || [ "$w2" = "Y" ] || [ "$w2" = "Yes" ]

	    then 

            read -p "Give your file a name: " lie

            file="/root/Desktop/$name/$lie.txt"

                 if [ -f "$file" ]

                        then

                         echo "File exists try again"

                         echo " "

                  else

   	                 echo -e "\nRunning nslookup.....\n"

                          echo -e "\nWait please.....\n"

                          nslookup $target  

                          nslookup $target > $file

                           

                        fi

      else

            echo -e "\nRunning nslookup.....\n"

                          echo -e "\nWait please.....\n"

                          nslookup $target

                             echo "Success"

                            echo " "

                        

                          fi

            echo -e "\nMr/Mrs $name, you can check /root/Desktop/$name folder for output\n"

            echo "Active Reconnaissance"

            sumit

           ;;



#-------------------------------------------------------------------------



       "traceroute")



         read -p "Enter the internet protocol address : " ipst

         read -p "Do you want the output in a file(y/n)? " w2

         if [ "$w2" = "y" ] || [ "$w2" = "yes" ] || [ "$w2" = "Y" ] || [ "$w2" = "Yes" ]

	    then 

            read -p "Give your file a name: " lie

            file="/root/Desktop/$name/$lie.txt"

                 if [ -f "$file" ]

                        then

                         echo "File exists try again"

                         echo " "

                        

                  else 

                          echo -e "\nRunning traceroute....\n"

                          echo -e "\nWait please.....\n"

                          traceroute $ipst

   	                  traceroute $ipst > $file

        

                           echo "Success"

                           fi

         else

                      echo -e "\nRunning traceroute....\n"

                          echo -e "\nWait please.....\n"

                          traceroute $ipst

                           echo "Success"

                           echo  " "

                        

                            fi

            echo -e "\nMr/Mrs $name, you can check /root/Desktop/$name folder for output\n"

            echo "Active Reconnaissance"

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

            echo "Active Reconnaissance"

            sumit

           ;;



#-------------------------------------------------------------------------



"enum4linux")



         netd

         read -p "Enter the internet protocol address : " ipst

         read -p "Do you want the output in a file(y/n)? " w2

         if [ "$w2" = "y" ] || [ "$w2" = "yes" ] || [ "$w2" = "Y" ] || [ "$w2" = "Yes" ]

	    then 

            read -p "Give your file a name: " lie

            file="/root/Desktop/$name/$lie.txt"

                 if [ -f "$file" ]

                        then

                         echo "File exists try again"

                         echo " "

                        

                  else 

                          echo -e "\nRunning enum4linux....\n"

                          echo -e "\n Wait please.....\n"

                          enum4linux -v $ipst

   	                  enum4linux -v $ipst > $file

        

                           echo "Success"

                           fi

         else

                      echo -e "\nRunning enum4linux....\n"

                          echo -e "\nWait please.....\n"

                          enum4linux -v $ipst

                           echo "Success"

                           echo  " "

                        

                            fi

           

            echo -e "\nMr/Mrs $name, you can check /root/Desktop/$name folder for output\n" 

            echo "Active Reconnaissance"   

            sumit       

            ;;



#-------------------------------------------------------------------------



"dnsenum")

         read -p "Enter the domain/internet protocol address : " ipst

         read -p "Do you want the output in a file(y/n)? " w2

         if [ "$w2" = "y" ] || [ "$w2" = "yes" ] || [ "$w2" = "Y" ] || [ "$w2" = "Yes" ]

	    then 

            read -p "Give your file a name: " lie

            file="/root/Desktop/$name/$lie.txt"

                 if [ -f "$file" ]

                        then

                         echo "File exists try again"

                         echo " "

                        

                  else 

                          echo -e "\nRunning dnsenum....\n"

                          echo -e "\n Wait please.....\n"

                          dnsenum --noreverse $ipst

   	                  dnsenum --noreverse $ipst > $file

        

                           echo "Success"

                           fi

         else

                      echo -e "\nRunning dnsenum....\n"

                          echo -e "\nWait please.....\n"

                          dnsenum --noreverse $ipst

                           echo "Success"

                           echo  " "

                        

                            fi

            

            echo -e "\nMr/Mrs $name, you can check /root/Desktop/$name folder for output\n"

            echo "Active Reconnaissance"

            sumit

            ;;





#-------------------------------------------------------------------------



"smbclient")

         netd

         read -p "Enter the internet protocol address : " ipst

         read -p "Do you want the output in a file(y/n)? " w2

         if [ "$w2" = "y" ] || [ "$w2" = "yes" ] || [ "$w2" = "Y" ] || [ "$w2" = "Yes" ]

	    then 

            read -p "Give your file a name: " lie

            file="/root/Desktop/$name/$lie.txt"

                 if [ -f "$file" ]

                        then

                         echo "File exists try again"

                         echo " "

                        

                  else 

                          echo -e "\nRunning smbclient....\n"

                          echo -e "\n Wait please.....\n"

                          smbclient -L $ipst

   	                  smbclient -L $ipst > $file

        

                           echo "Success"

                           fi

         else

                      echo -e "\nRunning smbclient....\n"

                          echo -e "\nWait please.....\n"

                          smbclient -L $ipst

                           echo "Success"

                           echo  " "

                        

                            fi

            

            echo -e "\n\nMr/Mrs $name, check above for smbclient run-time output\n"

            echo "Active Reconnaissance"

            sumit            

           ;;



#-------------------------------------------------------------------------



"nbtscan")

            

            

            echo "Before you run nbtscan check in which private address range and interface you're connected to internet"

            ip a s | grep -w inet > netdnbtscan.txt

            cat netdnbtscan.txt

            

            read -p "Enter the internet protocol address range: " ipd

             

              while [[ ! $ipd =~ ^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{1,2}$ ]]

              do

                   echo "Wrong"

	           read -p " The given range is invalid enter again: " ipd

              done

                if [[ $ipd == $(cat netdnbtscan.txt | grep -o "$ipd") ]]

                then

                    echo Okay

                read -p "Do you want the output in a file(y/n)? " w2

                if [ "$w2" = "y" ] || [ "$w2" = "yes" ] || [ "$w2" = "Y" ] || [ "$w2" = "Yes" ]

			  then

                          read -p "Give your file a name: " lie

                          file="/root/Desktop/$name/$lie.txt"

                              if [ -f "$file" ]

                              then

                                 echo "File exists Try again"

                                 echo " "

                              else

                                 echo "Nbtscan running...."

                                  sleep 5s

                                  nbtscan -r $ipd > $file

                                  cat $file

                                      echo ""         

                                      echo "Success"

	                               echo -e "\nMr/Mrs $name,you can check $file folder for output\n"

                                        fi

              else

                    echo "Nbtscan running...."

                     sleep 5s

                      nbtscan -r $ipd 

                      echo "Success"

                      echo " "

                   

               fi

           else

                    echo Wrong

                      fi 

             

            echo -e "\nMr/Mrs $name, you can check /root/Desktop/$name folder for output\n"

            echo "Active Reconnaissance"

            sumit

           ;;

#-------------------------------------------------------------------------

        "back")

            echo " "   

                             

            main                  #go back to show options of reconXcrpt main window {main fn}

            

            ;;



#-------------------------------------------------------------------------

            *)

             

             echo -e "\n Invalid option...please try again\n"

             echo "Active Reconnaissance"

             

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



if [ "$op2" = "1" ]

then



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

  	read -p "do you want a specfic port(y/n)? " y

	if [ "$y" = "yes" ] || [ "$y" = "y" ]

	then

		read -p "enter the port: " p1

		read -p "do you want the output in a file(y/n)? " w2

		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]

			then

			read -p "Give your file a name: " lie

                        file="/root/Desktop/$name/$lie.txt"

                        if [ -f "$file" ]

                        then

                         echo "$file exists"

                         echo " "

                         op1=66

                        else

			gnome-terminal -e "tcpdump -v dst host $ip" 

			nmap -sS -oN /root/Desktop/$name/$lie.txt -v -p$p1 $ip	

			sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

                        fi

			op1=66

		else

			nmap -sS -v -p$p1 $ip	

			sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

			op1=66

		fi

	

	else

		read -p "do you want the output in a file(y/n)? " w2

		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]

		then

			read -p "Give your file a name: " lie

                         file="/root/Desktop/$name/$lie.txt"

                        if [ -f "$file" ]

                        then

                         echo "$file exists"

                         op1=66

                        else

			gnome-terminal -e "tcpdump -v dst host $ip"

			nmap -sS -oN /root/Desktop/$name/$lie.txt -v $ip

			sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

                        fi

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

	read -p "do you want a specfic port(y/n)? " y

	if [ "$y" = "yes" ] || [ "$y" = "y" ]

	then

		read -p "do you want the output in a file(y/n)? " w2

		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]

		then

			read -p "Enter the port: " p2

                        read -p "Give your file a name: " lie

                         file="/root/Desktop/$name/$lie.txt"

                        if [ -f "$file" ]

                        then

                         echo "$file exists"

                         echo " "

                         op1=66

                       else

			gnome-terminal -e "tcpdump -v dst host $ip"

			nmap -sA -oN /root/Desktop/$name/$lie.txt -v -p$p2 $ip

		       	sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

                        fi

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

		

		read -p "do you want the output in a file(y/n)? " w2

		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]

		then

			read -p "Give your file a name: " lie

                          file="/root/Desktop/$name/$lie.txt"

                        if [ -f "$file" ]

                        then

                         echo "$file exists"

                         echo " "

                         op1=66

                      else

			gnome-terminal -e "tcpdump -v dst host $ip"

			nmap -sA -oN /root/Desktop/$name/$lie.txt  -v $ip

			sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

                        fi

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

	read -p "do you want a specfic port(y/n)? " y

	if [ "$y" = "yes" ] || [ "$y" = "y" ]

	then

		read -p "enter the port: " p3

		read -p "do you want the output in a file(y/n)? " w2

		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]

		then

			read -p "Give your file a name: " lie

                       file="/root/Desktop/$name/$lie.txt"

                        if [ -f "$file" ]

                        then

                         echo "$file exists"

                         echo " "

                         op1=66

                      else

			gnome-terminal -e "tcpdump -v dst host $ip"

			nmap -sF -oN /root/Desktop/$name/$lie.txt  -v -p$p3 $ip

			sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

                        fi

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

		read -p "do you want the output in a file(y/n)? " w2

		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]

		then

			read -p "Give your file a name: " lie

                          file="/root/Desktop/$name/$lie.txt"

                        if [ -f "$file" ]

                        then

                         echo "$file exists"

                         echo ""

                         op1=66

                      else

			gnome-terminal -e "tcpdump -v dst host $ip"

			nmap -sF -oN /root/Desktop/$name/$lie.txt -v $ip

			sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

                        fi

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

	read -p "do you want a specfic port(y/n)? " y

	if [ "$y" = "yes" ] || [ "$y" = "y" ]

	then

		read -p "enter the port: " p4

		read -p "do you want the output in a file(y/n)? " w2

		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]

		then

			read -p "Give your file a name: " lie

                        file="/root/Desktop/$name/$lie.txt"

                        if [ -f "$file" ]

                        then

                         echo "$file exists"

                         echo " "

                         op1=66

                        else

			gnome-terminal -e "tcpdump -v dst host $ip"

			nmap -sX -oN /root/Desktop/$name/$lie.txt -v -p$p4 $ip

			sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

                        fi

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

		read -p "do you want the output in a file(y/n)? " w2

		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]

		then

			read -p "Give your file a name: " lie

			file="/root/Desktop/$name/$lie.txt"

                        if [ -f "$file" ]

                        then

                         echo "$file exists"

                         echo " "

                         op1=66

                        else

                        gnome-terminal -e "tcpdump -v dst host $ip"

			nmap -sX -oN /root/Desktop/$name/$lie.txt  -v $ip

			sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

                        fi

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

  	read -p "do you want a specfic port(y/n)? " y

	if [ "$y" = "yes" ] || [ "$y" = "y" ]

	then

		read -p "enter the port: " p5

		read -p "do you want the output in a file(y/n)? " w2

		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]

			then

			read -p "Give your file a name: " lie

                         file="/root/Desktop/$name/$lie.txt"

                        if [ -f "$file" ]

                        then

                         echo "$file exists"

                         echo " "

                         op1=66

                        else

			gnome-terminal -e "tcpdump -v dst host $ip"

			nmap -sT -oN /root/Desktop/$name/$lie.txt -v -p$p5 $ip	

			sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

                        fi

			op1=66

		else

			nmap -sT -v -p$p5 $ip	

			sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

			op1=66

		fi

	

	else

		read -p "do you want the output in a file(y/n)? " w2

		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]

		then

			read -p "Give your file a name: " lie

                         file="/root/Desktop/$name/$lie.txt"

                        if [ -f "$file" ]

                        then

                         echo "$file exists"

                         echo " "

                         op1=66

                        else

			gnome-terminal -e "tcpdump -v dst host $ip"

			nmap -sT -oN /root/Desktop/$name/$lie.txt -v $ip

			sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

                        fi

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

  	read -p "do you want a specfic port(y/n)? " y

	if [ "$y" = "yes" ] || [ "$y" = "y" ]

	then

		read -p "enter the port: " p6

		read -p "do you want the output in a file(y/n)? " w2

		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]

			then

			read -p "Give your file a name: " lie

                         file="/root/Desktop/$name/$lie.txt"

                        if [ -f "$file" ]

                        then

                         echo "$file exists"

                         echo " "

                         op1=66

                        else

			gnome-terminal -e "tcpdump -v dst host $ip"

			nmap -sN -oN /root/Desktop/$name/$lie.txt -v -p$p6 $ip	

			sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

			fi

			op1=66

		else

			nmap -sN -v -p$p6 $ip	

			sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

			op1=66

		fi

	

	else

		read -p "do you want the output in a file(y/n)? " w2

		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]

		then

			read -p "Give your file a name: " lie

                         file="/root/Desktop/$name/$lie.txt"

                        if [ -f "$file" ]

                        then

                         echo "$file exists"

                         echo " "

                         op1=66

                        else

			gnome-terminal -e "tcpdump -v dst host $ip"

			nmap -sN -oN /root/Desktop/$name/$lie.txt -v $ip

			sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

                         fi

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

  	read -p "do you want a specfic port(y/n)? " y

	if [ "$y" = "yes" ] || [ "$y" = "y" ]

	then

		read -p "enter the port: " p7

		read -p "do you want the output in a file(y/n)? " w2

		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]

			then

			read -p "Give your file a name: " lie

                         file="/root/Desktop/$name/$lie.txt"

                        if [ -f "$file" ]

                        then

                         echo "$file exists"

                         echo " "

                         op1=66

                        else

			gnome-terminal -e "tcpdump -v dst host $ip"

			nmap -O -oN /root/Desktop/$name/$lie.txt -v -p$p7 $ip	

			sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

                         fi

			op1=66

		else

			nmap -O -v -p$p7 $ip	

			sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

			op1=66

		fi

	

	else

		read -p "do you want the output in a file(y/n)? " w2

		if [ "$w2" = "y" ] || [ "$w2" = "yes" ]

		then

			read -p "Give your file a name: " lie

                        file="/root/Desktop/$name/$lie.txt"

                        if [ -f "$file" ]

                        then

                         echo "$file exists"

                         echo " "

                         op1=66

                        else

			gnome-terminal -e "tcpdump -v dst host $ip"

			nmap -O -oN /root/Desktop/$name/$lie.txt -v $ip

			sleep 10s

			pid=$(ps -e | pgrep tcpdump)    

			kill -2 $pid

                        fi

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

	read -p "do you wanna continue(y/n)? " w1

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

		

		unset op2

		echo ""

                michael

	fi

	

else



	echo "invalid option .... try again!"

                echo 1.synscan

		echo 2.ackscan

		echo 3.finscan

		echo 4.xmasscan

		echo 5.tcpscan

		echo 6.nullscan

		echo 7.osscan

                echo 8.back

	read -p "enter the option " op1

fi



done 



elif [ "$op2" = "2" ]

then

        netd

	op4=1

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

		read -p "do you want a specfic port(y/n)? " y

			if [ "$y" = "yes" ] || [ "$y" = "y" ]

			then

				read -p "enter the port: " p1

				read -p "do you want the output in a file(y/n)? " w2

				if [ "$w2" = "y" ] || [ "$w2" = "yes" ]

				then

                                        read -p "Give your file a name: " lie 

                                        file="/root/Desktop/$name/$lie.txt"

                                        if [ -f "$file" ]

                                          then

                                            echo "$file exists"

                                            echo " "

                                        else

                                        gnome-terminal -e "tcpdump -v dst host $ip"

					nmap --script=$sp2 -oN /root/Desktop/$name/$lie.txt -v -p$p1 $ip	

					sleep 10s

					pid=$(ps -e | pgrep tcpdump)    

					kill -2 $pid

                                        fi

					op4=2

				else

					nmap --script=$sp2 -v -p$p1 $ip	

					sleep 10s

					pid=$(ps -e | pgrep tcpdump)    

					kill -2 $pid

					op4=2

				fi

			

			else

				read -p "do you want the output in a file(y/n)? " w2

				if [ "$w2" = "y" ] || [ "$w2" = "yes" ]

				then

                                        read -p "Give your file a name: " lie

                                         file="/root/Desktop/$name/$lie.txt"

                                         if [ -f "$file" ]

                                         then

                                         echo "$file exists"

                                         echo " "

                                        else

                                         gnome-terminal -e "tcpdump -v dst host $ip"

					nmap -O --script=$sp2 -oN /root/Desktop/$name/$lie.txt -v $ip

					sleep 10s

					pid=$(ps -e | pgrep tcpdump)    

					kill -2 $pid

                                        fi

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

		read -p "do you wanna continue(y/n)? " w1

		if [ "$w1" = "y" ] || [ "$w1" = "yes" ]

		then

			cat nmapls.txt

		        

			read -p "enter the name: " sp1

		

			sp2=`cat nmapls.txt | grep $sp1`

			

			op4=1

		else

                        

			

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

        echo 1.scanning

        echo 2.scripts

        echo 3.back

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
