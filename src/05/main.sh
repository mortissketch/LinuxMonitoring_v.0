#!/bin/bash

. ./output.sh

function checkInput()
{
    if [[ $# -eq 1 ]]
    then
        if [[ $1 =~ /$ ]]
        then
            if [[ -d "$1" ]]
            then
                output "$1"
            else
                echo "ERROR there is no such directory"
            fi
        else
            echo "The parameter must end with a '/' sign"
            exit 1
        fi
    else
        echo "You need only one parameter"
        exit 1
    fi
}

checkInput "$@"