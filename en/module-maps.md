---
name: module-maps
description: "【Execution memory · skeleton】The list of each project's 'module logic maps' (project→module). For now only names are listed; map contents aren't drawn in advance, they're filled in and iteratively optimized gradually during each task (user: open it up slowly, no rush). Event memories link back to the corresponding module map"
metadata: 
  node_type: memory
  type: project
  category: execution
  weight: 2
  originSessionId: ""
---

**List of module logic maps** (user 2026-06-25: for now only list names; map contents are **filled in / iterated / optimized during behavior**, not drawn in advance, no rush).

**Rules**:
- **One map = one module's core logic chain + the wires (tentacles) to surrounding modules**; the code is largely fixed, **only updated when a special event changes its core logic**.
- **Event memories** (named `project-module-[event]`) only record that instance's **problems / contradictions / errors / summary / judgment**, **link back** to the corresponding module map, don't repeat the design.
- Usage: **first time working in a module → build/fill in its map**; afterward top it up and iterate opportunistically each task (a wrong map is the dangerous thing, a wrong event is nutrient).

## `<project-a>` (client project)  root=[[project root map]]
✅**Built maps** (example): `<module-a>` · `<module-b>` · `<module-c>` · `<module-d>`
⏳**To be built** (fill in while working): the remaining several subsystems (e.g., some logic of some module), filled in one by one during behavior.

## `<project-b>` (server project)  root=[[project root map]] (contains the full framework)
✅**Built maps** (example): `<module-a>` main pipeline · `<module-b>` · `<module-c>` · `<module-d>`
⏳**Placeholder branches to be built**: the remaining several subsystems, filled in one by one during behavior.

**(Each map to be filled in one by one during behavior; for old memories, split into "map + event" opportunistically whenever you touch a module, not in bulk.)** For naming/retrieval structure see [[memory-topic-by-project-structure]].
