#!/bin/bash

# Function to count files in current directory
function count_files {
    local file_count=$(ls -1 | wc -l)
    echo $file_count
}

# Function to get user guess
function get_guess {
    echo "How many files are in the current directory?"
    read guess
    echo $guess
}

# Main game logic
echo "Welcome to the Guessing Game!"
echo "================================"

correct_count=$(count_files)
user_guess=-1

# Loop until correct guess
while [[ $user_guess -ne $correct_count ]]
do
    user_guess=$(get_guess)
    
    if [[ $user_guess -lt $correct_count ]]
    then
        echo "Your guess is too low. Try again!"
        echo ""
    elif [[ $user_guess -gt $correct_count ]]
    then
        echo "Your guess is too high. Try again!"
        echo ""
    else
        echo "Congratulations! You guessed correctly!"
        echo "There are $correct_count files in the current directory."
    fi
done
