---
name: memory-system-architecture
description: "Memory system architecture (agreed by user + me 2026-06-26): memory DB (the full set on disk = authoritative persistent state) / working memory (context = disposable cache); topics = locality → the working set stays small; three triggers (boundary consolidation / scheduled consolidation / capacity-forced eviction) maintain the working set; iron rule flush-before-evict. Goal = don't hallucinate from an over-long context, so windows can be opened and closed at will with no loss"
metadata:
  node_type: map
  category: habit
  tag: feedback
  weight: 3
  originSessionId: ""
---

**The overall architecture of the memory system** (hashed out and locked with the user on 2026-06-26). It governs "how memory gets loaded into context in real time, and under what conditions it gets released." It threads through [[daily-memory-consolidation]] (consolidation = the write-back engine) / [[memory-topic-by-project-structure]] (topics = locality) / [[memory-two-layer-roles]] (the DB's layering) / [[habit-action-hooks]] (write-back hooks) / [[checkpoint-key-memory-after-each-task]] (immediate write-back).

## 1. Layering (like cache/DB)
- **Memory DB** = all the .md files on disk = **authoritative persistent state** (complete, large).
- **Working memory** = the current context = **disposable cache** (small).
- **Topics = the principle of locality**: precisely because there are `project-module` topics, at any given moment what's actually in use is just "the current topic + the resident rules" → **the working set is naturally small**.

## 2. Loading (narrow loads — only load what should be loaded)
- **Resident · pinned**: the `MEMORY.md` index (a lightweight table of contents, so I know what exists) + the habit-hook chain + the high-weight ⚑ error-avoidance principles. That is, the habit-hook chain is **inlined in full, directly into the resident `🪝 Habit Memory · Action Hooks` table at the top of `MEMORY.md`** (user 2026-07-01: **habit memory = my thinking habits, they should live in my head every single day**, not reference material to be looked up on demand). ⚠️ **Blood lesson: writing "resident" in a doc is only nominal** — previously the hook chain lay in the [[habit-action-hooks]] file and MEMORY.md only hung one pointer line relying on "read it first," so whenever I "forgot to read," I'd miss it. True resident = the actual text goes into that index which auto-loads every time, not relying on "remembering to look it up." Habits = a bounded small set (≤ a few dozen entries), and each one must always trigger → the whole chain should indeed be inlined (as opposed to "execution/topic" memory, which is voluminous and paged in on demand).
- **On-demand · topic paging**: the pre-thinking hook identifies the `[project-module]` → demand-loads that module's map + related events + that project's OPEN log; on a topic switch, unload the old and load the new (LRU). Normally only the index is resident, not the body text.
- **Growth memory**: the high-weight general error-avoidance ones = resident; the specific situational entries are loaded by risk "when I'm about to do something like an old mistake" and released once it's over.
- **Chat-window data**: the current conversation = actively resident (it *is* the context itself); the historical dialogue-log = cold storage, loaded by time range only when resuming across sessions or checking last time's decision.
- **Event bloodlines (`conversations/events/<slug>.md`) = pure chronologically-numbered logs**: hit a `## feature point` inside a leaf → follow the `🩸 dialogue ▸ N` entries hung off it and **load exactly those few by index** (see [[memory-topic-by-project-structure]] event template · log + index). **Large files no longer rely on "read the latest N entries"** — they rely on precise index retrieval, so even old decisions won't be lost as long as the index points at them (this plugs recency ≠ importance). Conversations whose topic is cross-session memory itself = a dedicated log `记忆模型优化.md` (same numbering + indexed by the meta-memory).

## 3. Maintaining the working set = three triggers (write-back + release)
| Trigger | When | Action |
|---|---|---|
| **Boundary** | Window data is **segmented along the timeline**, at segment boundaries (topic/timeline switch) | Run **consolidation** (write back to DB + merge, dedup, remove contradictions) |
| **Scheduled** | Periodic | **Scheduled consolidation** (clean up even when no boundary was crossed, to catch slow drift) |
| **Capacity** | Working memory exceeds a threshold | **Forced release** (consolidate and write back first, then drop) |

## 4. The iron invariant: flush-before-evict (write back first, release second)
**Release is conditional on already having persisted to the DB — never drop un-written-back dirty data.** The capacity trigger especially guards this: over threshold → consolidate first → only then force-release. **Write-back discipline = the crux that makes the whole thing lossless and makes "never close the window" hold** (miss a write-back → the summarizer squashes the conversation and it's truly gone).

## 4.2. How to handle the chat-window context = markers + garbage designation (forced out of me by the user on 2026-06-27)
**The chat-window context (this ongoing conversation) = the one and only block in working memory that has no disk backstop** (everything else can be re-pulled from the DB on demand; only the live conversation lives solely in context). Handling = **a chain of three**:
1. **Lay down a marker**: after finishing tidying (checkpoint direct-write / consolidation) → record at a fixed spot "**tidied up to here @ time / last log number**." The marker = the dividing point: before it = already tidied, after it = the untidied tail.
   - ⚑ **Iron rule (user 2026-06-30): never place the marker on the very latest task — only up to "the one before the latest," and there must always be at least one task left after the marker (the live tail is non-empty).** Placing it all the way (covering the latest / everything) causes bugs, and it will infinite-loop. ★ **Even if the latest task has already wrapped up, leave one outside the marker** (user stressed: "even if it's wrapped up you still leave one, otherwise it'll infinite-loop") — it's not "only leave in-progress tasks," it's **leave one unconditionally**. Reasons: ① the latest task may not truly be finalized yet, kept as a "post-marker live tail" safety net; ② **harder: marker covers everything = live tail empty → infinite loop** (each round of tidying would swallow the previous round of tidying itself as garbage, with no anchor to resume from, so it self-loops). So when advancing the marker, **always leave the single latest task after the marker**; the marker only reaches the one before it.
2. **Before the marker = garbage, don't reason over it**: the **raw conversation** before the marker is designated as "garbage" — **don't touch it when reasoning, trust only the tidied-up memory library** (that it physically still hangs around in context **doesn't matter**, the head is big enough). ⚡ **Core**: hallucination/ambiguity comes precisely from "recalling/distilling against a long stretch of messy raw conversation" (the longer it is the more I cross wires and treat half-baked reasoning as conclusions); the tidied memory is deduped, contradiction-free, finalized → **trust only the clean memory and throw the raw long text aside as garbage = cut off the hallucination source**. (User: "even what's loaded into your head, you can still define it as garbage — just don't process it.")
3. **Doesn't fit → drop garbage first**: when the capacity trigger fires, follow the harness's "squash the oldest first" (the garbage is exactly the oldest stretch) and drop the already-tidied garbage before the marker; the premise is still **flush-before-evict** (that stretch was persisted to the DB before dropping). **It all comes down to how diligently you tidy** — only if tidying falls behind and the compression frontier catches up to "the untidied tail" will anything truly be lost.

**When to flush + advance the marker (user 2026-06-28)**: the normal path = **at a task boundary (after pushing), tidy that whole task's context once** (hung under [[habit-action-hooks]] post-push ②) — **don't flush frequently**: tidying too often churns the workspace and chops a single in-progress task's context into pieces (you want a single task's memory to stay intact). Failsafe = **scheduled** (early-morning scheduled consolidation) + **capacity** (harness lossy compression over threshold) as backstops. That is: **the main tidy point = task completion; scheduled/capacity are only backstops.**
> Key realization (user corrected me): don't fixate on "physically deleting the prior text from context" (you can't delete it within the same window) — this is about **designating authority**, not physical deletion: before the marker, trust only the memory library and treat the raw conversation as garbage. Whether it's physically there or not doesn't matter.

## 5. Payoff (why do it this way)
- The working set stays small → **no drift/hallucination from an over-long context** (this is correctness, not just saving resources).
- The window = a disposable cache → **open it when you want, close it when relevant**; when closing, consolidation has already filled the DB, no loss; a new window losslessly reloads the small working set from the DB.
- Capacity trigger = **failsafe**: if boundary/scheduled consolidation falls behind, the hard threshold still backstops with forced cleanup, guaranteeing we never enter the "too long → hallucinate" zone.
- ⚠️ What I control is **loading discipline** (proactive Read/recall, narrow-loading by topic) + proactive write-back; evicting the live conversation is done by the harness summarizer (lossy) → so **the more diligently I write back, the less it hurts when the summarizer drops details**.

▸ **Bloodline = the cross-session memory log**: `conversations/events/记忆模型优化.md` (pure chronological numbering `[1][2]…`; content in a conversation that **changes my memory/habits/behavior** is checkpoint-written directly there; meta-memory like this architecture uses `🩸 dialogue ▸ N` to index entries, and on a hit retrieves them precisely by index).
