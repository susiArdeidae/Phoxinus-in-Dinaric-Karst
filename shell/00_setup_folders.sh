#!/bin/bash

# Define directories
BASE_DIR="your/working/dir/phox_ddrad"
RAW_DIR="$BASE_DIR/rawdata"

# Create base directories
mkdir -p "$RAW_DIR"

# List of pools
POOLS=(2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 68 72 73 74 75 76 79 80 81 82 83 84 85)

# Loop to create Pool directories
for pool in "${POOLS[@]}"
do
    mkdir -p "$BASE_DIR/Pool${pool}"
done

# Confirm completion
echo "Directories created successfully."
