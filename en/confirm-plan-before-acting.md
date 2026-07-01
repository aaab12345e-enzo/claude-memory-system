---
name: confirm-plan-before-acting
description: "User workflow iron rule: on any task, first check the plan/logic flow and mutually confirm before touching anything, to eliminate ambiguity-driven rework"
metadata: 
  node_type: memory
  type: feedback
  weight: 3
  originSessionId: ""
---

User workflow iron rule (2026-06-23, stressed twice in one day → high weight): **on any problem, first check the plan (at least the logic flow), and only start once we've mutually confirmed.** This isn't "ask only when unclear" — it's **defaulting to walking through the plan first**, because "clear to me ≠ no ambiguity," and ambiguity is the root of rework.

**Why (two layers)**: ① **Prevent rework** — I have an "just do everything I can up front" inertia, and some work is basically "done blind" (the tools can only validate without erroring, they can't show the actual effect); the two stacked → I slap it all together in one go, but in the wrong direction, forcing large-scale rework (example: built out A, B, and C all at once, only for the user to want a different combination, tearing the whole thing down). ② **Produce a better solution** (user added, 2026-06-23) — plan discussion is **two-way optimization**, not just seeking approval: sometimes I have the better approach, sometimes the user does, and **the discussion can improve it further still**; walking the plan first = merging both sides' good ideas in before touching anything, which beats heads-down copying either side's first draft.

**How to apply**: before touching anything, give the user three things and **stop and wait for their confirmation** before writing code:
1. **My understanding** (what to do, how far the scope goes)
2. **Logic flow / plan** (how to implement it, which files it touches, how data/control flow moves)
3. **Key decision points / ambiguities / forks**

Only a truly one-line mechanical tweak can be waved through with "I'm going to do X, okay?"; everything else walks the plan first. **When giving the plan, proactively raise the better solutions I see (with trade-offs), don't passively copy the spec; also leave room for the user to improve my plan — treat it as a design conversation, not a signature request.** You can use plan mode (EnterPlanMode→ExitPlanMode) to lay the plan out for approval before executing. For self-verifiable changes, extra: verify it yourself with a glance before handing it over, don't use the user as your eyes. Same root as [[comm-style-chat-not-docs]] and [[flag-obvious-contradictions]]: the user wants to stay in the decision loop throughout.
