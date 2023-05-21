#!/bin/bash

function check()
{
    if [[ $# = 4 ]]
    then
        error=0;
        for i in "$@"
        do
            if [[ i -lt 1 ]] || [[ i -gt 6 ]]
            then
                error=1;
                echo "you need 4 parameters from 1 to 6, restart a script"
                exit 1
            fi
        done
        if [[ $error = 0 ]]
        then
            colorCheck "$@"
        else
            echo "you need 4 parameters from 1 to 6, restart a script"
            exit 1
        fi
    else
        echo "you need 4 parameters, restart a script"
        exit 1
    fi
}

function colorCheck()
{
    if [[ "$1" -eq "$2" ]] || [[ "$3" -eq "$4" ]]
    then
        echo "ERROR, The value of the background color should not be equal"
        echo "to the value of the font color"
        exit 1
    else
        setFtnBG 1 "$1" BG1
        setFtnBG 1 "$3" BG2
        setFtnBG 2 "$2" Ft1
        setFtnBG 2 "$4" Ft2
    fi
}

function setFtnBG()
{
    if [[ "$1" -eq 1 ]]
    then
        case $2 in
            1)result=$whiteBG;;
            2)result=$redBG;;
            3)result=$greenBG;;
            4)result=$blueBG;;
            5)result=$purpleBG;;
            6)result=$blackBG;;
        esac
    else
        case $2 in
            1)result=$whiteFT;;
            2)result=$redFT;;
            3)result=$greenFT;;
            4)result=$blueFT;;
            5)result=$purpleFT;;
            6)result=$blackFT;;
        esac
    fi
    eval "$3='$result'"
}
