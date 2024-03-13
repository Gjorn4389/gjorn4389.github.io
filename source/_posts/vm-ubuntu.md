---
title: vms over ubuntu
date: 2023-12-20 02:31:41
categories: ubuntu
tags:
    - ubuntu
---

1. ubuntu需要修改emulator
```xml
<emulator>/usr/bin/qemu-system-x86_64</emulator>
```
2. 需要cdrom引导安装系统
```xml
<os>
    <bootmenu enable='yes' timeout='5000'/>
</os>

<disk type='file' device='cdrom'>
    <driver name='qemu'/>
    <source file='/srv/vms/iso/CentOS-7-x86_64-Minimal-2009.iso'/>
    <target dev='hdb' bus='ide'/>
    <readonly/>
    <boot order='2'/>
</disk>
```
