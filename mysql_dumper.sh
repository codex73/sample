#!/bin/bash
###
### Author: Francisco Suarez
### MySQL DB Table Dumper
### Description: Creates MySql Database Dumps Archives for Backup Purposes
###

username="root"
password="mgs1B36lDII8NkM"
hostname="127.0.0.1"
excluded_db="Database|information_schema|performance_schema|mysql|phpmyadmin"
databases=$( echo "show databases;" | mysql -h 127.0.0.1 -P 3306 --user=root --password=$password | grep -Ev "($excluded_db)" 2>&1)
backup_directory="dumps"
strip="--strip-components=1"

cd /db_dumps/

# Remove Previous Archives
rm -rf dumps/*.*

# Some Basic Logging
date >> "dump_dbs.log"
echo -e "  Start of Dumper\r"  >> "dump_dbs.log"

#bash -x -o igncr dump.sh

for db in $databases
do
    database=$db
    date >> "dump_dbs.log"
    echo -e " " $db "dump created\r"  >> "dump_dbs.log"
    basename="$database-`date +%Y%m%d`"
    tmp_path="$basename"
    tmp_file="$tmp_path.tgz"

    mysql_parameters="--user=$username  --password=$password --host=$hostname"

    mkdir -p $tmp_path

    for table in `mysql $mysql_parameters --database=$database -e "SHOW TABLES" -B -N`
    do
        if [ $table != "omit1" -a $table != "omit2" ];
        then
            mysqldump $mysql_parameters $database $table --single-transaction=true --add-drop-table=true > $tmp_path/$table.sql
        fi
    done
    mkdir -p $backup_directory
    tar -czvf $backup_directory/$tmp_file $tmp_path $strip
    rm -r $tmp_path
done

date >> "dump_dbs.log"
echo -e "  End of Dumper\r"  >> "dump_dbs.log"
