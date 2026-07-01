---
name: webnote-sync
description: "【示例·模块地图】WebNote 同步模块:多端同步 + 冲突解决的核心逻辑 + 触手"
metadata:
  node_type: map
  repo: webnote
  type: project
  weight: 1
---

> 编造的示例地图。**锚点 = 代码里的同步模块 `src/sync/`。**

**核心逻辑(怎么运作)**:客户端每次改动带一个版本号推给服务端(`src/sync/SyncEngine.ts` 的 `push()`);服务端比对版本,冲突则走冲突解决(`resolveConflict()`)。

**触手(它连着谁)**:← 编辑器(改动的来源) · → 账号(按用户隔离数据) · → 数据库(存版本号)。

**事件(叶)**:
- 🍃 [同步冲突把改动吞了 → 改成保留副本](webnote-sync-conflict-dedup.md)
