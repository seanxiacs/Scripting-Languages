#!/bin/bash

#Sean Xia
#sexia
#113181409

# Problem 04 (15): p4.sh
# An automated spell checker is a piece of software that can automatically detect spelling mistakes in a
# file. Imagine that you must develop a specific kind of spell checker that can be used to verify the
# spelling of 5 letter words. Your spell checker will rely on a dictionary that contains all possible fiveletter words.
# Task:
# Write a script that takes a target file as first input and a dictionary file as second input and
# displays all 5-letter words in the target file that have been spelled incorrectly in the console.
# Assume that the dictionary file is a newline separated list of all possible 5 letter words; that is,
# each word will be on a new line.
# Parsing the arguments:
# The 1st argument is the file whose spelling needs to be checked and the 2nd argument is a
# dictionary. If neither is provided, then display a message:
# "input file and dictionary missing"
# If an invalid filename is provided as 1st argument, then display a message:
# "<filename> is not a file"
# Do the same for the 2nd argument.
# Script name:
# Name your shell script: p4.sh
# Example:
# Assume that we want to check the spelling of 5-letter words in a file called p4-sample.txt.
# This file has the following text:
# Python is an easy to laern, powerful programming language. It has efficient highlevel data
# structures and a simple but effective approach to object-oriented programming. Python’s elegant
# syntax and dynamic typing, together with its interpreted nature, make it an ideal language for
# scripting and rapid application development in many araes on most platforms.
# The Python interpreter and the extensive standard library are freely available in source or
# binary form for all mojar platforms from the Python Web site, https://www.python.org/, and may
# be freely distributed. The same site also contains distributions of and pointers to many free trhid
# party Python modules, programs and tools, and additional documentation.
# In the above text the words 'laern', 'araes', 'mojar', and 'trhid' should have been spelled as 'learn',
# 'areas', 'major', and 'third'. Hence, on executing the script as follows:
# $ ./p4.sh p4-sample.txt dictionary.txt
# The script should write to the console:
# laern
# araes
# mojar
# trhid

#Need to make sure exactly 2 arguments.
if [ $# -ne 2 ]; then
    echo "input file and dictionary missing"
    exit 1 #Exits with status 1 or error.
fi

TARGET_FILE=$1
DICTIONARY_FILE=$2

echo "TARGET_FILE: $TARGET_FILE"
echo "DICTIONARY_FILE: $DICTIONARY_FILE"

#This checks to see if the TARGET_FILE exists and if it does not, it will print the error message.
# echo "[ ! -d "$SRC_DIR" ]"
if [ ! -f "$TARGET_FILE" ]; then
    echo "$TARGET_FILE is not a file"
    exit 0 #Feel like this should exit with status 1 or error but the problem 1 specificications state that it should exit with status 0 or success so I will follow that standard.
fi

#This checks to see if the DICTIONARY_FILE exists and if it does not, it will print the error message.
# echo "[ ! -d "$SRC_DIR" ]"
if [ ! -f "$DICTIONARY_FILE" ]; then
    echo "$DICTIONARY_FILE is not a file"
    exit 0 #Feel like this should exit with status 1 or error but the problem 1 specificications state that it should exit with status 0 or success so I will follow that standard.
fi

#Iterate over all 5 letter words surrounded by spaces or punctuation. Also should account for start of file and end of file assuming that we are following the POSIX standard mentioned in Question @89 on Piazza.
while read -ra words; do
    for word in "${words[@]}"; do
        if [[ "$word" =~ ^[[:punct:]]?[[:alpha:]]{5}[[:punct:]]?$ ]]; then #Only alphabet
            if ! grep -q -i -x "${word//[[:punct:]]/}" "$2"; then #Case insensitive
                echo "${word//[[:punct:]]/}" #Print the words
            fi
        fi
    done
done < "$1"

