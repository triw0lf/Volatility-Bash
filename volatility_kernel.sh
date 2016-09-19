#!/bin/sh

#profile needs to be set before being run
p=Win2008R2SP0x64

# for all arguments passed with bash command 
for f in $@
do
	echo "Processing kernel information for image - $f" #prints in Terminal what image is currently going through the loop
		printf "$f\n"  >> "$f"_kernalinfo.txt  #print the image file name and output to file
		printf "Display loaded kernel modules - modules\n" >> "$f"_kernalinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" modules >> "$f"_kernalinfo.txt 2>&1 #run volatility and look for imageinfo for the given image file
		printf "\n" >> "$f"_kernalinfo.txt  #new line to make things prettier
		printf "Scan for hidden or residual modules - modscan\n" >> "$f"_kernalinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" modscan >> "$f"_kernalinfo.txt 2>&1
		printf "\n" >> "$f"_kernalinfo.txt  #new line to make things prettier
		printf "Display recently unloaded modules - unloadedmodules\n" >> "$f"_kernalinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" unloadedmodules >> "$f"_kernalinfo.txt 2>&1
		printf "\n" >> "$f"_kernalinfo.txt  #new line to make things prettier
		printf "Display timers and associated DPCs - timers\n" >> "$f"_kernalinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" timers >> "$f"_kernalinfo.txt 2>&1
		printf "\n" >> "$f"_kernalinfo.txt  #new line to make things prettier
		printf "Display kernel callbacks, notification routines - callbacks\n" >> "$f"_kernalinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" callbacks >> "$f"_kernalinfo.txt 2>&1
		printf "\n" >> "$f"_kernalinfo.txt  #new line to make things prettier
		printf "Display device tree (find stacked drivers) - devicetree\n" >> "$f"_kernalinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" devicetree >> "$f"_kernalinfo.txt 2>&1
		printf "\n" >> "$f"_kernalinfo.txt  #new line to make things prettier
		printf "Scan for driver objects - driverscan\n" >> "$f"_kernalinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" driverscan >> "$f"_kernalinfo.txt 2>&1
		printf "\n" >> "$f"_kernalinfo.txt  #new line to make things prettier
		printf "Scan for used/historical file objects - filescan\n" >> "$f"_kernalinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" filescan >> "$f"_kernalinfo.txt 2>&1
		printf "\n" >> "$f"_kernalinfo.txt  #new line to make things prettier
		printf "Scan for symbolic link objects (shows drive  mappings) - symlinkscan\n" >> "$f"_kernalinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" symlinkscan >> "$f"_kernalinfo.txt 2>&1
		printf "\n" >> "$f"_kernalinfo.txt  #new line to make things prettier
done

