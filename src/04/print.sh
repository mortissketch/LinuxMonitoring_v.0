#!/bin/bash

function printColor()
{
    renameColor $BG1 BG1
    renameColor $BG2 BG2
    renameColor $Ft1 Ft1
    renameColor $Ft2 Ft2

    if [[ $1 == "default"]]
    then
        column1_background=default
        column1_font_color=default
        column2_background=default
        column2_font_color=default
    fi

    echo "Column 1 background = $column1_background ($BG1)"
    echo "Column 1 font color = $column1_font_color ($Ft1)"
    echo "Column 2 background = $column2_background ($BG2)"
    echo "Column 2 font color = $column2_font_color ($Ft2)"
}

function renameColor()
{
    case $1 in
    "\033[107m" | "\033[97m") eval "$2='white'";;
    "\033[41m"|"\033[31m") eval "$2='red'";;
    "\033[42m"|"\033[32m") eval "$2='green'";;
    "\033[44m"|"\033[34m") eval "$2='blue'";;
    "\033[45m"|"\033[35m") eval "$2='purple'";;
    "\033[40m"|"\033[30m") eval "$2='black'";;
    esac
}