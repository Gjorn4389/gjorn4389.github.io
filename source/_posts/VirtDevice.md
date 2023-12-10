---
title: Virt Device
date: 2023-12-10 09:26:43
categories: VirtMachine
---

# 概念
Virtio协议是半虚拟化的解决方案，使用 Virtqueue 传输数据。

# PCI配置空间

## PCI配置空间
TODO

## PCI设备板上存储空间
1. PCI设备提出需要的地址空间大小、板上内存映射类型(内存地址、IO地址)，将其记录在BAR(Base Address Registers)中。
2. 由 BIOS(或UEFI) 在系统初始化，访问 BAR 统一划分地址空间
    > Q: 热插设备什么时候分配地址空间
3. PCI拓扑关系： cpu <---> Host Bridge <---> pci bus <---> PCI Device
    ![PCI拓扑关系](https://raw.githubusercontent.com/Gjorn4389/Gjorn4389.github.io/source/images/vfio/cpu_pci_topology.png)

## 模拟pci设备配置空间

