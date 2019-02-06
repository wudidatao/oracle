#!/bin/bash

. ./var.sh

cp /tmp/database/response/dbca.rsp /tmp/database/response/dbca.rsp_bak

cd /tmp/database/response/

sed -i "s/GDBNAME = \"orcl11g.us.oracle.com\"/GDBNAME = \"$globalDBName\"/g" dbca.rsp

sed -i "s/SID = \"orcl11g\"/SID = \"$oracle_sid\"/g" dbca.rsp
