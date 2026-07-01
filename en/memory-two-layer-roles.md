---
name: memory-two-layer-roles
description: "💡Memory layering is a division of responsibility/ownership, not merely of granularity: layer 1 = my distilled facts (backed by code truth, not set by one word from the user); layer 2 = the optimization/gap-filling layer (takes the user's process instructions + resolves what layer 1 can't handle or loses, especially the communication ambiguities between you and me)"
metadata:
  node_type: memory
  type: feedback
  weight: 1
  originSessionId: ""
---

💡 The **real meaning** of memory layering (user 2026-06-20 correction). The point is **not** that "two questions" thing, but the **memory communication ambiguity between you and me** — to systematically reduce it, you have to see clearly each layer's responsibilities.

## Layer 1 vs. layer 2 = a division of responsibility/ownership (not just granularity)
- **Layer 1 (distilled memory / MEMORY.md index + distilled facts) = my layer**. Its rules **shouldn't be stuffed in directly by the user saying "because I say so"**; they must be backed and earned by **code truth + my distillation/experience**. This is the layer I "own and act on."
- **Layer 2 (`pitfalls/` + dialogue records + open-issues log + memory-process rules) = the optimization/gap-filling layer**. Responsibility: **resolve what the first layer handles poorly, can't handle, or lost/got wrong during distillation** — the most typical being the **communication ambiguities** between you and me (like "two questions" being dropped by the distillation layer, exactly what the open-issues log is there to catch). The **memory-process instructions** the user gives (how to record, how to align) land here.

## Corollaries
- Dialogue records — a "user-defined process rule" like this → **always in layer 2, never into layer 1**. Layer 1 is not "the user's word goes"; layer 2 is where the user's direct instructions are received and the system is optimized.
- Layer 2 is layer 1's **safety net**: layer 1's distillation is lossy, layer 2 keeps the more raw record + the fix, catching the lossy/erroneous parts.
- **Boundary (settled by the user 2026-06-20)**: the criterion is **not** "was it said by the user," but "**does it govern domain work, or the memory system itself.**" → **domain/work preferences (how to collaborate with the user: [[comm-style-chat-not-docs]] communication style, English-with-Chinese annotations, date folders, md-not-PDF…) stay in layer 1** (they're stable facts about the person the user is, which I act on); **process rules of the memory system itself (how to record / how to align) go into layer 2**. So the few existing user-preference feedback entries in layer 1 **don't sink down, they stay put**.

## 💡 Three-part breakdown (my habit → user's better take → correction)
- **My habit**: treating the two layers as merely "distilled vs. detailed / loaded vs. on-demand" — a purely **information-granularity** layering.
- **User's better take**: the two layers are a **responsibility/ownership** layering — layer 1 is mine (backed by code + distillation, not decreed by user fiat in one word), layer 2 is the optimization layer (filling what layer 1 can't handle, especially communication ambiguity).
- **Correction**: the user's memory-process rules all go into layer 2, never into layer 1; layer-1 rules can only be earned by code truth / my distillation, they can't be installed directly by "one word from you." **To change my behavior, go through layer 2 (the optimization layer) first; only after verification/distillation can it settle into layer 1.**

Related: [[daily-memory-consolidation]] (how the two layers are handled in consolidation), [[memory-weighting-rule]] (💡 axis), [[flag-obvious-contradictions]].
