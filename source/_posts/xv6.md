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

# 页表

**术语**
+ PTE: Page Table Entry
+ PPN: Physical Page Nuber
+ TLB: Translation Look-aside Buffer

**页表用途**
1. 映射相同的内存到不同的地址空间
2. 用未映射的页面保护内核和用户栈

## 分页
> 内核将所有物理内存映射到其页表，因此可以直接对物理内存操作

### 虚拟地址转化步骤
1. `offset` 12位：一个页表是4096字节，可以用12位二进制数字表示
2. `index` 27位：每个PTE是8字节，一个页表可以储存512个PTE(9位)，index是三级页表(L1、L2、L3各9位)
3. `PPN` 44位：Sv39 RISC-V 仅用到44位物理页码
![虚拟地址转化成物理地址](https://raw.githubusercontent.com/Gjorn4389/Gjorn4389.github.io/source/images/vma2pma.png)
![RISC-V 地址转化](https://raw.githubusercontent.com/Gjorn4389/Gjorn4389.github.io/source/images/riscv_vma_translate.png)

### 内核使用
1. `satp`寄存器: 存放根页表页在内存中的地址
2. 每个 CPU 有独立的 `satp`寄存器，因此不同CPU的虚拟地址空间不同，但是使用同一个内核地址空间
3. 切换进程就需要修改`satp`寄存器 ?


### 常见标记位
+ `PTE_V`: PTE是否存在，0表示不合法
+ `PTE_R`: 是否可读
+ `PTE_W`: 是否可写
+ `PTE_X`: 是否可执行
+ `PTE_U`: 用户能否访问，0表示仅内核可访问

## 内核地址空间

![地址空间映射](https://raw.githubusercontent.com/Gjorn4389/Gjorn4389.github.io/source/images/va_space_2_pa_space.png)

1. 物理地址 `0x8000000` 以下: 保留了设备接口，作为内存映射控制寄存器暴露给软件，通过这些特殊的物理地址与设备交互
2. 内核的虚拟地址和物理地址一致，可以通过虚拟地址直接操作物理内存
    > 内核虚拟地址中非直接映射部分：
    > `trampoline page`: 虚拟地址最后一页
    > `guard page`: 进程的内核栈会有 guard page，防止栈溢出。不会映射到物理地址空间，PTE_V 不设置。
3. 内核会给每个进程分配一个内核栈
    > 内核栈是在系统启动的时候就创建好的吗？对应的内核一直没使用？

## 进程地址空间
![进程地址空间](https://raw.githubusercontent.com/Gjorn4389/Gjorn4389.github.io/source/images/riscv_process_addr_space.png)

1. 不同进程的页表将用户地址转换为物理内存的不同页面，因此进程的内存互相隔离
2. 进程的虚拟内存空间是连续的，对应的物理内存可以是非连续的
3. 将虚拟地址的最后一页映射到trampoline page，所有地址空间都有一个单独的物理内存页
4. 用户栈前一页是 guard page，防止栈溢出