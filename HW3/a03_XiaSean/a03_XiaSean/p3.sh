#!/bin/bash

#Sean Xia
#sexia
#113181409

# Problem 03 (15): p3.sh
# Imagine a scenario where you have the scores of each student in an exam and you are supposed to
# assign an appropriate letter grade based on the score. Further, assume that you have collected the
# scores of each student in a file. Each such file will contain the student ID and a breakdown of the
# scores for each question in the exam. Here is an example of a sample file for a student:
# ID,Q1,Q2,Q3,Q4,Q5
# 102,9,9,9,10,10
# Each student will have a corresponding file in the format shown above. You can assume that an
# exam will always have 5 questions worth 10 points each.
# Task:
# Write a script that will take a directory of score files as input, compute the score received by a
# student as a percentage, and display the student ID and her corresponding letter-grade in the
# console in the format:
# ID:<letter-grade>
# The table below shows the percentage range and the corresponding letter grade:
# Percentage Score
# Range
# Letter Grade
# 93 <= x <= 100 A
# 80 <= x < 93 B
# 65 <= x < 80 C
# 50 <= x < 65 D
# < 50 F
# Parsing the arguments:
# The scores directory is the only argument to the script. If it is not provided, then display a
# message:
# "score directory missing"
# If the argument provided is not a valid directory, then display:
# "<dirname> is not a directory"
# Script name:
# Name your shell script: p4.sh
# Example:
# Assume that the scores directory provided as input has the following files:
# ==> data/prob4-score1.txt <==
# ID,Q1,Q2,Q3,Q4,Q5
# 101,8,6,9,4,10
# ==> data/prob4-score2.txt <==
# ID,Q1,Q2,Q3,Q4,Q5
# 102,9,9,9,10,10
# ==> data/prob4-score3.txt <==
# ID,Q1,Q2,Q3,Q4,Q5
# 103,5,6,2,4,6
# ==> data/prob4-score4.txt <==
# ID,Q1,Q2,Q3,Q4,Q5
# 104,10,10,10,10,10
# The script should display the following in the console:
# 101:C
# 102:A
# 103:F
# 104:A

#Need to make sure exactly 1 arguments.
if [ $# -ne 1 ]; then
    echo "score directory missing"
    exit 1 #Exits with status 1 or error.
fi

SCORES_DIR=$1

# echo "SCORES_DIR: $SCORES_DIR"

#This checks to see if the src directory exists and if it does not, it will print the error message.
# echo "[ ! -d "$SRC_DIR" ]"
if [ ! -d "$SCORES_DIR" ]; then
    echo "$SCORE_DIR is not a directory"
    exit 0 #Feel like this should exit with status 1 or error but the problem 1 specificications state that it should exit with status 0 or success so I will follow that standard.
fi

#Loop through all files in the directory
for score_file in "$SCORES_DIR"/*.txt*; do
    # echo "score_file: $score_file"
    #If the file is a text file, then we extract the id and the 
    if [ -f "$score_file" ]; then
        # echo "score_file: $score_file"
        # echo "This file is a text file that can be read."

        #Get the id from the file
        id=$(sed -n '2s/^\([0-9]\+\),.*$/\1/p' "$score_file")

        # echo "id: $id"

        #We get the scores from files and compute percentages.
        total=0
        percentage=0
        letter="A"
        while IFS=, read -r _ q1 q2 q3 q4 q5; do
            ((num_questions++))
            total=$((total + q1 + q2 + q3 + q4 + q5))
        done < "$score_file"
        percentage=$((total * 100 / 50))
        # echo "percentage: $percentage"

        #Assign letter a letter based on percentage
        if (( percentage >= 93 )); then
            letter="A"
        elif (( percentage >= 80 )); then
            letter="B"
        elif (( percentage >= 65 )); then
            letter="C"
        elif (( percentage >= 50 )); then
            letter="D"
        else
            letter="F"
        fi

        #Display the id and letter grade
        echo "$id:$letter"
    fi
done
