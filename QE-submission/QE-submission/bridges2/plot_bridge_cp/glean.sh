#!/bin/bash

# Collect the CP field from all files and write to output.txt

# Define the path to search for files
path="."

# Define the name of the output file
output="output.txt"

# Open the output file
touch "$output"

# Loop through each node directory
for node in 1 2 4; do
  # Loop through each file
  for i in {8..512..8}; do
    # Define the file name
    file="$path/node${node}_output/${node}_${i}.out"
    # Check if the file exists
    if [ -f "$file" ]; then
      # Output the file name
      echo "Collecting data from $file"
      # Collect the CP field and write to the output file
      if grep -q "CP\s*:" "$file"; then
        grep "CP\s*:" "$file" >> "$output"
      else
        echo "No CP field found in $file"
      fi
    fi
  done
done

# Print completion message
echo "Data collection complete. Results written to $output"

