---
name: memory-topic-by-project-structure
description: "Layer-1 memory topics are named by 'project structure' project-module-[event]; one map per module (core logic chain + tentacles, see [[module-maps]]), events only record problems/judgments/pitfalls + link back to the map; matching is done by project + module, unique hit → read the map + events, no full hit / multiple hits → must confirm first. Cures cross-project confusion of same-named concepts across different projects"
metadata: 
  node_type: memory
  type: feedback
  weight: 3
  originSessionId: ""
---

A **structured memory-retrieval rule** the user set on 2026-06-25, to cure the mistake I keep making of "misattributing same-named concepts across projects"—mixing up concepts that share a name across two different projects (e.g., the same source-file name exists in both projects but refers to two completely different designs).

**Topic naming = `project-module-[event]`** (refined by the user 2026-06-25):
1. **Project** — each independent codebase/product counts as one project.
2. **Module** — the subsystem it belongs to (e.g., `<module-a>` / `<module-b>`… within a project). **Each module has one "map" memory** = core logic chain + the wires (tentacles) to surrounding modules; the code is largely fixed, only updated when a special event changes the core logic. See the list in [[module-maps]].
3. **Event** — the specific thing done under that module (e.g., `<module-a>-[some change]`). **Event memories only record that instance's problems/contradictions/errors/summary/judgment + link back to the module map**, never repeating the design.
4. **Layer-2 associations** (derived from the project): each project → its own open-issues log / `pitfalls/`.

**💡Field-layer model + anti-bloat merge rule (user 2026-06-26, inferred from the skill pipeline's "hooks = leaf nodes of the trigger tree")**: below the module tree, **leaf = field**; among fields, **enum fields (e.g., some enum definition carrying type/source) = the most frequently changed + most logically complex hub**, because they **cross-branch associate** (the enum definition lives on another branch, and adding/removing/changing an enum value ripples to every branch that consumes it). **Merge rule**: an event that lands on "field CRUD" → **merge into the module map, don't make it a standalone leaf** (keep the tree from bloating); only an **enum-field hub** (cross-branch, change one place and everything moves) is worth **a standalone leaf + high weight + drawn tentacle wires**. → When pruning/merging leaf events: compress bulk field-CRUD events into the map, only chase the enum hubs. Extending [[module-maps]]'s "core logic + tentacles" = the tentacles mostly grow on enum fields.

## ★Event template = leaf (conclusions + index) + bloodline (pure chronological log) as a pair (user 2026-06-27 finalized · log+index architecture)

One event = **a pairing of two files**, the classic "**log + index**": the log is dumb and complete, the index lives in the leaf.

**📄 Leaf `project-module-event.md` = conclusions + index**: decisions/finalizations/root causes/judgments, **deduplicated, iterated, maintained to the latest** (= what to believe now). **Each `## feature point` heading carries a set of dialogue entry-number indices** `🩸dialogue decision▸N · process▸M,…`, pointing to the few entries in the bloodline that produced it. The end still carries `▸ bloodline: conversations/events/<slug>.md`.

**🩸 Bloodline `conversations/events/<slug>.md` = pure chronological dialogue log**: **numbered `[1][2]…` by time, pure record, uncategorized** (decision or process, the classification is left to the leaf's index; the log just stays dumb, pure, complete). Each entry = 🗣️user's original words + 💬my understanding/action.

**🔒 Two iron rules**: ① **No repetition**—for the same decision, the leaf stores "the verdict maintained to the latest," the bloodline stores "the user's original words + why"; leaf = current truth, log = provenance, don't copy them twice (you can't draw a blueprint from conclusions alone, the log fills in "how it was talked out at the time"). ② **When trimming, only cut my own words**—every 🗣️user original sentence is **kept in full without exception**, only 💬my words can be trimmed (I keep making the mistake of "over-distilling and eating the user's original words").

**✍️ How to write = checkpoint direct-write**: every time a chunk is done / a decision finalized, **on the spot**—append a numbered entry to the bloodline, update the corresponding leaf `##` index entry numbers. **Don't** pile up one giant whole-session file and sort it out afterward; the `conversations/<date>.md` whole-session giant file is redundant and can be retired.

**📥 How to load = precise fetch by index**: on a hit of some `## feature point` → follow its `🩸dialogue▸N` and **load only those few entries** (decision entries + process entries), no need to read the whole bloodline. **Replaces "read the latest N entries of the big file"**: fetch precisely by index, a decision won't be lost no matter how old it is as long as the index points at it (blocks recency≠importance).

**🌐 Cross-session topics (e.g., memory-model optimization) = one dedicated log**: for topics whose dialogue is scattered across multiple sessions (optimizing my memory/habits) → build **one cross-session memory log** `conversations/events/memory-model-optimization.md` (checkpoint direct-write, accumulate across sessions, numbered); its "leaves" are **distributed across multiple meta-memories**, each carrying `🩸dialogue▸N` indices pointing into it, **not searched around by filename**. Criterion: changes to **my memory/habits/behavior** → memory log; changes to **code/data** → work-event log.

**Matching protocol (when some field in the dialogue hits a topic)**:
1. Match by **project + module** (+ event).
2. **Unique hit** → read that **module map** (get the all-around structure) + relevant event leaves + layer-2; **on a hit of some `## feature point` in a leaf → follow its `🩸dialogue▸N` index, load precisely those few original entries from the bloodline log** (user 2026-06-27 log+index), and answer/act accordingly.
3. **No full hit / multiple projects or modules hit** → **must confirm first** (don't guess which project/module and just act).

**Why**: the same concept is two different designs across two projects—e.g., some mechanism (say, some logic of some module) belongs only to one of the projects, and in the other project's corresponding module this whole thing is completely N/A. Matching without the "project" dimension keeps getting it wrong (I've misattributed same-named concepts many times).

**File-header classification (user 2026-06-25 · two schemes merged into one)**: **main classification** = ① `category`: habit/execution/growth ② `node_type` (tree position): root / trunk / map (branch) / event (leaf). **The old `type` is demoted** → renamed `tag`, **kept only on leaves (events)** (value = project/feedback/reference/user, **for reverse lookup**: tree health-check / searching by tag); **root/trunk/branch carry no tag**.

**How to apply**: ① write **new** memories named by `project-module-[event]`; module core logic goes into the **module map**, events only get **problems/judgments/pitfalls + link back to the map** ② when retrieving, first align by project+module, not just keywords ③ on ambiguity (no full hit / multiple hits), confirm immediately. Continues [[memory-weighting-rule]]'s "a high-weight hit means read the full text" + [[translate-english-in-output]]; this entry governs **disambiguation along the project/module dimension + confirm on multiple/no hit**. ⚠️For old memories, **split into "map + event" opportunistically whenever you touch a module**, not in bulk (see [[module-maps]]).
