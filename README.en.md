# Claude Persistent Memory System

*[中文版 → README.md](README.md)*

> 🤖 **Are you an AI agent adopting this system? Read [AGENTS.md](AGENTS.md) first** (the agent-facing bootstrap). This file is the human-facing intro.

A **file-based persistent memory system** for an AI coding assistant (Claude Code and similar agents). It lets the agent keep knowledge across sessions and context compaction, without losing it and without hallucinating when a conversation gets long. Everything is plain markdown on disk — readable and writable by both human and AI.

> This wasn't designed top-down. It grew, one entry at a time, out of a real project — refined every time the AI hit a pitfall or got corrected. All contents here are sanitized: no real project code, server addresses, credentials, or personal data.

---

## Understand it in 30 seconds

An LLM's context is **volatile**: long windows get lossily compressed, and everything is gone when the session closes. This system pushes what matters onto disk and treats the context as a **disposable cache**, so that:

- new sessions **resume losslessly**;
- no matter how long the context, only "current topic + always-resident rules" is loaded → the working set stays small → no drift, no hallucination;
- knowledge stays **deduplicated, contradiction-free, and traceable**.

There is a single entry file, **`MEMORY.md`**, loaded automatically every session. It carries a **habit-hook table** (the AI's "thinking habits") + high-weight error-avoidance rules + an index of topic trees.

---

## How to use it (works out of the box)

1. **Take `MEMORY.md`** and put it where your agent **auto-loads context every session** (in Claude Code, that's the memory index / `CLAUDE.md`-style file that gets read in).
2. **Point the agent at this folder as its "memory DB"** — tell it: long-term knowledge lives here as `.md` files, and `MEMORY.md` is the index.
3. **The immediately useful part = the habit-hook table.** As soon as the agent reads it, it has a workflow discipline (clarify ambiguity before starting, confirm the plan before acting, file outputs by date, consolidate memory after a task, …). This part is turnkey — no setup needed.
4. Then you and the agent **grow it together**: add project topic trees, add pitfalls you hit, have it run the daily consolidation.

> In one line: **load `MEMORY.md` → the habit hooks kick in immediately → grow your own memory DB as you go.**

> **First run**: the first time the agent loads this for you, it will **open the habit-hook table and walk you through it hook by hook** (see the "🚀 First run" note at the top of `MEMORY.md`), so you can tune it to your own workflow instead of inheriting someone else's. **For English-speaking users**, the agent opens the English habit memory instead: [`HABITS.en.md`](HABITS.en.md).

---

## ★ Habit memory: the living core — you edit it, and it grows itself

Habit memory = the **action-hook table** at the top of `MEMORY.md`: ordered by workflow stage (read-requirement → think → execute → push → consolidate); at each stage the AI automatically runs the matching actions. **Because it's the AI's "thinking habits," it must stay resident** — carried in every thought, never parked in another file to be "looked up when needed" (that's how it gets missed).

**It is not a static checklist. It is a system meant to be continuously edited, and to grow on its own:**

- **You edit it.** The hooks below are a **starting template** — add / remove / reorder to fit your own workflow. This is the part you'll touch day to day.
- **It grows itself.** Together with "growth memory," the AI **turns every mistake / correction into a new hook, or a fix to an existing one**, and folds it back into this table. The longer you use it, the more these "thinking habits" fit you and the fewer times it repeats the same mistake.

> In other words: the other modules are the skeleton and the rules; **habit memory is the part that's always moving and gets more comfortable the more you use it.** For a new user, this is the thing to nurture.

---

## The other modules (methodology, in brief)

These are the foundation under habit memory — understand the principle; you won't touch them daily:

- **DB / working memory (like a cache)**: all `.md` on disk = authoritative persistent state (large); the current context = disposable cache (small). Iron law **flush-before-evict**: write back to disk before releasing anything — never drop unsaved data.

- **Execution memory (topic-triggered)**: project knowledge is organized as a `project-module-event` tree; each module gets one **logic map** (core logic + outward "tentacles"), and specific events only record "problem / judgment" and link back to the map. Only the relevant slice is loaded on a topic hit.

- **Growth memory (mistake-triggered)**: every mistake is **immediately** refined into an error-avoidance entry; it's the fuel that makes the habit hooks "grow themselves."

- **Weighting**: each entry has a `weight`; +1 whenever a related task errs or repeats; retrieval reads high-weight first. Two axes: ⚑ avoid-error / 💡 promote-insight. High weight ≠ correct — when it conflicts with a newer entry, the **newer one wins**.

- **Daily consolidation**: once a day — write back un-saved conclusions from the window → merge / dedup / re-weight the whole library → **reconcile contradictions** (check against code / newer-wins) → re-sort the index → push backup → open a fresh workspace. The core goal = **the library stays internally consistent and contradiction-free**.

- **Long-conversation handling = marker + garbage-labeling**: the conversation context is the only part with no disk backup. After consolidating, drop a **marker** (a split point); the raw conversation before the marker is **labeled "garbage"** — don't reason over it, trust only the consolidated library (this cuts off the hallucination source); if it won't fit, drop that garbage first. Iron law: the marker always leaves the latest task outside it (otherwise it self-loops).

- **Two layers**: layer 1 = memory the AI distilled (backed by ground truth in code); layer 2 = the user's process instructions + an **open-issues log** + key conversation records, as a safety net under layer 1.

---

## File layout

```
MEMORY.md                      # Resident index (the only auto-loaded entry; holds the habit-hook table)
<rule>.md                      # One memory per file, with frontmatter
conversations/events/<slug>.md # Event "bloodline": a purely chronological numbered log [1][2]…; leaves index into it via 🩸conv▸N
pitfalls/<date>-<task>.md      # Pitfall archive (historical record, not rewritten)
tools/                         # Validation scripts (e.g. "logic map vs code" health check)
```

Each memory's frontmatter:

```markdown
---
name: <kebab-case-slug>
description: <one line, used to judge relevance on recall>
metadata:
  type: user | feedback | project | reference
  weight: 1
---

Body; cross-link with [[other-slug]] to form a graph.
```

---

## License

The methodology / docs are free to reference and adapt. All contents are sanitized — no real project code, server addresses, credentials, or personal data.
