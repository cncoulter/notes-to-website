#!/bin/bash

# Explanation: rootDir and thisDir are set as variables and fed into the pandoc command below so that this script can be run from any directory on your computer

rootDir=/home/cam/Nextcloud/notes-to-website # Update this line with the path for your notes folder
thisDir=$rootDir/Journals # Update this line with the name of the category folder

for file in $thisDir/*.md; do # Explanation: for every file in this category folder
	pandoc -f markdown -t html5 -s --template="$rootDir/template.html" --css="$rootDir/css/styles.css" "$file" -o "${file%.*}.html" # Explanation: use pandoc to convert the markdown source file into an HTML output. Use the referenced HTML template and incorporate the referenced CSS stylesheet.
done
