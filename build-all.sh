#!/bin/bash


# Explanation: thisDir is set as a variable and fed into the build command below so that this script can be run from any directory on your computer
rootDir=/home/cam/Nextcloud/notes-to-website # Update this line with the path for your notes folder

# Build the root directory
$rootDir/build.sh

# Build each sub-folder
for dir in */; do # For each sub-directory
    if [ -f "$dir/build.sh" ]; then # if there is a build.sh file
        $dir/build.sh; # then execute it
    fi
done
