#!/bin/bash

function output()
{
    start_time=$(date +%s)
    dirCount=$(find "$1" -type d | wc -l)
    echo "Total number if folders (including all nested ones) = $(($dirCount-1))"
    echo "TOP 5 folder of maximum size arranged in descending order (path and size):"
    TopFolders "$1"
    echo "Total number of files = $dirCount"
    echo "Number of:"
    echo "Configuration files (with the .conf extension) = $(find "$1" -name "*.conf" | wc -l)"
    echo "Text files = $(find "$1" -name "*.txt" | wc -l)"
    echo "Executable files = $(find "$1" -type f -executable | wc -l)"
    echo "Log files (with the extension .log) = $(find "$1" -name "*.log" | wc -l)"
    echo "Archive files = $(find "$1" -name "*.tar" | wc -l)"
    echo "Symbolic links = $(find "$1" -type l | wc -l)"
    topFiles=$(find "$1" -type f -exec du -hs {} + | sort -hr -k 1 | head -n 10 | awk 'BEGIN{i=1}{ind=split($2, a, "."); printf "%d - %s, %s, %s\n", i, $2, $1, a[ind]; i++}')
    printf "TOP 10 files of maximum size arranged in descending order (path, size and type):\n%s\n" "topFiles"
    topExec=$(find "$1" -type f -executable -exec du -hs {} + | sort -hr -k 1 | head -n 10 | awk 'BEGIN{i=1}{"md5sum " $2 | getline m5s; close("md5sum"); printf "%d - %s, %s\n", i, $2, $1; i++}')
    printf "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file): \n%s\n" "$topExec"
    end_time=$(date +%s)
    printf "Script execution time (in seconds) = %s\n" $(("$end_time" - "$start_time"))
}

function TopFolders()
{
    top=$(du -h "$1" | sort -hr | head -n 5 | awk '{print" - "$2", "$1}')
    IFS=$'\n'
    count=0
    for i in $top
    do
        ((count += 1))
        echo "$count $i"
    done
}