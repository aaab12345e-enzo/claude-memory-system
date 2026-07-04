---
name: growth-memory-refine-on-mistake
description: "【Growth memory · meta-layer · the base engine of my self-iteration】Two triggers (making a mistake = reactive / discovering the structure can't hold up the workflow = proactive) · two functions (① refine errors: fix the corresponding hook/notation ② optimize structure: improve the memory system's three-category division/index/logic-chain completeness/weights), write back to habit (1)/execution (2) to make them more concise and effective"
metadata: 
  node_type: memory
  type: feedback
  category: growth
  weight: 4
  originSessionId: ""
---

**The third of the three memory categories · growth memory** (user 2026-06-25). Full panorama of the three categories:
- **Habit memory** (action-triggered) = [[habit-action-hooks]] (chain of hooks by workflow stage)
- **Execution memory** (topic-triggered) = organized by [[memory-topic-by-project-structure]] + weighted retrieval via [[memory-weighting-rule]]
- **Growth memory** (mistake-triggered) = this entry (meta-layer)

**= the "base engine" of my self-iteration** (user 2026-06-25 emphasized: not a side thing). **Two functions**:

**① Refine errors (reactive)**: every mistake (repeated error / communication ambiguity / self-contradiction / hallucination / corrected by the user) → fix the corresponding **hook and notation** on the spot (habit [[habit-action-hooks]] / execution [[memory-topic-by-project-structure]]), aiming to be **more concise and effective** (merge what should be merged, trim what should be trimmed, delete what should be deleted—leaner and sharper with use, not fatter and bloated).

**Error classification table ("pest classification" · user 2026-06-25 · insight 1)**: every mistake **first gets slotted** into one category (only then can it converge, reveal which category is high-frequency, and be reinforced accordingly):
1. **Requirement-goal error** — didn't understand what the user wants (read-requirement stage).
2. **Execution-module error** — found the wrong project/module/file (structural positioning went astray, e.g., mixing up same-named concepts across different projects).
3. **Event-logic error** — the specific step's logic was wrong.
4. **Memory-itself error** — the map/memory recorded it wrong, and led me astray (**most fatal**, links to insight 4 map health-check).
- **Can't fit into these 4 → add a new category**: propose a new "pest species," **mark it "incomplete · pending user confirmation" and keep flagging it**; it doesn't count until the user confirms (self-growth can add categories via errors, but should be rare; adding many = the classification design has a problem and warrants reflection).

**★ Self-question → self-resolve · the four-step loop (added by the user 2026-07-04: self-growth must have an explicit "ask yourself → resolve it yourself" process, logged end to end)**. Executing ① and ② both go through these four steps — no "fix it in one jump and call it done". Triggers: making a mistake / getting corrected / the end of daily consolidation / the structure can't hold up / **when giving a memory weight +1** ([[memory-weighting-rule]] §5b):
1. **Self-question** — write the problem down as text (not just run it through your head). **The first question attributes internal vs. external**: **internal cause** = my memory's form wasn't enough to stop it (→ only then talk form upgrades); **external cause** = it recurred only because the external code/reality changed (things like the team changing the code recur naturally — not a form failure → update the body as a version turnover + tag ⚡volatile, no form upgrade). For an internal cause, ask further: which category does this error fall into (the four pest categories above)? The rule was right there in the library — why didn't it stop me in that moment? Was the memory missing / the memory wrong / the loading not done right / the soft constraint leaking again?
2. **Self-check** — chase evidence with the question in hand: read the code, read the bloodline's original words, read the pitfalls; **never answer your own question from impression** (same as [[verify-against-ground-truth-not-theory]]).
3. **Self-resolve** — change things per the evidence: fix hooks / fix structure / adjust weights; **any rule that can be turned into a mechanical right/wrong check gets hardened into a hook and handed to the overseer first** (see [[memory-system-architecture]] §0 hard mechanisms — takes no headspace, never misses). Can't resolve it → park it in [[pending-review]] or the OPEN log; don't pretend it's resolved.
4. **Log it** — write the whole "problem → self-question → evidence check → answer → change" into `conversations/events/记忆模型优化.md`, tagging the entry **[introspection]** (sharing the same log and the same numbering as the [user dialogue] entries; one fact one place, no separate file) → later re-reads get a complete "case history": what I thought at the time, what evidence I checked, whether the fix was right.
- Example: "the guardrail hook was configured but never fired" → self-question "why didn't it fire" → live-test three writes → answer "PostToolUse's plain output never reaches the model context" → hardened by switching to additionalContext injection.
- At the end of each daily consolidation, check "are any [introspection] entries left hanging unresolved" (hooks into the closing steps of [[daily-memory-consolidation]]).

**② Optimize structure (proactive)**: not just patching errors—proactively **improve the whole memory system's structure** (three-category division / hook-chain organization / indexing method / relationships between memories). **Trigger = spotting a signal that "the structure can't hold up the workflow,"** examples (given by the user):
- **The topic's record form is insufficient** (missing fields / wrong structure, e.g., an execution memory not tagged project-module-event, a module without a built map);
- **The topic's logic chain is incomplete** (breaks in project-module-event-logic-chain, can't connect to the workflow);
- **The topic's form + content weight is insufficient to hold up the workflow** (memory not rich enough / weight too low, can't drive actual work);
- etc.
→ On discovery, **upgrade that topic's record form / complete the logic chain / adjust the weight** so it's enough to hold up the workflow. This session's "three-category memory framework + staged hook chain" restructuring itself = ② (proactively optimizing structure, without waiting for a mistake).

**= self-iteration engine**: error/reflection → distill the pattern → write back to 1 (habit)/2 (execution)'s hooks, notations, **and even the overall structure**. This session has already run: `project confusion → [[memory-topic-by-project-structure]]`, `all-English output → [[translate-english-in-output]]`, `didn't read memory and re-asked → a high-weight hit means read the full text`, `three-category framework restructuring (② optimize structure)`.

**Division of labor (obey [[no-contradiction-when-writing-memory]], avoid overlap/contradiction with the below)**: this entry = **on-the-spot refinement per mistake** of "how the system records" (hooks/notations/meta-rules); [[daily-memory-consolidation]] = **periodic** bulk cleanup of "the content already recorded" (merge, dedup, remove contradictions). One iterates the system, one maintains the content.
