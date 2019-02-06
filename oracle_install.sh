#!/bin/bash

echo "安装过程比较漫长，可以通过提示的日志查看是否有错误导致安装终止，安装后需要执行两个脚本，不要忘记"

su - oracle -lc "/tmp/database/./runInstaller -silent -force -ignorePrereq -responseFile /tmp/database/response/db_install.rsp"
