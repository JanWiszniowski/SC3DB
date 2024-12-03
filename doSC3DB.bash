#!/bin/bash
NoArg=$#
if [ $NoArg -le 1 ]
then    echo "Call: ./doSC3DB.bash <database name> [<script name>] [<authority id>]
        echo " e.g. ./doSC3DB.bash Lubin SC3DB20181123.sql igf.edu.pl
        echo "      Default database name is 'SC3DBDefinition.sql'"
        echo "      Default authority id is 'igf.edu.pl'"
        echa "Warning! The script clears data base if exists"
        exit
fi
if [ $NoArg -le 2 ]
then
        SC3DB="SC3DBDefinition.sql"
else
        SC3DB=$2
fi
if [ $NoArg -le 3 ]
then
        Authority="igf.edu.pl"
else
        Authority=$3
fi
YMD=`date +%Y%m%d`
DBName=$1
echo "Database: $DBName"
echo "Authority id: $Authority"
echo "Script: $SC3DB"
echo -n "Pasword >"
read -s Passwd
echo
#mysqldump -u root --password="$Passwd" $DBName > $DBName$YMD.sql

sed "s:@SC3DBParameters:$Authority/$DBName#eventParameters:g" < $SC3DB > tempSC3DB.sql
sed -i "s/@SC3DB/$DBName/g" tempSC3DB.sql
mysql -u root  --password="$Passwd" < tempSC3DB.sql
