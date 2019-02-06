#!/bin/bash

. ./var.sh

mkdir $oracle_home/jdk/jre/lib/fonts/fallback

cp simfang.ttf $oracle_home/jdk/jre/lib/fonts/fallback

chown -R oracle:oinstall $oracle_home/jdk/jre/lib/fonts/fallback

rm $oracle_home/oc4j/j2ee/oc4j_applications/applications/em/em/cabo/images/cache/zhs/*.gif

su - oracle -lc "emctl stop dbconsole"

su - oracle -lc "emctl start dbconsole"
