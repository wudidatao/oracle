#!/bin/bash

. ./var.sh

#创建sysman和dbsnmp账号
su - oracle -lc "sqlplus /nolog <<EOF
connect sys/$passwordALL as sysdba
alter user sysman account unlock identified by $passwordALL;
alter user dbsnmp account unlock identified by $passwordALL;
EOF"

#先删除再创建
su - oracle -lc "emca -deconfig dbcontrol db -SID $oracle_sid"
su - oracle -lc "emca -repos drop -SID $oracle_sid -PORT $oracle_port -SYS_PWD $passwordALL -DBSNMP_PWD $passwordALL -SYSMAN_PWD $passwordALL"
su - oracle -lc "emca -config dbcontrol db -repos create -SID $oracle_sid -PORT $oracle_port -SYS_PWD $passwordALL -DBSNMP_PWD $passwordALL -SYSMAN_PWD $passwordALL"
