#!/bin/bash

echo "================================================================================"

# 1. 读取环境变量
# RAB_GOST_FORWARDER_ADDR
rab_gost_forwarder_addr=${RAB_GOST_FORWARDER_ADDR}
# RAB_GOST_FORWARDER_PATH_PREFIX
rab_gost_forwarder_path_prefix=${RAB_GOST_FORWARDER_PATH_PREFIX}
# RAB_GOST_FORWARDER_ACCESS_LOG
rab_gost_forwarder_access_log=${RAB_GOST_FORWARDER_ACCESS_LOG}
# RAB_GOST_FORWARDER_AUTH_USERNAME
rab_gost_forwarder_auth_username=${RAB_GOST_FORWARDER_AUTH_USERNAME}
# RAB_GOST_FORWARDER_AUTH_PASSWORD
rab_gost_forwarder_auth_password=${RAB_GOST_FORWARDER_AUTH_PASSWORD}
# RAB_GOST_FORWARDER_AUTHER
rab_gost_forwarder_auther=${RAB_GOST_FORWARDER_AUTHER}

# 2. 如果环境变量不为空，则写入配置文件 /etc/gost/gost.json
# 2.1 写入监听地址，修改第三行，前面需要 2 个空格
if [ -n "${rab_gost_forwarder_addr}" ]; then
    sed -i "3c\  \"addr\": \"${rab_gost_forwarder_addr}\"," /etc/gost/gost.json
fi
# 2.2 写入路径前缀，修改第四行，前面需要 2 个空格
if [ -n "${rab_gost_forwarder_path_prefix}" ]; then
    sed -i "4c\  \"pathPrefix\": \"${rab_gost_forwarder_path_prefix}\"," /etc/gost/gost.json
fi
# 2.3 写入访问日志，修改第五行，前面需要 2 个空格
if [ -n "${rab_gost_forwarder_access_log}" ]; then
    sed -i "5c\  \"accesslog\": ${rab_gost_forwarder_access_log}," /etc/gost/gost.json
fi
# 2.4 写入用户名，修改第七行，前面需要 4 个空格
if [ -n "${rab_gost_forwarder_auth_username}" ]; then
    sed -i "7c\    \"username\": \"${rab_gost_forwarder_auth_username}\"," /etc/gost/gost.json
fi
# 2.5 写入密码，修改第八行，前面需要 4 个空格
if [ -n "${rab_gost_forwarder_auth_password}" ]; then
    sed -i "8c\    \"password\": \"${rab_gost_forwarder_auth_password}\"," /etc/gost/gost.json
fi
# 2.6 写入认证器，修改第十行，前面需要 2 个空格
if [ -n "${rab_gost_forwarder_auther}" ]; then
    sed -i "10c\  \"auther\": \"${rab_gost_forwarder_auther}\"," /etc/gost/gost.json
fi

# 3. 打印配置文件内容
echo "配置文件 /etc/gost/gost.json 内容如下："
cat /etc/gost/gost.json

echo "================================================================================"

