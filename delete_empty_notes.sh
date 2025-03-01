#!/bin/bash

# this is a script to delete files that are empty
# backstory:
# 	i am organizing my notes and would like to delete files that content nothing in them 
# 	i do not want to go through the hassle of deleting them manually so i am creating this script 

# note to self: make this script a cron job daily 


DIR="/mnt/c/Users/nvice/My Documents/My Notes/00 - notes/"
# assigned the directory i want to check for empty files 

if [[ ! -d $DIR ]]; then 
# checks if the assigned directory does not exist
	echo "Error: Directory '$DIR' does not exist."
	exit 1 
# if it does not exist then it gives an error and exits the script
fi 

# if it does exist, iterate over files in the directory 
for file in "$DIR"/*; do
	if [[ -f "$file" ]] && ! grep -q '.' "$file"; then 
		echo "empty file: "$file""
		rm "$file"
	fi 
done 
