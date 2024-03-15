#!/bin/bash
directory=$1
total_files=$2
file_size=$3

mkdir -p "$directory"

for ((i=1; i<=$total_files; i++)); do
    filename="$directory/out_$i.file"
    dd if=/dev/zero of=$filename bs=$file_size count=1 &>/dev/null
done
