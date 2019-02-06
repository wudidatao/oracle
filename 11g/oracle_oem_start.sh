#!/bin/bash

. ./var.sh

echo "
su - oracle -lc \"$oracle_home/bin/emctl config emkey -repos -sysman_pwd $passwordALL\"
su - oracle -lc \"$oracle_home/bin/emctl secure dbconsole -sysman_pwd $passwordALL\"
su - oracle -lc \"$oracle_home/bin/emctl start dbconsole\"
" >> /etc/rc.d/rc.local
