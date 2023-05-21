#!/bin/bash
num='^-?[0-9]+([.][0-9]+)?$'
if [ $# -ne 1 ]
then
    echo "ERROR, more then one argument"
else
    if [[ $1 =~ $num ]]
    then
        echo "ERROR, no text argument"
    else
        echo $1
    fi
fi