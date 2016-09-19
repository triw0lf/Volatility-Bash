#!/bin/sh

#profile needs to be set before being run
p=Win2008R2SP0x64

# for all arguments passed with bash command 
for f in $@
do
	echo "Processing network information for image - $f" #prints in Terminal what image is currently going through the loop
		printf "$f\n"  >> "$f"_processinfo.txt  #print the image file name and output to file
		printf "network info - netscan\n" >> "$f"_networkinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" netscan >> "$f"_networkinfo.txt 2>&1 #run volatility and look for imageinfo for the given image file
		printf "\n" >> "$f"_networkinfo.txt  #new line to make things prettier
		printf "If profile = XP or 2003, please add 'connections and sockets' and 'connscan and sockscan' to script" >> "$f"_networkinfo.txt
done

