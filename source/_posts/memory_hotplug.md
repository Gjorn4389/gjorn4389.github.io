---
title: Memory Hotplug
date: 2024-2-27 13:33:26
tags:
---

# 热插内存主要流程
|-- qemuDomainAttachDeviceLiveAndConfig
|-- qemuDomainAttachDeviceLive
|-- qemuDomainAttachMemory
    |-- virDomainMemoryInsert
    |-- event = virDomainEventDeviceAddedNewFromObj(vm, objalias);      构造event
        |-- virDomainEventDeviceAddedClass, VIR_DOMAIN_EVENT_ID_DEVICE_ADDED
    |-- virObjectEventStateQueue(**driver->domainEventState**, event);      等待分发
        |-- virObjectEventStateQueueRemote

# 分发 event
|-- virObjectEventStateFlush
    |-- virObjectEventStateQueueDispatch
        |-- virObjectEventStateDispatchCallbacks
    |-- virObjectEventCallbackListPurgeMarked(state->callbacks);
        |-- event->dispatch(cb->conn, event, cb->cb, cb->opaque);


## 创建 DeviceAdded Event Class
VIR_CLASS_NEW(virDomainEventDeviceAdded, virDomainEventClass)
![virDomainEventDeviceAddedClass](https://raw.githubusercontent.com/Gjorn4389/Gjorn4389.github.io/source/images/virDomainEventDeviceAddedClass.png)

event->dispatch 一般都是 virDomainEventDispatchDefaultFunc 根据 event_id 分发，执行对应的函数
![event->dispatch](https://raw.githubusercontent.com/Gjorn4389/Gjorn4389.github.io/source/images/virObjectEvent_dispatch.png)

VIR_DOMAIN_EVENT_ID_DEVICE_ADDED  <============>  virConnectDomainEventDeviceAddedCallback

[理解 event 监听](https://blog.csdn.net/Jacobsea/article/details/125616913)
