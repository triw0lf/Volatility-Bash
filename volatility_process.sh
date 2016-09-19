#!/bin/sh

#profile needs to be set before being run
p=Win2008R2SP0x64

# for all arguments passed with bash command 
for f in $@
do
	echo "Processing process information for image - $f" #prints in Terminal what image is currently going through the loop
		printf "$f\n"  >> "$f"_processinfo.txt  #print the image file name and output to file
		printf "active process listing - pslist\n" >> "$f"_processinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" pslist >> "$f"_processinfo.txt 2>&1 #run volatility and look for imageinfo for the given image file
		printf "\n" >> "$f"_processinfo.txt  #new line to make things prettier
		printf "hidden or terminated processes - psscan\n" >> "$f"_processinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" psscan >> "$f"_processinfo.txt 2>&1
		printf "\n" >> "$f"_processinfo.txt  #new line to make things prettier
		printf "cross reference processes with various lists - psxview\n" >> "$f"_processinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" psxview >> "$f"_processinfo.txt 2>&1
		printf "\n" >> "$f"_processinfo.txt  #new line to make things prettier
		printf "processes in parent/child tree - pstree\n" >> "$f"_processinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" pstree >> "$f"_processinfo.txt 2>&1
		printf "\n" >> "$f"_processinfo.txt  #new line to make things prettier
		printf "show command line arguments - cmdline\n" >> "$f"_processinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" cmdline >> "$f"_processinfo.txt 2>&1
		printf "\n" >> "$f"_processinfo.txt  #new line to make things prettier
		printf "display SIDs - getsids\n" >> "$f"_processinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" getsids >> "$f"_processinfo.txt 2>&1
		printf "\n" >> "$f"_processinfo.txt  #new line to make things prettier
		printf "display environment variables - envars\n" >> "$f"_processinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" envars >> "$f"_processinfo.txt 2>&1
		printf "\n" >> "$f"_processinfo.txt  #new line to make things prettier
done

