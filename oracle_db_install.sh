#!/bin/bash

. ./var.sh

su - oracle -lc "dbca -silent -createDatabase -gdbName $globalDBName -sysPassword $passwordALL -systemPassword $passwordALL -responseFile /tmp/database/response/dbca.rsp"


echo "dbca安装数据库生成一个临时日志，一个永久日志 /u01/app/oracle/cfgtoollogs/dbca/silent.log /u01/app/oracle/cfgtoollogs/dbca/orcl/orcl.log"
