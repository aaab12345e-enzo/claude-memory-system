---
name: webnote-sync-conflict-dedup
description: "[Example · event leaf] WebNote sync: two devices edit the same note at once, the old strategy overwrites and loses a change; changed to keep a conflict copy"
metadata:
  node_type: event
  repo: webnote
  tag: bug fix
  type: project
  weight: 1
---

> Made-up example leaf. **module map = [[webnote-sync]]** (every leaf must declare which map it hangs off of, otherwise it's an orphan). Anchor = `resolveConflict()` in `src/sync/SyncEngine.ts`.

**Problem**: two devices each edit the same note offline; on reconnect, "last write wins" overwrites directly → the change from whichever synced first is gone.

**Root cause**: on conflict only one copy was kept, the overwritten version wasn't saved (`SyncEngine.ts:88`).

**Judgment/conclusion**: change it so **on conflict both copies are kept** (the original note + a "conflict copy"), and let the user merge them.

**🩸conversation▸1,3** (the raw conversation for the key decision is in `conversations/events/webnote-sync.md`, fetch precisely by number).
