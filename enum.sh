#!/bin/sh

BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
PINK="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"
NORMAL="\033[0;39m"

# Quick Embedded Linux Local Enumeration Script 
# v1.0

sleep 0.4

printf "Version: $YELLOW 1.0 $NORMAL \n"

sleep 0.4

printf "Author: $BLUE @Felix $NORMAL \n"

sleep 0.4
printf "\n"
printf "\n"

sleep 3

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED Uname Output."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

uname -a

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED Busybox Commands."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

busybox --help

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED Executable Files."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

#find / -type f -perm /u+x
busybox find / -type f -perm /u+x

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED Web Servers and Associated Technologies."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

#find / -type f -perm /u+x -name "*httpd*" -o -name "*cgi*" -o -name "*nginx*" 
busybox find / -type f -perm /u+x -name "*httpd*" -o -name "*cgi*" -o -name "*nginx*" 

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED Library Versions."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

for i in `busybox find / -type d -name lib`;do busybox find $i -type f;done

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED HTML, Javascript, cgi, and Config Files."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

#find / -name "*.htm*" -o -name "*.js" -o -name "*.cgi" -o -name "*.conf"
busybox find / -name "*.htm*" -o -name "*.js" -o -name "*.cgi" -o -name "*.conf"

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED (Pem) Certificate files."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

#find / -name "*.pem"
busybox find / -name "*.pem"

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED Terminal Environment Variables."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

env

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED Grab Password Files."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

cat /etc/passwd
cat /etc/shadow

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED CPU Info."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

cat /proc/cpuinfo

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED Kernel Command Line"
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

cat /proc/cmdline

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED Running Processes."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

ps -w

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED MTD Layout"
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

cat /proc/mtd

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED MTD Partition Permissions.."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

ls -l /dev/mtd*

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED /etc/inittab Contents."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

cat /etc/inittab

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED /etc/rc Contents."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

cat /etc/rc

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED Loaded Kernel Modules."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

lsmod

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED Firmware Environment Variables - Uboot."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

fw_printenv

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED Firmware Config File."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

cat /etc/fw_env.config

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED Root Directory Layout."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

ls -la /

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED Drilling /etc Structure."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

ls -R /etc

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED Drilling /bin Structure."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

ls -R /bin

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED Drilling /home Structure."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

ls -R /home

printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$RED"
printf "$BLUE## $RED Dmesg output."
printf "\n"
printf "$BLUE"
printf "##"
printf "\n"
printf "$NORMAL"

dmesg

printf "$BLUE"
printf "$NORMAL"

printf "\n $RED So long!!! \n $NORMAL"

printf "\n"
