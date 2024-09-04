#!/bin/bash

#Sean Xia
#sexia
#113181409

# Problem 1 (15 points): p1.sh
# Imagine that we have written numerous C files (.c files) in a directory D and compiled then to object
# files (.o files). Now, we want to ship directory D to a client who wants to run the source code.
# However, we cannot release our source code to protect intellectual property. Hence, we will have to
# move our source files to another directory and keep the object files in the same directory. However,
# we need to ensure the following when we are moving source files.
# 1. While moving files to the destination directory, the directory structure should be maintained.
# For example, consider that we are moving all C files from the directory project to the directory
# project_src_bkup. Let us say that the directory project has C source files in project/,
# project/subProj1, project/subProj1/subsubProj1, and project/subProj2.
# The destination directory project_src_bkup should have the corresponding source files in the
# same directory structure, that is, project_src_bkup/, project_src_bkup/subProj1,
# project_src_bkup/subProj1/subsubProj1, and project_src_bkup/subProj2.
# 2. If the destination directory already exists, then it should not be recreated. However, if it does not
# exist, then it should be created. Subdirectories in the destination directory may be re-created even if
# they exist.
# 3. If the source directory does not exist, then exit with status 0 and display a message:
# "<src_dir> not found"

# Task:
# Write a script to generalize and automate the process described above. Your script should take 3
# inputs from the command line that specify the extension of the files to be moved, the source
# directory and the destination directory. The script will move all files with the specified extension
# from the source directory (and its sub-directories) to the destination directory (and matching subdirectories). Any temporary files created during script execution should be deleted after the
# script finishes execution.
# Parsing the command-line arguments:
# The 1st input will be the extension of the type of files you want to move out of the source
# directory to the destination directory. The 2nd input will be the sourced directory and the 3rd
# input should be the destination directory. If any of the inputs are missing or if more than the
# required inputs are provided, then the script should display the following message:
# "USAGE: p1.sh <extension> <src_dir> <dst_dir>".
# Script name:
# Name your shell script: p1.sh
# Example invocation: $ p1.sh .py old_project new_project
# This will take all the Python source files (with .py extensions) from the old_project
# directory and place them in the new_project directory

#Need to make sure exactly 3 arguments.
if [ "$#" -ne 3 ]; then
    echo "USAGE: p1.sh <extension> <src_dir> <dst_dir>" #Could replace p1.sh with $0 but would be ./p1.sh or however it was called.
    exit 1 #Exits with status 1 or error.
fi

EXTENSION=$1
SRC_DIR=$2
DST_DIR=$3

# echo "Extension: $EXTENSION"
# echo "SRC_DIR: $SRC_DIR"
# echo "DST_DIR: $DST_DIR"

#This checks to see if the src directory exists and if it does not, it will print the error message.
# echo "[ ! -d "$SRC_DIR" ]"
if [ ! -d "$SRC_DIR" ]; then
    echo "$SRC_DIR not found"
    exit 0 #Feel like this should exit with status 1 or error but specificications state that it should exit with status 0 or success.
fi

#If DST_DIR exists, then the directory will not be created
if [ ! -d "$DST_DIR" ]; then
    # echo "Directory $DST_DIR does not exist so the directory will be created."
    mkdir -p "$DST_DIR"
fi

#This will remove all files and directories from the DST_DIR so that if the directory already existed, it will remove any extra folders as described on Piazza. 
#If the directory was newly created, there should not be anything to remove in the first place.
rm -rf "$DST_DIR"/*

# Find all files with specified extension in the source directory and its subdirectories
#We find all files with the EXTENSION in the directory and any subdirectories, and we do a while loop on FILENAME to read each FILENAME found one by one
find "$SRC_DIR" -name "*$EXTENSION" -type f | while read FILENAME; do
    # echo "FILENAME: $FILENAME" #FILENAME: test7/Removed?/hello1.c
    #We want to get the path relative to the source directory so we know what structure we need in the destination directory
    REL_PATH=$(realpath --relative-to="$SRC_DIR" "$FILENAME") #RELATIVE_PATH: Removed?/hello1.c
    #We want to get the DEST_PATH because we can use this to get the actual directory path we need to create.
    DEST_PATH="$DST_DIR/$REL_PATH" #DEST_PATH: test4/Removed?/hello1.c
    DEST_DIR=$(dirname "$DEST_PATH") #DEST_DIR: test4/Removed?

    # echo "RELATIVE_PATH: $RELATIVE_PATH"
    # echo "DEST_PATH: $DEST_PATH"
    # echo "DEST_DIR: $DEST_DIR"

    mkdir -p "$DEST_DIR"

    # Move the file from SRC_DIR to the DEST_DIR
    mv "$FILENAME" "$DEST_PATH"
done

#Clean up the .DS_STORE that Mac computers create
rm -rf "$DST_DIR"/.DS_Store

# echo 10