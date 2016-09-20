#!/bin/sh

#profile needs to be set before being run
p=Win2008R2SP0x64

# for all arguments passed with bash command 
for f in $@
do
	echo "Processing registry information for image - $f" #prints in Terminal what image is currently going through the loop
		printf "$f\n"  >> "$f"_registryinfo.txt  #print the image file name and output to file
		printf "Display cached hives - hivelist\n" >> "$f"_registryinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" hivelist >> "$f"_registryinfo.txt 2>&1 #run volatility and look for imageinfo for the given image file
		printf "\n" >> "$f"_registryinfo.txt  #new line to make things prettier
		printf "Print a key’s values and data - printkey\n" >> "$f"_registryinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" printkey >> "$f"_registryinfo.txt 2>&1
		printf "\n" >> "$f"_registryinfo.txt  #new line to make things prettier
		printf "Dump userassist data - userassist\n" >> "$f"_registryinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" userassist >> "$f"_registryinfo.txt 2>&1
		printf "\n" >> "$f"_registryinfo.txt  #new line to make things prettier
		printf "Dump shellbags information - shellbags\n" >> "$f"_registryinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" shellbags >> "$f"_registryinfo.txt 2>&1
		printf "\n" >> "$f"_registryinfo.txt  #new line to make things prettier
		printf "Dump the shimcache - shimcache\n" >> "$f"_registryinfo.txt
		python /Users/first.last/Documents/volatility-master/vol.py --profile="$p" -f "$f" shimcache >> "$f"_registryinfo.txt 2>&1
		printf "\n" >> "$f"_registryinfo.txt  #new line to make things prettier
done

