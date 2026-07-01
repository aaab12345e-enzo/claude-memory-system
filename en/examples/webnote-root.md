---
name: webnote-root
description: "[Example · project root] WebNote (a note-taking app) project root: identity + development iron rules + index of each module (branch)"
metadata:
  node_type: root
  repo: webnote
  type: project
  weight: 1
---

> Made-up example project, for you to copy the structure from. **Anchor = the whole repo `~/webnote/`.**

**WebNote** = a cross-platform note-taking app (frontend React, backend Node). Code is in `~/webnote/`.

**Development iron rules**: run `npm test` after making changes; database migrations must be rollback-able.

**Module (branch) index**:
- 🌿 [sync](webnote-sync.md) — multi-device note sync + conflict resolution.
- 🌿 editor (placeholder · to be built)
- 🌿 auth (placeholder · to be built)
