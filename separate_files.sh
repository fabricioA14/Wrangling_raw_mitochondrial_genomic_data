#!/bin/bash

# Define an array containing file names and their corresponding appendix
file_names=("Undetermined_S0_L001_R1_001.fastq.gz" "Undetermined_S0_L001_R2_001.fastq.gz")
appendices=("_R1" "_R2")

# Loop through each file name
for index in "${!file_names[@]}"; do
    file_name="${file_names[$index]}"
    appendix="${appendices[$index]}"
    
    # Decompress the file
    gzip -df "$file_name" > "${file_name%.gz}"

    # Read each line in the text file
    while IFS= read -r line; do
        # Extract name and pattern from the line
        pattern=$(echo "$line" | awk '{print $2}')
        name=$(echo "$line" | awk '{print $1}')

        grep -A 3 "$pattern" "${file_name%.gz}" > "${name}${appendix}.fastq"
        grep '^--' -v "${name}${appendix}.fastq" > "${name}${appendix}.temp.fastq" && mv "${name}${appendix}.temp.fastq" "${name}${appendix}.fastq"
    done < mapping_file.txt

    # Remove the decompressed file
    #rm "${file_name%.gz}"
done
