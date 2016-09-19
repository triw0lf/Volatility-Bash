#!/bin/sh

for f in $@
do
	echo "Processing image information for image - $f"
		printf "$f\n"  >> imageinfo.txt
python /Users/first.last/Documents/volatility-master/vol.py -f "$f" imageinfo >> imageinfo.txt 2>&1 #set your path for where volatility lives
		printf "\n" >> imageinfo.txt
done


