---
name: tendency-overengineer-overcouple
description: "Growth · I repeatedly tend toward over-engineering / over-coupling / over-hedging, and the user repeatedly pulls me back to the simplest option, which turns out more correct. Before acting or proposing, self-check: is this classification · dependency · fallback · abstraction genuinely needed, or am I manufacturing complexity to 'look safe'? Default to the simplest thing that works"
metadata:
  node_type: memory
  category: growth
  tag: feedback
  weight: 3
  originSessionId: ""
---

**Pattern**: I tend to add "seemingly safe" extra structure/dependencies to a proposal, or **go straight for the most complex solution right off the bat**, and the user repeatedly cuts it down to the simplest option / try-the-simplest-first — which turns out more correct.

- **Example 1 · over-engineering**: Once, for a "coexistence cap" requirement, I designed it by bucketing per type (borrowing semantics from somewhere else) → user: "why such a weird design, drop it, don't classify by type, just cap on a single total count." The actual constraint could never reach a scale that would require bucketing → the buckets were pure overkill.
- **Example 2 · over-coupling**: Once, for a change, I said "we need to wait and do it together with a coworker's cleanup elsewhere" → user: "whether the coworker cleans that up or not has nothing to do with our change, right?" Correct — what we're changing is a new field, the old code can stay as dead code without any effect; I **manufactured a fake dependency**.
- **💡 Example 3 · wrong complexity ordering**: On a conversion/migration task, I **went straight for gnawing on the most complex solution** (full matching, a big roundabout, and the result was awkward too). The user called it out: "logically, intuitively, you **solve the simple-and-effective ones first, then try the complex ones**; going straight for the most complex matching right away is exhausting just to think about." In the end **the winner was precisely the simplest one**. **Correction: facing a problem, first lay out the spectrum of solutions from "simplest-and-effective" to "most complex," and try from the simple end; if the simple end works, stop. Don't preemptively rush the complex end, and don't do it first just because complexity looks "more thorough."**
- **(Reverse reference · don't overcorrect)** I've also under-built (under-designed): once I chose an ad-hoc (makeshift) solution to save code, and the user insisted a cleaner state machine was the right call. So it's not "always go simple," it's **find the right size + start trying from the simple end**.

**Correction / self-check (ask myself before acting or proposing)**: is this **classification / dependency / fallback / abstraction** **genuinely needed**, or am I piling on complexity to "look safe"? **Default to the simplest thing that works**; complexity should be **forced out by the requirement**, not piled on preemptively. The user's judgment on the "right size" is repeatedly more accurate — when unsure, lay both the simplest version and "the layer I want to add" in front of him to choose. For the same family of thinking corrections, see [[reframe-question-tool-platform-constraints]] and [[growth-memory-refine-on-mistake]].
