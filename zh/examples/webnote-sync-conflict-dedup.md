---
name: webnote-sync-conflict-dedup
description: "【示例·事件叶】WebNote 同步:两端同时改同一条笔记,旧策略直接覆盖丢改动;改成保留冲突副本"
metadata:
  node_type: event
  repo: webnote
  tag: bug修复
  type: project
  weight: 1
---

> 编造的示例叶。**模块地图 = [[webnote-sync]]**(每片叶必须声明它挂哪张地图,否则是孤儿)。锚点 = `src/sync/SyncEngine.ts` 的 `resolveConflict()`。

**问题**:两端离线各改同一条笔记,重连后按"最后写入"直接覆盖 → 先同步那端的改动没了。

**根因**:冲突时只留一份、没保存被覆盖的版本(`SyncEngine.ts:88`)。

**判断/结论**:改成**冲突时两份都留**(原笔记 + 一份"冲突副本"),让用户自己合。

**🩸对话▸1,3**(关键决策的原始对话在 `conversations/events/webnote-sync.md`,按编号精准取)。
