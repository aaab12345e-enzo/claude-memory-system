# Memory Index

> 🤖 **AI agent picking up this system for the first time → read [AGENTS.md](AGENTS.md) first** (startup steps for the agent: how to mount it as a resident index, how to walk the user through the habit hooks). Don't just read the file and stop there.

> This is the **resident index**: the single entry point auto-loaded every session. Core rules + the full habit-hook table + high-weight error-avoidance principles + the directory of every topic tree. One memory = one `.md` file; this file holds only "one-line pointers + resident rules", not long bodies.
>
> Below is the **anonymized template skeleton** — it shows the structure, and the project/module names in the examples are placeholders (`<project>` / `<module>`).

> 🚀 **First run · AI must read.** **If this is the first time you're loading this system for this user → don't rush into the work yet.** Open the "🪝 Habit Memory · Action Hooks" table below and **walk the user through it one hook at a time**: read each hook out to them, ask "do you want this one? want to change it?", edit or drop whatever doesn't fit, and turn it into **their own** workflow. Once confirmed, start working. From then on, follow the table directly every session — no more hook-by-hook confirmation.

> 🔖 **Cursor.** **Consolidated up to bloodline [N] @ <date> <trigger>.** The cursor only answers "how far the library has caught up" — one line max, **never restating task content**; **the current task → the ★ zone at the top of the OPEN log (the single authority system-wide; cursor/leaves only point at the past, never copy it)**. Resume rule: original dialogue **before** the cursor = trash (trust only the memory library), **after** it = the unconsolidated tail, read it normally. (The old iron rule "always leave the latest task outside the marker to avoid the infinite loop" has been retired now that the task pointer is separated out — see [[memory-system-architecture]] §4.2.)

> 🆕 **Read first in a new window · layer-2 open issues.** Every time you open a new workbench, first read the log that records only OPEN items: `open-issues-<project>.md`. Update it during daily consolidation, and confirm with the user before finalizing.

> **Core rule · weighting.** Each memory carries a weight (base 1); a related task that errors/repeats gets +1; when using memory, read high-weight first (the bigger the ⚑N, the easier it is to crash). High weight ≠ correct — when it conflicts with a newer memory, the newer one wins. Two axes: error-avoidance ⚑ / migration-promoting 💡. Full text in [[memory-weighting-rule]]; saying "daily cleanup" = [[daily-memory-consolidation]].

> **System architecture.** DB (the full set on disk = authoritative) / working memory (context = discardable cache); topics = locality → the working set stays small; three triggers (boundary / scheduled / capacity) maintain the working set; iron rule flush-before-evict. Long conversations = the three-marker chain (drop the cursor → treat everything before the cursor as trash, don't reason over it → when it won't fit, drop that first). **Three-layer re-homing (2026-07-04)**: ① structure layer (tree + leaves + bloodlines, **conclusions only, forever**) / ② maintenance layer (daily consolidation + criteria + overseer hooks + the self-growth loop; touches ① only during consolidation) / ③ run-state layer (the one-line cursor + the current task at the top of the OPEN log + the working set); ⚑ core discipline = **state lives only in ③; expirable things like "next step" never get written into ①'s files**. Full text [[memory-system-architecture]].

> **Three kinds of memory.** **Habit** (action-triggered) = the action-hook table below [[habit-action-hooks]]; **execution** (topic-triggered) = organized per [[memory-topic-by-project-structure]], one [[module-maps]] logic map per module; **growth** (mistake-triggered) = [[growth-memory-refine-on-mistake]]. ⚑#1: [[no-contradiction-when-writing-memory]] (no contradictions + dedup · one fact, one place).

## 🪝 Habit Memory · Action Hooks (⚑ resident = thinking habits, fired at each work stage as you hit it)

> **These are the AI's "thinking habits", carried in every thought → the whole table stays resident here** (don't stash it in another file to "flip to when needed" = you'll miss it). Deep details can link out to their own standalone entries (`[[xxx]]`); this table only goes as far as "the action to take".
>
> ★ **This table is alive, and it's the one part of this system you must tend to every day**:
> - **① You edit it** — the rows below are a **starting template**; add / remove / reorder to fit your own workflow.
> - **② It grows itself** — paired with "growth memory", **every time the AI makes a mistake / gets corrected by you, it distills the lesson into a new hook or revises an old one** and folds it back into this table. The longer you use it, the better it fits you and the fewer repeat crashes.

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
| **After pushing** | ① produce the doc; ② **task-level consolidation = flush**: write back the bloodline (numbered log) + update the leaf's `🩸conv▸N` index + **advance the cursor** (only update the one line "consolidated up to bloodline [N]") + **update the ★ current task at the top of the OPEN log** (the sole write point for the task pointer; never write it into the cursor/leaves). |
| **Memory consolidation** | **#1 don't create logical contradictions** (+ dedup · one fact, one authoritative place); periodic whole-library de-contradiction = the daily consolidation; on a real conflict, the **newer** entry wins (check against code / by time). |

