#!/bin/bash

#Sean Xia
#sexia
#113181409

# Problem 02 (15): p2.sh
# Imagine that we are given a data file, where each line is a sequence of numbers. The numbers in
# each line are separated by 1 of the following 3 characters—comma(,), semicolon(;) or colon(:).
# Further, there is no limit to the number of numbers in each line. All the numbers in a line are
# separated by the same delimiter, but different lines may use different delimiters. Here is an example
# of a sample data file:
# 1;2;3;4;5
# 11:4:23:12
# 18,4,17,13,21,19,25
# As can be seen from the example, you could imagine a data file to be arranged in rows and columns
# where the columns are separated by either comma, semicolon, or colon.
# Task:
# Write a script that will take a data file (as described above) as input and will compute the sum of
# each column in the data file. The sum of each column should be written to an output file which
# will also be provided as input to the script. All inputs to the script will be provided from the
# command line. The output file should be written in the format: Col <n> : sum
# That is, each line in the output file should have the column and its corresponding sum. For
# example, based on the data file shown above, the output file should look like the following (don't
# include the comments):
# Col 1 : 30 # 1 + 11 + 18
# Col 2 : 10 # 2 + 4 + 4
# Col 3 : 43 # 3 + 23 + 17
# Col 4 : 29 # 4 + 12 + 13
# Col 5 : 26 # 5 + 21
# Col 6 : 19 # 19
# Col 7 : 25 # 25
# Parsing the arguments:
# If a non-existent data file is provided as input to the script, then the script should report:
# "<filename> not found"
# If the output file provided as input does not exist, then it should be created. If an output file
# provided as input exists, then it should be over-written with the new output of the script. You can
# assume that a data file will always have the format specified above. If either the data file or the
# output file path is not provided, then display a message:
# "data file or output file not found"
# Script name:
# Name your shell script: p2.sh

#Need to make sure exactly 2 arguments.
if [ $# -ne 2 ]; then
    echo "data file or output file not found" #Usage: p2.sh data_file output_file #Could replace p1.sh with $0 but would be ./p1.sh or however it was called.
    exit 1 #Exits with status 1 or error.
fi

DATA_FILE=$1
OUTPUT_FILE=$2

# echo "DATA_FILE: $DATA_FILE"
# echo "OUTPUT_FILE: $OUTPUT_FILE"

#This checks to see if the data file exists and if it does not, it will print the error message.
# echo "[ ! -d "$SRC_DIR" ]"
if [ ! -f "$DATA_FILE" ]; then
    echo "$DATA_FILE not found"
    exit 0 #Feel like this should exit with status 1 or error but the previous problem specificications state that it should exit with status 0 or success so I will follow that standard.
fi

#If OUTPUT_FILE exists, then the file will not be created
if [ ! -f "$OUTPUT_FILE" ]; then
    # echo "File $OUTPUT_FILE does not exist so the file will be created."
    touch "$OUTPUT_FILE"
else
    rm "$OUTPUT_FILE" #Need to do the rm command so that it is overwritten with the new output.
    touch "$OUTPUT_FILE"  
fi

#Do a while loop over each line in the DATA_FILE
while read line; do
    IFS=',;:' read -ra values <<< "$line" #IFS Internal Field Separator has delimiters so we are passing the $line, or current line to the read command so it can be separated by the IFS delimiters
    #Loop through each value in the line and add it to the correct column sum.
    for i in "${!values[@]}"; do
        col=$((i+1)) #Need double parenthesis otherwise shell interprets it as a string
        sum[${col}]=$((sum[${col}] + values[${i}]))
    done
done < "$DATA_FILE"

#Write the column sums to the OUTPUT_FILE
for i in "${!sum[@]}"; do
    echo "Col $i : ${sum[$i]}" >> "$OUTPUT_FILE"
done
