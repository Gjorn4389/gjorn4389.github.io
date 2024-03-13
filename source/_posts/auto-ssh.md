---
title: auto-ssh
date: 2023-12-22 00:52:05
categories: linux
tags:
    - shell
    - expect
---

# 使用expect工具实现自动注入账号密码

```shell
#!/bin/bash

if [ $# -ne 2 ]; then
    echo "usage: sh copykey.sh hostip password "
    exit 1
fi

# 判断id_rsa秘钥文件是否存在
if [ ! -f "/root/.ssh/id_rsa" ];then
    ssh-keygen -t rsa -P "" -f /root/.ssh/id_rsa
else
    echo "id_rsa has created ......"
fi

# 密码登录
user="root"
ip=$1
passwd=$2
expect <<EOF
    set timeout 5
    spawn ssh-copy-id $user@$ip
    expect {
        "yes/no" { send "yes\n";exp_continue }
        "password" { send "$passwd\n" }
        "installed" {  } expect eof
    }
EOF
```
