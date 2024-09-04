#!/bin/bash

#Sean Xia
#sexia
#113181409

# Problem 5 (10): p5.sh
# Task:
# Write a script using simple shell commands. The script takes a command line argument that
# specifies a directory dir. The script first changes directory to dir, then prints the following in
# sequence:
# (a) A line starting: "Current date and time: "
#  Then on the same line, the current time and date.
# (b) A line starting: "Current directory is: "
#  Then, on the same line, the absolute pathname of the current working directory.
# (c) An empty line
# (d) The line: "--- 10 most recently modified directories ---"
# (e) the 10 most recently modified subdirectories of the current directory in long listing format
# (most
#  recent first)
# (f) An empty line
# (g) The line: "--- 6 largest files ---"
# (h) The 6 largest files in the current directory in long listing format (largest file last)
# (i) An empty line, followed by a line of 70 equal signs
# Note that you may assume that there are at least 6 files in an input directory. However, there may
# be any number of directories in the input directory.
# Parsing the arguments:
# The 1st (and only) command-line argument is the name of the target directory for the script. If
# the directory does not exist, then print the following message:
# "the directory does not exist"
# If the directory argument is missing, then print the following message:
# "input directory is missing"
# Script name:
# Name your shell script: p5.sh

#Need to make sure exactly 2 arguments.
if [ $# -ne 1 ]; then
    echo "input directory is missing"
    exit 1 #Exits with status 1 or error.
fi

TARGET_DIR=$1

# echo "TARGET_DIR: $TARGET_DIR"

#This checks to see if the TARGET_FILE exists and if it does not, it will print the error message.
# echo "[ ! -d "$SRC_DIR" ]"
if [ ! -d "$TARGET_DIR" ]; then
    echo "the directory does not exist"
    exit 0 #Feel like this should exit with status 1 or error but the problem 1 specificications state that it should exit with status 0 or success so I will follow that standard.
fi

#Change directory
cd "$TARGET_DIR"

#(a) A line starting: "Current date and time: "
echo "Current date and time: $(date)"

#(b) A line starting: "Current directory is: "
echo "Current directory is: $(pwd)"

#(c) An empty line
echo ""

#(d) The line: "--- 10 most recently modified directories ---"
echo "--- 10 most recently modified directories ---"
#(e) the 10 most recently modified subdirectories of the current directory in long listing format (most recent first)
ls -lt | grep "^d" | head -n 10
# ls -ltp | grep "/" | head -n 10

#(f) An empty line
echo ""

#(g) The line: "--- 6 largest files ---"
echo "--- 6 largest files ---"
#(h) The 6 largest files in the current directory in long listing format (largest file last)
# ls -l | grep ^- | sort -k5nr | head -n 6
# ls -l | grep ^- | sort -k5nr | tail -n 6
# ls -l | grep ^- | sort -k5n | head -n 6
ls -l | grep ^- | sort -k5n | tail -n 6

#(i) An empty line, followed by a line of 70 equal signs
echo ""
echo "======================================================================"
