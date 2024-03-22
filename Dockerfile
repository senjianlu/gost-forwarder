# 基础镜像系统版本为 gogost/gost:latest
FROM gogost/gost:latest

# 维护者信息
LABEL maintainer="Rabbir admin@cs.cheap"

# Docker 内用户切换到 root
USER root

# 设置时区为东八区
ENV TZ Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime > /etc/timezone

# 将脚本复制到容器中
COPY script/init.sh /root/init.sh
# 赋予脚本执行权限
RUN chmod +x /root/init.sh

# 将配置文件复制到容器中
COPY config/gost.json /etc/gost/gost.json

# 安装 bash
RUN apk add --no-cache bash

# 启动命令，执行 /bin/gost
ENTRYPOINT ["/bin/bash", "-c", "/root/init.sh && /bin/gost"]