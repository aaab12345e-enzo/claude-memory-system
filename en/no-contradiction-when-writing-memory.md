---
name: no-contradiction-when-writing-memory
description: "【#1 habit · action-triggered = writing any memory (add/delete/change)】Before acting, always check: additions/changes must not create a logical contradiction with existing memory (contradicting each other). Repetition is a breeding ground for contradiction → dedup along the way, one fact one authoritative place"
metadata: 
  node_type: memory
  type: feedback
  category: habit
  trigger: writing memory (Write/Edit on files under memory/: add/delete/change)
  weight: 4
  originSessionId: ""
---

**The user set this on 2026-06-25 as "the single most important habit"** (he first said "repetition," then immediately corrected himself to **"logical contradiction"**—contradiction is deadlier than repetition: if the library holds two memories that contradict each other, I'll act on the wrong one). Belongs to **habit memory** (category=habit, **action-triggered**, not topic-triggered).

**Trigger action**: adding / deleting / changing **any** memory content (Write/Edit on files under `memory/`).

**Reflex (do this every time you write memory)**: before acting, confirm the addition/change **doesn't logically contradict existing memory**—the library must not simultaneously hold two memories that contradict each other:
1. Before writing, **search existing memory first** (prioritize same topic, same project);
2. If the new content **contradicts** some existing one → **first check the code/facts to determine which is right**, correct that one ([[memory-weighting-rule]]§4: by fact / by which is newer in time), **never leave two mutually exclusive versions**;
3. **Repetition is the breeding ground of contradiction** (the same fact scattered in two places → later you change one and miss the other = contradiction) → dedup along the way, **one fact one authoritative place**.
4. **"No leaf grows on a leaf" (user 2026-06-25 · insight 3)**: to write a new event on the **same topic** as an existing event → **you must first prune/merge the old leaf, never let two same-topic leaves coexist**. A topic slot allows only one living leaf; before a new leaf grows up, the old leaf must be gone (coexistence = the root of contradiction).

**Why**: logical contradiction makes the memory library **actively harmful** (I'll act on the wrong one). This is the precondition for 1 (habit) and 2 (execution) to be usable—if the library contradicts itself, no amount recorded matters.

**Division of labor (so this entry doesn't repeat/contradict them)**: [[memory-weighting-rule]]§4 = **how to fix** after finding a contradiction (the newer-in-time one wins); [[daily-memory-consolidation]] = **periodically** de-contradict and dedup the whole library; **this entry = catch it at every write** (prevent contradiction on the spot at the point of creation/change). The three differ in granularity and complement each other.

**Strongest form = a hook**: attach a PostToolUse hook to Write/Edit under `memory/` → after writing, inject a "verify no logical contradiction" reminder (deterministic trigger point, I can't forget it); the semantic judgment is still mine. ⚠️Changing my own settings to attach a hook may be blocked by the safety classifier → go through the update-config skill or have the user set it manually ([[claude-classifier-blocks-agent-privileged-actions]]).
