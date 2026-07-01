---
name: api-overload-retry-cadence
description: 碰到 API 过载(529 / 工具因安全 classifier 不可用被挡)时的等待重试节奏
metadata: 
  node_type: memory
  type: feedback
  originSessionId: ""
---

> 示例·反馈类记忆:这是"记录你的用户偏好"的样例,换成你自己用户的实际偏好。

碰到 API 过载(529 Overloaded,或工具因安全 classifier(分类器)临时不可用而被挡)时,默认节奏:**第一次等 20 分钟再继续;之后每 10 分钟试一次**,直到恢复。

**Why:** 过载是服务端临时排队、跟用户额度无关(别让用户去充钱);频繁重试只会刷屏空耗,固定节奏更省。

**How to apply:** 用定时唤醒/等待机制设等待(首次约 1200 秒,之后 600 秒),prompt 里带上要重试的具体任务。每次醒来先跑一个 read-only(只读)探测确认工具恢复没,再做写操作。恢复前别连着重试写操作。
