# gost-forwarder
支持 HTTP 修改规则等 GOST 转发器。

# 启动
```bash
docker stop gost-forwarder && docker rm gost-forwarder
docker pull rabbir/gost-forwarder:latest
docker run -d --name gost-forwarder \
    --restart=always \
    --network host \
    -e RAB_GOST_FORWARDER_ADDR=":8000" \
    -e RAB_GOST_FORWARDER_PATH_PREFIX="/api" \
    -e RAB_GOST_FORWARDER_ACCESS_LOG="true" \
    -e RAB_GOST_FORWARDER_AUTH_USERNAME="admin" \
    -e RAB_GOST_FORWARDER_AUTH_PASSWORD="admin" \
    -e RAB_GOST_FORWARDER_AUTHER="auther-0" \
    rabbir/gost-forwarder:latest
```

# 文档
[GOST Web API](https://gost.run/swagger-ui/)

# 测试
```bash
# todo...
```