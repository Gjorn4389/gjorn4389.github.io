---
title: snipaste picgo ubuntu
date: 2023-12-22 00:52:05
tags: ubuntu picgo
---

# flameshot ubuntu 截图工具
`sudo apt install flameshot`


# Picgo
1. [PicGo客户端](https://github.com/Molunerfinn/PicGo)
2. 下载 AppImage 格式 
3. 添加到 Applications
    + `vim /usr/share/applications/picgo.desktop`
    ```
    [Desktop Entry]
    Type=Application
    Name=picGo
    Exec=/path/to/picgo/PicGo-2.3.1.AppImage
    Terminal=false
    ```

# AppImage 缺少 libfuse2 依赖
`sudo apt install libfuse2`
