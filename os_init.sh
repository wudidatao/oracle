#!/bin/bash

. ./var.sh

hostnamectl set-hostname $hostaname

yum install unzip -y
unzip linux.x64_11gR2_database_1of2.zip
unzip linux.x64_11gR2_database_2of2.zip

groupadd dba
groupadd oinstall
useradd -g oinstall -G dba oracle
echo "oracle" | passwd --stdin oracle

echo "
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=\$ORACLE_BASE/product/11.2.0/dbhome_1
export ORACLE_SID=orcl
export NLS_LANG=AMERICAN_AMERICA.AL32UTF8
export LD_LIBRARY_PATH=\$ORACLE_HOME/lib
export PATH=\$ORACLE_HOME/bin:/bin:/usr/bin:/usr/sbin:/usr/local/bin
" >> /home/oracle/.bash_profile

chown -R oracle:oinstall /home/oracle/.bash_profile

mkdir -p /u01/app/oracle/oraInventory
chown -R oracle:oinstall /u01/app/oracle
chmod -R 755 /u01/app/oracle

echo "
# Controls the maximum shared segment size, in bytes
kernel.shmmax = 4294967295
# Controls the maximum number of shared memory segments, in pages
kernel.shmall = 268435456
kernel.shmmni = 4096
kernel.sem =250 32000 100 128
net.core.rmem_default = 262144
net.core.rmem_max = 4194304
net.core.wmem_default = 262144
net.core.wmem_max = 262144
net.ipv4.ip_local_port_range =9000 65500
fs.file-max=65536
fs.aio-max-nr=1048576
" >> /etc/sysctl.conf

echo "
oracle soft nproc 2047
oracle hard nproc 16384
oracle soft nofile 1024
oracle hard nofile 65536
oracle soft stack 10240
oracle hard stack 10240
" >> /etc/security/limits.conf
