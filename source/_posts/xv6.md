---
title: xv6
date: 2023-12-23 09:26:43
categories: os
tags:
    - os
---

> [环境配置gdb](https://zhuanlan.zhihu.com/p/638731320)

# xv6启动第一个进程

1. `entry.S`
    + 从 `_entry` 开始运行xv6，此时虚拟地址直接映射到物理地址
    + `kernel.ld` 将 xv6内核加载到 `0x80000000`，`0x0~0x80000000` 包含IO设备
    + 设置栈(用于运行c代码)，stack0在`start.c`文件中声明
    + 执行 start.c 中的 start()
2. `start.c`
    + 修改运行模式为 Machine 模式
    + 设置main函数的地址
    + 禁止虚拟地址转换
    + 将所有的中断和异常委托给管理模式
    + 内存保护
    + 产生计时器中断
    + 通过 `mret` 回到 Supervisor 模式
3. `main.c`
    + 初始化设备、子系统
    + `userinit` 执行 `initcode.S`
    + scheduler() 会调度到第一次个proc，即init
4. `init.c`
    + 创建 console
    + 打开文件描述符
    + 启动shell