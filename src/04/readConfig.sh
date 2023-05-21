#!/bin/bash

. ./config
. ./print.sh

function readConf ()
{
    BG1=$column1_background
    Ft1=$column1_font_color
    BG2=$column2_background
    Ft2=$column2_font_color

    if [[ -z $BG1 ]] || [[ -z $BG2 ]] || [[ -z $Ft1 ]] || [[ -z $Ft2 ]]
    then
        BG1=5; Ft1=3; BG2=1; Ft2=6;
        colorCheck $BG1 $Ft1 $BG2 $Ft2
        echo ""
        printColor "default"
    else
        check $BG1 $Ft1 $BG2 $Ft2
        echo ""
        printColor
    fi
}