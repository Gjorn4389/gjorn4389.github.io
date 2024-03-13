---
title: Memory Hotplug
date: 2024-2-27 13:33:26
categories: libvirt
tags:
    - libvirt
    - hotplug
    - memory
---

# 热插内存主要流程
|-- qemuDomainAttachDeviceLiveAndConfig
|-- qemuDomainAttachDeviceLive
|-- qemuDomainAttachMemory
    |-- virDomainMemoryInsert
    |-- event = virDomainEventDeviceAddedNewFromObj(vm, objalias);      构造event
        |-- virDomainEventDeviceAddedClass, **VIR_DOMAIN_EVENT_ID_DEVICE_ADDED**
    |-- virObjectEventStateQueue(**driver->domainEventState**, event);      等待分发
        |-- virObjectEventStateQueueRemote
            |-- virObjectEventQueuePush


### qemu driver 实现
virConnectDomainEventRegisterAny
|-- qemuConnectDomainEventRegisterAny
    |-- virDomainEventStateRegisterID(conn, driver->domainEventState, ...)
        |-- virObjectEventStateRegisterID
            |-- virEventAddTimeout
            |-- virObjectEventCallbackListAddID



qemuConnectDomainQemuMonitorEventRegister
|-- virConnectDomainQemuMonitorEventRegisterEnsureACL
|-- virConnectDomainQemuMonitorEventRegister



## 调用callback的流程

```c
{
    REMOTE_PROC_DOMAIN_EVENT_CALLBACK_DEVICE_ADDED,
    remoteDomainBuildEventCallbackDeviceAdded,
    sizeof(remote_domain_event_callback_device_added_msg),
    (xdrproc_t)xdr_remote_domain_event_callback_device_added_msg
}
```

remoteDomainBuildEventCallbackDeviceAdded
virDomainEventDeviceAddedNewFromDom
virDomainEventDeviceAddedNew
virDomainEventNew
virObjectEventNew(klass, virDomainEventDispatchDefaultFunc, ...)  <--- 这里注册了一个分发函数，找到对应的处理函数


## 调用分发函数
virObjectEventStateDispatchCallbacks
|-- 在callback池中找匹配的event_id，确定event对应的callback
|-- event->dispatch(cb->conn, event, cb->cb, cb->opaque);