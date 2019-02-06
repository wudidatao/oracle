#使用脚本时，将oracle11g安装文件的两个压缩包放在该目录下即可

#变量
var.sh

#服务器初始化
os_init.sh

#oracle基础依赖环境安装
base_install.sh

#oracle软件安装
oracle_install_set.sh
oracle_install.sh

#oracle数据库安装
oracle_db_install_set.sh
oracle_db_install.sh

#oracle监听配置
oracle_net_install.sh

#oracle开机启动
oracle_start.sh

#oem安装
oracle_oem_install.sh

#oem开机启动
oracle_oem_start.sh

#oem按钮乱码调整
oracle_oem_zh.sh
