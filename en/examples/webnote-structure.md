---
name: webnote-structure
description: "[Example · project structure tree] WebNote's real code structure/shape: directories, modules, entry points — the objective base map for anchor-first"
metadata:
  node_type: structure
  repo: webnote
  type: project
  weight: 1
---

> Made-up example structure tree. **It records what the code "looks like" (objective shape), not "why it's designed this way" (that's the job of the map [[webnote-sync]]).** When filing a new memory, come here first to check "where in the code is the thing it's talking about" → determine the anchor. Build it by scanning the code at the first consolidation, then update it incrementally.

**Repo** `~/webnote/` (frontend React / backend Node)

```
webnote/
├── src/
│   ├── sync/          → module · sync   (map [[webnote-sync]])
│   │   ├── SyncEngine.ts     push() / resolveConflict()
│   │   └── versionStore.ts
│   ├── editor/        → module · editor (map to be built)
│   └── auth/          → module · auth   (map to be built)
├── server/
│   └── api/           → REST interface
└── db/
    └── migrations/    → rollback-able migrations (see root iron rule)
```

**Entry points**: frontend `src/index.tsx`; backend `server/main.ts`.
**Modules with a map built**: sync (the rest, editor / auth, are placeholders to be built).
