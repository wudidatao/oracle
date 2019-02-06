#!/bin/bash

#主机名
hostname=public-1-53
echo $hostname

#SID
oracle_sid=orcl
echo $oracle_sid

#全局数据库名
globalDBName=orcl
echo $globalDBName

#监听端口
oracle_port=1521
echo $oracle_port

#使用内存上限，单位是M，不用加
memoryLimit=1024
echo $memoryLimit

#全局密码
passwordALL=Liutao123456
echo $passwordALL

#数据库字符集
characterSet=AL32UTF8

#设置oracle基础目录，主要用于安装oracle软件
oracle_base=/u01/app/oracle
echo $oracle_base

#设置oracle家目录，主要用于安装oracle实例
oracle_home=$oracle_base/product/11.2.0/dbhome_1
echo $oracle_home

#清单目录，放在/u01/app/oracle目录下安装时会有个警告
inventory_location=$oracle_base/oraInventory
echo $inventory_location

#闪回恢复区
flash_recovery_area=$oracle_base/flash_recovery_area
echo $flash_recovery_area

#数据库文件位置
datalocation=$oracle_base/oradata
echo $datalocation
