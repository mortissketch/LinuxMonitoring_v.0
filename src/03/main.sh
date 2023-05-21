#!/bin/bash

. ./out.sh
. ./helpFunc.sh

whiteBG="\033[107m"
redBG="\033[41m"
greenBG="\033[42m"
blueBG="\033[44m"
purpleBG="\033[45m"
blackBG="\033[40m"

whiteFT="\033[97m"
redFT="\033[31m"
greenFT="\033[32m"
blueFT="\033[34m"
purpleFT="\033[35m"
blackFT="\033[30m"
NORMAL="\033[0m"

BG1=0;
BG2=0;
FT1=0;
FT2=0;

check "$@"