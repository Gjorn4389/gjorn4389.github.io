---
title: WSL
date: 2023-12-17 13:33:26
tags:
---

# 常用命令
1. `wsl --list`
2. `wsl --unregister <Dist>`
3. `wsl --help`
4. `wsl --version`

# 修改默认用户为 **root**
1. 找到对应的发行版exe文件：C:\Users\用户名\AppData\Local\Microsoft\WindowsApps\ubuntu1804.exe
2. 执行命令：ubuntu1804.exe config --default-user root
    > 需要在cmd中执行，cd到指定目录
3. 如果遇到`NAT 模式下的 WSL 不支持 localhost 代理`
    + 修改 `C:/User/用户名/.wslconfig` 
        ```
        [experimental]
        autoMemoryReclaim=gradual  
        networkingMode=mirrored
        dnsTunneling=true
        firewall=true
        autoProxy=true
        ```
    + 重启wsl：`wsl --shutdown`

# 令wsl使用systemd
1. 更新wsl：`wsl --update`
2. 修改文件 `/etc/wsl.conf`
3. 添加配置
    ```
    [boot]
    systemd=true
    ```