## System mechanics (read these to understand the principles)

- [System architecture](memory-system-architecture.md) — DB / working memory + three triggers + flush-before-evict + markers/trash classification.
- [Two-layer memory](memory-two-layer-roles.md) — layer 1 = the AI's distillations / layer 2 = the user's process instructions + the OPEN-issues log as backstop.
- [Topics organized by project-module-event](memory-topic-by-project-structure.md) — the tree structure of execution memory + on-hit loading.
- [Logic maps](module-maps.md) — one "core logic + tentacles" map per module; event leaves link back to the map.
- [Growth = distill on mistake](growth-memory-refine-on-mistake.md) — the engine that feeds the habit hooks' "self-growth".
- [Habit hooks (downgraded shell)](habit-action-hooks.md) — the body is already inlined into the table above; this file keeps only the notes.

## ⚑ High-weight · read first to avoid errors

- ⚑9 [Weighting](memory-weighting-rule.md) — the meta-rule: weights + read high-weight first + resolve conflicts by recency + two axes (error-avoidance ⚑ / migration-promoting 💡).
- ⚑8 [Daily cleanup](daily-memory-consolidation.md) — land the window + merge/dedup/reweight + on contradictions check the code and fix the newest; core = a contradiction-free library.
- ⚑ [#1 No contradictions](no-contradiction-when-writing-memory.md) — write no logically contradicting memory + dedup · one fact, one place.
- ⚑ [Confirm the plan before acting](confirm-plan-before-acting.md) — for non-trivial tasks, first work through "understanding + logic flow + ambiguity points", confirm, then act.
- ⚑ [Flag contradictions proactively](flag-obvious-contradictions.md) — when data/logic obviously don't line up, flag it immediately; don't just plow ahead.
- ⚑ [If you have ground truth, test it · don't spin theories](verify-against-ground-truth-not-theory.md) — when you have the data / real code in hand, on a "is this right?" question just pull it up and compare.
- ⚑ [Question tool/platform constraints · go straight to the underlying data](reframe-question-tool-platform-constraints.md) — when stuck on "must use this tool/format", first question the wrapper, bypass it, and get the underlying data.
- ⚑ [Don't fabricate framings · diagnose systematically](dont-fabricate-framing-be-systematic.md) — when stuck, honestly say "not located yet"; don't paper over it with an external attribution.

## Regular (weight 1)

- [Land a memory after each chunk you finish](checkpoint-key-memory-after-each-task.md) — the moment you finish a real piece of work, land the key memory; don't save it all for the end.
- [Explore the leaf · graft upward onto an existing home](explore-leaf-skeleton-first.md) — a new need with no parent branch → trace the real code structure upward to an existing home; can't find one = three-layer triage (typo / dead branch / request-semantics).
- [Tendency to over-engineer / over-couple](tendency-overengineer-overcouple.md) — when you catch yourself over-designing, self-check "really needed, or just looks safe?"; default to the simplest thing that works.
- [Premature abstraction / over-distillation](premature-abstraction-and-overdistill.md) — don't race to "clean/abstract" at the cost of "verify first / stay faithful"; rules are distilled after execution, not predicted.
- [Self-privilege-escalating actions get blocked by the safety classifier](claude-classifier-blocks-agent-privileged-actions.md) — an agent editing its own config / exfiltrating / running an unattended autonomous loop gets blocked → hand it to the user to run manually.

## Examples · feedback-type memory (records your "user's" preferences — swap in your own)

> The entries below are **examples** of "how to collaborate with your user", shown for format; please replace them with your own user's actual preferences.

- [Be blunt when you should, don't over-hedge](blunt-frustration-not-polite.md) — when the user causes the waste themselves, skip the over-politeness; bluntly naming the problem + its cost is more effective.
- [Read user input word-for-word · lightly flag typos](read-user-input-carefully-flag-typos.md) — on a suspected typo/ambiguity, lightly confirm on the spot; don't silently guess.
- [For non-native / non-technical users, explain terms inline](translate-english-in-output.md) — a term used as a word gets an inline gloss; code identifiers don't need translating but don't pile them up densely.
- [Communicate in chat, don't dump long docs](comm-style-chat-not-docs.md) — short, conversational, group-chat-pasteable; don't dump long markdown.
- [IDE chat links won't open](vscode-chat-links-dont-open.md) — some IDE chat panels can't open file links → give clear paths.
- [Overload retry cadence](api-overload-retry-cadence.md) — server overload = a queue, not a quota; retry on a cadence and don't let the user think they need to pay.

### 🌳 Memory tree (example: one tree per project, root → branch [map] → leaf [event])

> Project knowledge looks like this (the example below is **made up**, not a real project):

- 🌲 **Root** `<project>-root` — project identity + development iron rules + index of each branch.
- 🌿 **Branch · <module>** `<project>-<module>` — that module's logic map (core logic + tentacles).
  - 🍃 **Leaf** `<project>-<module>-<event>` — a specific event (problem / root cause / judgment, linking back to the map).
