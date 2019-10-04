#!/bin/sh

# Quick Embedded Linux Local Enumeration Script 
# v1.0

sleep 0.4

echo "Version: $YELLOW 1.0 $NORMAL \n"

sleep 0.4

echo "Author: $BLUE @Felix $NORMAL \n"

sleep 0.4
echo ""
echo ""

sleep 3

echo ""
echo "######## Uname Output."
echo ""
uname -a

echo ""
echo "######## Busybox Commands."
echo ""
/bin/busybox --help

echo ""
echo "######## Executable Files."
echo ""
#find / -type f -perm /u+x
/bin/busybox find / -type f -perm /u+x

echo ""
echo "######## Web Servers and Associated Technologies."
echo ""
#find / -type f -perm /u+x -name "*httpd*" -o -name "*cgi*" -o -name "*nginx*" 
/bin/busybox find / -type f -perm /u+x -name "*httpd*" -o -name "*cgi*" -o -name "*nginx*" 

echo ""
echo "######## Library Versions."
echo ""
for i in `/bin/busybox find / -type d -name lib`;do /bin/busybox find $i -type f;done

echo ""
echo "######## HTML, Javascript, cgi, and Config Files."
echo ""
#find / -name "*.htm*" -o -name "*.js" -o -name "*.cgi" -o -name "*.conf"
/bin/busybox find / -name "*.htm*" -o -name "*.js" -o -name "*.cgi" -o -name "*.conf"

echo ""
echo "######## (Pem) Certificate files."
echo ""
#find / -name "*.pem"
/bin/busybox find / -name "*.pem"

echo ""
echo "######## Terminal Environment Variables."
echo ""
env

echo ""
echo "######## Grab Password Files."
echo ""
cat /etc/passwd
cat /etc/shadow

echo ""
echo "######## CPU Info."
echo ""
cat /proc/cpuinfo

echo ""
echo "######## Kernel Command Line"
echo ""
cat /proc/cmdline

echo ""
echo "######## Running Processes."
echo ""
ps -w

echo ""
echo "######## MTD Layout"
echo ""
cat /proc/mtd

echo ""
echo "######## MTD Partition Permissions.."
echo ""
ls -l /dev/mtd*

echo ""
echo "######## /etc/inittab Contents."
echo ""
cat /etc/inittab

echo ""
echo "######## /etc/rc Contents."
echo ""
cat /etc/rc

echo ""
echo "######## Loaded Kernel Modules."
echo ""
lsmod

echo ""
echo "######## Firmware Environment Variables - Uboot."
echo ""
fw_printenv

echo ""
echo "######## Firmware Config File."
echo ""
cat /etc/fw_env.config

echo ""
echo "######## Root Directory Layout."
echo ""
ls -la /

echo ""
echo "######## Drilling /etc Structure."
echo ""
ls -R /etc

echo ""
echo "######## Drilling /bin Structure."
echo ""
ls -R /bin

echo ""
echo "######## Drilling /home Structure."
echo ""
ls -R /home

echo ""
echo "######## Dmesg output."
echo ""
dmesg

echo "So long!!!"
echo ""
