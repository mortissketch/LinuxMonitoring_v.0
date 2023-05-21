#!/bin/bash

function print()
{
    HOSTNAME=$(hostname)
    TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3, $4, $5}')
    USER=$(who | awk '{print $1}')
    OS=$(hostnamectl | grep "Operating System" | awk '{print $3, $4, $5}')
    DATE=$(date | awk '{print $2, $3, $4, $5}')
    UPTIME=$(uptime -p | awk '{print $2, $3, $4, $5}')
    UPTIME_SEC=$(cat /proc/uptime | awk '{$2="seconds"; print $1, $2}')
    IP=$(hostname -i)
    MASK=$(ifconfig | grep -m1 "netmask" | awk '{print $4}')
    GATEWAY=$(ip route | grep default | awk '{print $3}')
    RAM_TOTAL=$(free -m | grep Mem | awk '{printf("%.3f\n", $2 / 1024)}')
    RAM_USED=$(free -m | grep Mem | awk '{printf("%.3f\n", $3 / 1024)}')
    RAM_FREE=$(free -m | grep Mem | awk '{printf("%.3f\n", $4 / 1024)}')
    SPACE_ROOT=$(df -hk | grep "\/$" | awk '{printf("%.2f\n", $2 / 1024)}')
    SPACE_ROOT_USED=$(df -hk | grep "\/$" | awk '{printf("%.2f\n", $3 / 1024)}')
    SPACE_ROOT_FREE=$(df -hk | grep "\/$" | awk '{printf("%.2f\n", $4 / 1024)}')
    val01="HOSTNAME = "
    val02="TIMEZONE = "
    val03="USER = "
    val04="OS = "
    val05="DATE = "
    val06="UPTIME = "
    val07="UPTIME_SEC = "
    val08="IP = "
    val09="MASK = "
    val10="GATEWAY = "
    val11="RAM_TOTAL = "
    val12="RAM_USED = "
    val13="RAM_FREE = "
    val14="SPACE_ROOT = "
    val15="SPACE_ROOT_USED = "
    val16="SPACE_ROOT_FREE = "

    for arg in "$val01$HOSTNAME" "$val02$TIMEZONE" "$val03$USER"\
                "$val04$OS" "$val05$DATE" "$val06$UPTIME"\
                "$val07$UPTIME_SEC" "$val08$IP" "$val09$MASK"\
                "$val10$GATEWAY" "$val11$RAM_TOTAL Gb" "$val12$RAM_USED Gb"\
                "$val13$RAM_FREE Gb" "$val14$SPACE_ROOT Mb" "$val15$SPACE_ROOT_USED Mb"\
                "$val16$SPACE_ROOT_FREE Mb"
    do
        echo $arg
    done
}
print
echo "write data to a file? [Y/n]"
read rez
if [[ $rez = Y || $rez = y ]]
then
    file=$(date + "%d_%m_%Y_%H_%M_%S".status)
    print>file
fi