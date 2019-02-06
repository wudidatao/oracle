#!/bin/bash

. ./var.sh

mv database /tmp

cd /tmp/database/response/

cp db_install.rsp db_install.rsp_bak

#安装方式，选择只安装数据库软件
sed -i "s/oracle.install.option=/oracle.install.option=INSTALL_DB_SWONLY/g" db_install.rsp

#设置主机名
sed -i "s/ORACLE_HOSTNAME=/ORACLE_HOSTNAME=$hostname/g" db_install.rsp

#设置oracle产品目录所属的组
sed -i "s/UNIX_GROUP_NAME=/UNIX_GROUP_NAME=oinstall/g" db_install.rsp

#设置oracle产品目录位置
sed -i "s#INVENTORY_LOCATION=#INVENTORY_LOCATION=$inventory_location#g" db_install.rsp

#设置安装语言
sed -i "s/^SELECTED_LANGUAGES=/SELECTED_LANGUAGES=en/g" db_install.rsp

#设置oracle家目录，主要用于安装oracle实例
sed -i "s#ORACLE_HOME=#ORACLE_HOME=$oracle_home#g" db_install.rsp

#设置oracle基础目录，主要用于安装oracle软件
sed -i "s#ORACLE_BASE=#ORACLE_BASE=$oracle_base#g" db_install.rsp

#设置安装Enterprise Edition
sed -i "s/oracle.install.db.InstallEdition=/oracle.install.db.InstallEdition=EE/g" db_install.rsp

#设置权限组
sed -i "s/oracle.install.db.DBA_GROUP=/oracle.install.db.DBA_GROUP=dba/g" db_install.rsp

sed -i "s/oracle.install.db.OPER_GROUP=/oracle.install.db.OPER_GROUP=oinstall/g" db_install.rsp

#设置SID
sed -i "s/oracle.install.db.config.starterdb.SID=/oracle.install.db.config.starterdb.SID=$oracle_sid/g" db_install.rsp

#设置全局数据库名
sed -i "s/oracle.install.db.config.starterdb.globalDBName=/oracle.install.db.config.starterdb.globalDBName=$globalDBName/g" db_install.rsp

#设置数据库字符集
sed -i "s/oracle.install.db.config.starterdb.characterSet=AL32UTF8/oracle.install.db.config.starterdb.characterSet=$characterSet/g" db_install.rsp

#设置内存使用上限
sed -i "s/oracle.install.db.config.starterdb.memoryLimit=/oracle.install.db.config.starterdb.memoryLimit=$memoryLimit/g" db_install.rsp

#设置全局密码，也可以给四个账号单独设置
sed -i "s/oracle.install.db.config.starterdb.password.ALL=/oracle.install.db.config.starterdb.password.ALL=$passwordALL/g" db_install.rsp

#设置数据库文件的存储方式
sed -i "s/oracle.install.db.config.starterdb.storageType=/oracle.install.db.config.starterdb.storageType=FILE_SYSTEM_STORAGE/g" db_install.rsp

#设置数据文件位置
sed -i "s#oracle.install.db.config.starterdb.fileSystemStorage.dataLocation=#oracle.install.db.config.starterdb.fileSystemStorage.dataLocation=$datalocation#g" db_install.rsp

#设置闪回恢复区
sed -i "s#oracle.install.db.config.starterdb.fileSystemStorage.recoveryLocation=#oracle.install.db.config.starterdb.fileSystemStorage.recoveryLocation=$flash_recovery_area#g" db_install.rsp

sed -i "s/DECLINE_SECURITY_UPDATES=/DECLINE_SECURITY_UPDATES=true/g" db_install.rsp
