#!/bin/sh

# Quick Embedded Linux Local Enumeration Script 
# v1.0

sleep 0.4
echo "Version: 1.0"
echo "Author: @Felix"
echo "Running - $0"
echo ""

if [ "$#" -ne 1 ]; then
	echo "Usage example: <script> 0:1"
	echo "Pass 0 - Enumerate local file system. Place this script in the root of the file system."
	echo "Pass 1 - Enumerate on running device. Place this script anywhere on the device."
	exit 1
fi

if [ $1 -ne 1 ] && [ $1 -ne 0 ]; then
	echo "Usage example: <script> 0:1"
	echo "Pass 0 - Enumerate local file system. Place this script in the root of the file system."
	echo "Pass 1 - Enumerate on running device. Place this script anywhere on the device."
	exit 1
fi

sleep 3

if [ $1 -eq 1 ]; then
	echo ""
	echo "######## Uname Output."
	echo ""
	uname -a

	echo ""
	echo "######## Busybox Commands."
	echo ""
	/bin/busybox --help

	echo ""
	echo "######## Terminal Environment Variables."
	echo ""
	env

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
	echo "######## Loaded Kernel Modules."
	echo ""
	lsmod

	echo ""
	echo "######## Firmware Environment Variables - Uboot."
	echo ""
	fw_printenv

	echo ""
	echo "######## Dmesg output."
	echo ""
	dmesg

	echo ""
	echo "######## Network INFO."
	echo ""
	cat /etc/sysconfig/network
	echo ""
	cat /etc/resolv.conf
fi

[ $1 -eq 1 ] && USING_FIND="/bin/busybox find /" || USING_FIND="find ."
[ $1 -eq 1 ] && ROOT_DIR="/" || ROOT_DIR=""

echo ""
echo "######## World Writable Directories."
echo ""
$USING_FIND -perm -222 -type d 2>/dev/null

echo ""
echo "######## World Writable Files."
echo ""
$USING_FIND -type f -perm 077 2>/dev/null

echo ""
echo "######## Sticky Bit Files."
echo ""
$USING_FIND -perm -g=s -o -perm -4000 ! -type 1 -maxdepth 3 -exec ls -ld {} \; 2>/dev/null

echo ""
echo "######## Executable Files."
echo ""
$USING_FIND -type f -perm /u+x 2>/dev/null

echo ""
echo "######## Web Servers and Associated Technologies."
echo ""
$USING_FIND -type f -perm /u+x -name "*httpd*" -o -name "*cgi*" -o -name "*nginx*" 2>/dev/null

echo ""
echo "######## Library Versions."
echo ""
for i in `$USING_FIND -type d -name lib`;do /bin/busybox find $i -type f;done

echo ""
echo "######## HTML, Javascript, cgi, and Config Files."
echo ""
$USING_FIND -name "*.htm*" -o -name "*.js" -o -name "*.cgi" -o -name "*.conf"

echo ""
echo "######## (Pem) Certificate files."
echo ""
$USING_FIND -name "*.pem"

echo ""
echo "######## Firmware Config File."
echo ""
cat `echo $ROOT_DIR`etc/fw_env.config

echo ""
echo "######## Root Directory Layout."
echo ""
ls -la $ROOT_DIR

echo ""
echo "######## Drilling /etc Structure."
echo ""
ls -R `echo $ROOT_DIR`etc

echo ""
echo "######## Drilling /bin Structure."
echo ""
ls -R `echo $ROOT_DIR`bin

echo ""
echo "######## Drilling /home Structure."
echo ""
ls -R `echo $ROOT_DIR`home

echo ""
echo "######## /etc/inittab Contents."
echo ""
cat `echo $ROOT_DIR`etc/inittab

echo ""
echo "######## /etc/rc Contents."
echo ""
cat `echo $ROOT_DIR`etc/rc

echo ""
echo "######## Grab Password Files."
echo ""
cat `echo $ROOT_DIR`etc/passwd
cat `echo $ROOT_DIR`etc/shadow

echo "Bye bYe byE!!!"
echo ""
