---
name: webnote-structure
description: "【示例·项目结构树】WebNote 的真实代码结构/形状:目录、模块、入口——锚点优先的客观底图"
metadata:
  node_type: structure
  repo: webnote
  type: project
  weight: 1
---

> 编造的示例结构树。**它记的是代码「长什么样」(客观形状),不是「为什么这么设计」(那是地图 [[webnote-sync]] 的事)。** 新记忆要归位时,先来这查"它讲的东西在代码哪儿"→ 定锚点。第一次整理时扫代码建它,之后增量更新。

**仓库** `~/webnote/`(前端 React / 后端 Node)

```
webnote/
├── src/
│   ├── sync/          → 模块·同步   (地图 [[webnote-sync]])
│   │   ├── SyncEngine.ts     push() / resolveConflict()
│   │   └── versionStore.ts
│   ├── editor/        → 模块·编辑器 (地图待建)
│   └── auth/          → 模块·账号   (地图待建)
├── server/
│   └── api/           → REST 接口
└── db/
    └── migrations/    → 可回滚迁移(见根铁律)
```

**入口**:前端 `src/index.tsx`;后端 `server/main.ts`。
**已建地图的模块**:sync(其余 editor / auth 占位待建)。
