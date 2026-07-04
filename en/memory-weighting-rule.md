---
name: memory-weighting-rule
description: "【Core rule】the memory weighting scheme — read high-weight (error-prone/recurring) first; high weight ≠ correct, and when it contradicts an ordinary memory, correct the high-weight memory by the more recent one"
metadata: 
  node_type: memory
  type: feedback
  weight: 9
  originSessionId: ""
---

**The memory weighting scheme (set by the user 2026-06-17 as a core rule, in effect for all memories):**

**1. Every memory carries a "weight"** —— stored in the frontmatter `metadata.weight`, with a **base value = 1**; and annotated in the MEMORY.md index line with `⚑N` (so it's easy to read first).

**2. When weight goes +1** —— whenever a task related to that memory **has gone wrong / is logically similar / has recurred**, +1. The more a topic is one I step in repeatedly, run into repeatedly, or easily get wrong, the higher the weight. (Ones pre-seeded high: a module I misconfigured twice, a mechanism I keep getting wrong, a field whose authority I got burned on + kept being talked out of, an iron rule I keep violating — all of these get high weight directly.)

**3. Read order** —— every time I use memory, **read the high-weight** batch first and act on them preferentially (they're the points most likely to blow up).

**3b. Hitting a topic = must read the full text (set by the user 2026-06-25, origin at the end)** —— when the user's message **hits a topic** (a named project/system/old code/some mechanism), especially matching a **high-weight topic memory with weight > 2**, before answering I **must open and read that whole memory file's body + the second-layer logs it links to**; I **may not** answer purely from that one-line description in the MEMORY.md index, or from impression, or re-ask about things already recorded. Just "knowing this memory exists" doesn't count — I have to actually read it in before answering. **The index description only suffices to judge "whether to read the full text," not to answer from directly.**

**4. Conflict correction (key — don't blindly trust high weight)** —— high weight **only means "I often go wrong here, watch it closely," not that it's automatically correct**. **If a high-weight memory logically contradicts an ordinary memory, the "more recent" one wins**, and accordingly **rewrite the high-weight memory's body to make it correct** — but **keep its high weight** (keep watching it).

**5. Maintenance action** —— when a topic goes wrong / recurs again: give the corresponding memory `weight+1` (edit the frontmatter) + update MEMORY.md's `⚑N` annotation. New memories default to weight=1; an obviously error-prone topic can be given high weight directly.

**5b. ★ Weight +1 = an introspection trigger point (set by the user 2026-07-04; hooks into [[growth-memory-refine-on-mistake]]'s four-step loop)** —— the moment of the +1 must carry the self-question "why did this entry fail to stop me again," and **the first question attributes internal vs. external**:
- **Internal cause** (my memory's form wasn't enough to stop it) → upgrade the form via the three-way split: rewrite the body so it blocks better / cross-topic and process-like in nature → promote it into a **habit hook** / the judgment can be mechanized → **harden it into an overseer hook** ([[memory-system-architecture]] §0). A memory whose weight keeps climbing gets forced by this mechanism to change form — it doesn't climb forever.
- **External cause** (it recurred only because the external code/reality changed — things like the team changing the code recur naturally; that's not a form failure) → update the body to current reality as a "version turnover," and tag the entry **⚡volatile** (= a topic that must be checked against the current code before use; volatile ≠ I was wrong).
- Both cases still get the +1 as usual (weight is the "watch this topic" signal, independent of attribution); but **only an internal cause triggers a form upgrade** — upgrading the form over an external cause is wasted effort.

**6. Two axes (2026-06-19 user extension): weight is not only for "avoiding errors" but also for "promoting transfer."**
- **Axis 1 · anti-regression (error avoidance)** = `⚑`, reactive —— a topic that recurs as an error gets +1 (points 1–5 above); the more likely to blow up, the higher, read first to prevent regression.
- **Axis 2 · transfer promotion (clever solution / thinking correction)** = `💡`, proactive —— a non-obvious solution that unlocked a stalemate, or **my habitual reasoning getting corrected** (especially the point where "**the user and I disagreed and the user was more right**"), **enters the first layer on creation**. Why it can't rely on axis 1: a breakthrough/correction happens only once and will never "recur as an error" → it can never get +1 → relying on axis 1 alone would leave it **forever sunk in the second layer and forgotten** (exactly the structural blind spot the user pointed out).
- **Axis 2 discipline**: ① it must be written as a **transferable heuristic (a reusable pattern)**, with the concrete instance serving only as an example, not just recording a one-off fact (instances go stale, patterns can be reused); ② at the point of disagreement, **record in detail and break it into three parts**: my default/habitual reasoning → the user's better reasoning → the transferable correction.
- First 💡: [[reframe-question-tool-platform-constraints]].

**Why:** as the window gets long, memory easily gets jumbled, and just "having memory" isn't enough — the experiences most likely to make me blow up need to be **seen first and kept watched** (axis 1), and the scarce clever solutions / thinking corrections need to **not get buried and to be transferable to new scenarios** (axis 2); meanwhile timestamps backstop against an old high-weight memory leading me astray. Works with [[checkpoint-key-memory-after-each-task]] (when to write memory), [[flag-obvious-contradictions]] (fix contradictions as soon as found).
