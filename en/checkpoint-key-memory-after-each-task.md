---
name: checkpoint-key-memory-after-each-task
description: "As soon as you finish a chunk of substantive work, immediately write one key-info memory; don't save it all for the end, so a new window can pick up losslessly"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: ""
---

As soon as you finish a chunk of **substantive work** (filled in a batch of data / changed a piece of logic / pushed a commit), **immediately write one key-info memory** — don't hoard it until the end of the session. A work habit the user set on 2026-06-16.

**Why:** Over a long window, the conversation gets auto-summarized into a blur, and **decisions** plus "what I just did / why I did it this way" are the first things to get lost; dropped into a memory file, they survive across windows. That way, the moment a new window opens, reading MEMORY.md picks up losslessly, without me having to re-feel my way through the code/context again. This follows on from the "land decisions to files immediately, be willing to reopen windows" approach discussed this morning.

**How to apply:** When a unit of work wraps up (especially anything touching multi-file changes / a push / a settled decision), spend a sentence or two writing "what was done and the conclusion, why, and the next step or who it's handed to" as one memory (project or reference type), and add a pointer line in MEMORY.md. Criterion: does the next window taking over need to know this? If yes → write it; if it's already findable in the code/git, don't duplicate it. Keep it short, don't write a long document ([[comm-style-chat-not-docs]]).

**When landing a new memory, tidy the old ones on the way — don't only add, never prune:** before writing, scan the related old memories; if any are stale/conflicting, update or delete them on the spot (example: an old memory said "based on some old version" and "some item pending decision" — conflicting with the new fact, it would drag a new window back into the pit, so it was deleted). Only adding and never deleting → the memory store grows longer and more self-contradictory, which is one of the very roots of "memory gets messy once the window gets long." Related: [[flag-obvious-contradictions]].
