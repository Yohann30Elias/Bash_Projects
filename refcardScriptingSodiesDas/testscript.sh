#!/bin/bash

terraform_file="your_terraform_file.tf"

output_file="encoded_blocks.txt"

> "$output_file"

block=""
inside_block=0

while IFS= read -r line; do
    if [[ "$line" =~ ^resource|^provider|^data|^output|^terraform ]]; then
        if [[ $inside_block -eq 1 ]]; then
            echo "$block" | base64 >> "$output_file"
            echo "---" >> "$output_file"
            block=""
        fi
        inside_block=1
    elif [[ "$line" =~ ^\}$ ]]; then
        block+="$line"$'\n'
        echo "$block" | base64 >> "$output_file"
        echo "---" >> "$output_file"
        block=""
        inside_block=0
        continue
    fi

    if [[ $inside_block -eq 1 ]]; then
        block+="$line"$'\n'
    fi
done < "$terraform_file"

if [[ $inside_block -eq 1 && "$block" != "" ]]; then
    echo "$block" | base64 >> "$output_file"
    echo "---" >> "$output_file"
fi

echo "Blöcke wurden kodiert und in '$output_file' gespeichert."
