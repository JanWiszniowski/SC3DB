#!/bin/bash
NoArg=$#
LimArg=2
if [ $NoArg -lt $LimArg ]
then
	echo "------------------------------------------------------"
        echo "Call: ./doPatch.bash <database name> <patch file name>"
        echo " e.g. ./doPatch.bash Lubin SC3DBPath20181123.txt"
	echo "------------------------------------------------------"
        exit
fi
DBName=$1
Patch=$2
YMD=`date +%Y%m%d`
echo "Database: $DBName"
echo "Patch script: $Patch"
echo "Current date: $YMD"
echo -n "Pasword >"
read -s Passwd
echo
#echo "Password: <$Passwd>"

mysqldump -u root  --password="$Passwd" $DBName > $DBName$YMD.sql
mysql -u root --password="$Passwd" $DBName < $Patch

