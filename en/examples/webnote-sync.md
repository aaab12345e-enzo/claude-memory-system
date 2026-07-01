---
name: webnote-sync
description: "[Example · module map] WebNote sync module: the core logic + tentacles of multi-device sync + conflict resolution"
metadata:
  node_type: map
  repo: webnote
  type: project
  weight: 1
---

> Made-up example map. **Anchor = the sync module in the code, `src/sync/`.**

**Core logic (how it works)**: on each change the client pushes to the server with a version number (`push()` in `src/sync/SyncEngine.ts`); the server compares versions, and on conflict runs conflict resolution (`resolveConflict()`).

**Tentacles (who it connects to)**: ← editor (source of changes) · → auth (isolates data per user) · → database (stores version numbers).

**Events (leaves)**:
- 🍃 [sync conflict swallowed a change → changed to keep a copy](webnote-sync-conflict-dedup.md)
