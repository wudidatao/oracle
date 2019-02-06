#!/bin/bash

. ./var.sh

yum install wget -y

wget http://public-yum.oracle.com/RPM-GPG-KEY-oracle-ol7 -O /etc/pki/rpm-gpg/RPM-GPG-KEY-oracle

wget http://public-yum.oracle.com/public-yum-ol7.repo -O /etc/yum.repos.d/public-yum-ol7.repo

yum install oracle-rdbms-server-11gR2-preinstall.x86_64
