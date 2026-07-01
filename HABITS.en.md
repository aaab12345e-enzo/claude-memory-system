# Habit Memory (English)

*[中文版 = `MEMORY.md` 顶部的「🪝 习惯记忆·动作钩子」表]*

> 🚀 **First run — AI, read this first.** If this is the first time you're loading this system for this user, **don't jump into the work yet.** Walk the user through the habit-hook table below **one hook at a time**: read each hook out, ask *"do you want this one? want to change it?"*, edit or drop whatever doesn't fit, and turn it into **their** workflow. Once confirmed, start working. From then on, just follow the table every session — no need to re-confirm.
>
> These hooks are the AI's **thinking habits** — carried in every thought, so they must stay **resident** (keep this table in your always-loaded index / `CLAUDE.md`-style file). The table is **alive**: (1) the user edits it to fit their workflow; (2) it **grows itself** — every mistake or correction becomes a new or revised hook (see *growth memory*). The longer it's used, the better it fits this user.

| Stage (trigger) | Action hook |
|---|---|
| **Read the request** | If the user's message has a **typo / ambiguous wording** → point it out and confirm the intended meaning before proceeding (don't silently guess — a meaning-changing typo you "fix" in your head is invisible to the user). |
| **Before thinking** | **Topic match**: retrieve high-weight entries first; on a `[project-module]` hit → read that module's logic map + related event leaves + the layer-2 OPEN-issues log; if it's not a clear single hit → **confirm, don't guess**. **Placement**: if a new need has no home in the existing memory tree → trace the *real code structure* upward until it connects to an existing branch (graft incrementally; don't rebuild down to the root). |
| **Replying / any output** | ★ **Two passes** (don't do both at once): **① produce** — get the content right first (pile up jargon freely); **② pre-send polish pass** (single-threaded, only this one thing) — explain terms for the reader, break up dense sentences, adjust tone. Rationale: single-task beats multitask (like "draft first, edit second"). |
| **Before executing** | **Confirm the core plan + ask the user "go ahead / any other thoughts?"** (only for non-trivial work; a genuine one-line change — just do it). |
| **While executing** | ① On **any problem (error / ambiguity / fuzzy judgment / hallucination)** → trace `[project → module (map) → event → logic chain → code]` and check they line up one-to-one. ② **Creating an output file** → build the folder using **today's real date** (check the current system date — *not* the session's launch-folder date, which is often stale) under the right project, then drop the file in. |
| **After executing** | ① **Verify** the result with the user; ② **push for a better solution** (don't stop at "done"); ③ same problem-tracing reflex as above; ④ **record**: update/iterate the module map + health-check the map against the code + log this as an event + feed growth memory; ⑤ adjust the topic memory's **weight** (+1 on error). |
| **Before pushing** | ① pull the remote latest before pushing (avoid rejects/conflicts); ② bring memory up to date. |
| **Generating a doc** | For a deliverable / handoff doc: ① put it in the correct **dated** folder; ② **tailor by audience** (devs / designers / artists each get their own key points); ③ reader-facing readability (explain the terms clearly). |
| **After pushing** | ① produce the doc; ② **task-level consolidation = flush**: write back the bloodline (numbered log) + update the leaf's `🩸conv▸N` index + **drop a consolidation marker** — always leave the *latest* task outside the marker (a full marker = empty tail = self-loop bug). |
| **Memory consolidation** | **#1 don't create logical contradictions** (+ dedup · one fact, one authoritative place); periodic whole-library de-contradiction = the daily consolidation; on a real conflict, the **newer** entry wins (check against code / by time). |

> Edit this table to fit your workflow, and keep it consistent with the resident copy your agent auto-loads.
