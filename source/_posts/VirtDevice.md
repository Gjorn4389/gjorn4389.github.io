---
title: Virt Device
date: 2023-12-10 09:26:43
categories: VirtMachine
---

# 模型演变
+ 完全虚拟化: 根据硬件设备规范模拟，对Guest透明，不需要修改
+ `Vhost`方案: 将数据面迁移到内核空间
+ `Virtio`协议: 半虚拟化，使用`Virtqueue`传输数据
+ `VT-d`: Intel 在硬件层面提供支持，包含DMA重映射、中断重映射等安全方案
+ `SR-IOV`(Single Root I/O Virtualization): 将一个PCIe设备虚拟成多个功能设备给不同虚机访问使用

# PCI配置空间

## PCI配置空间
TODO

## PCI设备板上存储空间
1. PCI设备提出需要的地址空间大小、板上内存映射类型(内存地址、IO地址)，将其记录在 BAR(Base Address Registers) 中。
2. 由 BIOS(或UEFI) 在系统初始化，访问 `BAR` 统一划分地址空间
    > Q: 热插设备什么时候分配地址空间
3. PCI拓扑关系： cpu <---> Host Bridge <---> pci bus <---> PCI Device
    ![PCI拓扑关系](https://raw.githubusercontent.com/Gjorn4389/Gjorn4389.github.io/source/images/vfio/cpu_pci_topology.png)
4. 确定访问设备：管脚 `IDSEL` 选定目标 PCI 设备，仅需要确定 `Function Number` 和 `Registers Number`

## 模拟pci设备配置空间
> kvmtool
