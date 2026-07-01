# Sample: a fully filled-out memory tree + how to add a new memory

> This is a **made-up example project** (WebNote, a note-taking app), for you to **copy the structure from** — because with only abstract rules and no concrete filled-out artifact, the hardest thing to get started on is "how a leaf gets built, how it gets attached, how to dedup, which category it goes in."

## What this tree looks like

```
🗺️ structure webnote-structure.md    ← the project's real code "shape" (dirs/modules/entry points) = the anchor base map
🌲 root   webnote-root.md             ← project identity + iron rules + module (branch) index
 └─🌿 branch  webnote-sync.md          ← one "logic map" per module (core logic + tentacles)
     └─🍃 leaf  webnote-sync-conflict-dedup.md   ← one concrete event (problem/root cause/conclusion), linking back to its map
```

- **Structure tree** = the **shape** of the project's real code (dirs/modules/entry points/inheritance chains), objective and checkable. It's the base map for "anchor-first": before filing a new memory, come here first to check "where in the code is the thing it's talking about." Build it by scanning the code at the first consolidation, then update it incrementally.
- **Root** = one per repo. Lists all modules (branches).
- **Branch (map)** = one per code module. Describes **how this module works (core logic) + who it connects to (tentacles)**.
- **Leaf (event)** = one concrete thing (bug/decision/judgment). **Every leaf must declare `module map = [[its branch]]`**, otherwise it's an orphan.

Running `../tools/check-tree.sh` verifies: every leaf links back to a map, every map is in the root's index, and there are no orphans.

---

## The underlying logic of the tree structure: anchor-first

Categorizing / deduping / attaching is hard because it's easy to **invent categories by gut feel**. A more robust approach = **each memory's address is "derived," not "invented"**:

- **Where it goes = where its "anchor" is, anchored to the most specific objective structure** — the ladder: **has code → anchor to code** (root = repo, branch = code module `src/sync/`, leaf = an event about some piece of code); **no code (design phase) → anchor to the design doc / spec** (the planned system/feature); **neither → anchor to a domain concept**. A design-phase memory first anchors to the design, then migrates once the code exists. → Replace "subjective categorization" with "locating within the most specific objective structure."
- **Duplicate or not = anchor + assertion** — talking about the same thing + saying the same thing = duplicate → **merge**, don't create a new one.
- **Branch or leaf = the scope of the anchor** — a whole module's core logic → branch (map); a specific problem/decision → leaf (event).

**In one sentence: first ask "which thing in the code is it talking about," not "which category does it belong to."**

> (Knowledge that can't be anchored to code — e.g. cross-module decisions, user preferences — uses a "domain concept" as its anchor; it's still locate-first, then file.)

---

## Adding a new memory: the decision process (follow it, don't go by gut feel)

When you learn something worth recording:

1. **Find the anchor** = which concrete thing is it talking about? **Prefer to locate it in the real code** (some file/module/system); **if there's no code yet, locate it in the design doc / spec**; if neither, use a domain concept. Don't invent your own category.
2. **Check for duplicates (anchor + assertion)** = search existing memories with the **same anchor**:
   - Same anchor + same thing → **update/merge the old one**, don't create a new one;
   - Same anchor + a different thing → create a **sibling**;
   - Brand-new anchor → create a new one.
3. **Set the level** = look at the anchor's scope: whole-module core logic → **map (branch)**; one specific thing → **leaf (event)**.
4. **Attach**: a leaf declares `module map = [[its map]]`; a new branch gets registered into the root's module index; the raw conversation for a key decision → bloodline-log number + a `🩸conversation▸N` index in the leaf.
5. **Do a no-contradiction pass**: does it logically clash with any existing memory? If so → fix the newer one (by time) to be correct (see `../no-contradiction-when-writing-memory.md`).
6. **Verify**: run `../tools/check-tree.sh`.
