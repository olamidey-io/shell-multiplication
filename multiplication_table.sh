#!/bin/bash

# Function to generate full multiplication table (1 to 10)
generate_full_table() {
    echo "Multiplication Table for $number (Full Table: 1 to 10)"
    for i in {1..10}; do
        echo "$number x $i = $((number * i))"
    done
}

# Function to generate a partial multiplication table
generate_partial_table() {
    echo -n "Enter the starting range: "
    read start
    echo -n "Enter the ending range: "
    read end

    # Validate range input (start must be less than or equal to end)
    if [[ ! $start =~ ^[0-9]+$ || ! $end =~ ^[0-9]+$ || $start -gt $end ]]; then
        echo "Invalid range! Start must be a number less than or equal to the end."
        exit 1
    fi

    echo "Multiplication Table for $number (Range: $start to $end)"
    for ((i = start; i <= end; i++)); do
        echo "$number x $i = $((number * i))"
    done
}

# Prompt user to enter a number
echo -n "Enter a number for the multiplication table: "
read number

# Validate if input is a number
if [[ ! $number =~ ^[0-9]+$ ]]; then
    echo "Invalid input! Please enter a valid number."
    exit 1
fi

# Ask user for table type
echo -n "Do you want a full table (1-10) or a partial table? (Enter 'full' or 'partial'): "
read choice

# Convert input to lowercase for flexibility
choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

# Execute corresponding function
if [[ $choice == "full" ]]; then
    generate_full_table
elif [[ $choice == "partial" ]]; then
    generate_partial_table
else
    echo "Invalid choice! Please enter 'full' or 'partial'."
    exit 1
fi

