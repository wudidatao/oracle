#!/bin/bash

. ./var.sh

sed -i "s/ORACLE_HOME_LISTNER=\$1/ORACLE_HOME_LISTNER=\$ORACLE_HOME/g" $oracle_home/bin/dbstart
sed -i "s/ORACLE_HOME_LISTNER=\$1/ORACLE_HOME_LISTNER=\$ORACLE_HOME/g" $oracle_home/bin/dbshut

string="$oracle_sid:$oracle_home"
sed -i "s#$string:N#$string:Y#g" /etc/oratab 

echo "
su - oracle -lc "$oracle_home/bin/lsnrctl start"
su - oracle -lc "$oracle_home/bin/dbstart"
" >> /etc/rc.d/rc.local

chmod +x /etc/rc.d/rc.local


