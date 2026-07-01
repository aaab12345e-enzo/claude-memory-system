---
name: explore-leaf-skeleton-first
description: "💡Exploration iron rule · habit-hook topic execution · placement (user, 2026-06-27): when a leaf can't find its parent branch in the existing tree → check the real code and climb up to its 'existing placement' (incremental grafting, not building to the root). Can't find it = three-tier triage: typo → rotten branch (check sibling branches · mark for pruning) → genuinely can't connect to the root (requirement/semantics problem · call it out bluntly with heat). Root yourself in real code/words throughout, don't hallucinate"
metadata:
  node_type: memory
  category: habit
  tag: feedback
  weight: 2
  originSessionId: ""
---

**Hangs off the [[habit-action-hooks]] hook chain · topic execution** (action-triggered).

## Iron rule (trigger → action → recursion)
- **Trigger point**: a requirement/leaf whose corresponding **parent branch can't be found in the existing memory tree** (placement missing, that area is still dark).
- **Action**: **don't hallucinate a classification** → go **check the real code structure**, find who its parent is (the class name).
- **Recurse upward**: if that parent **also has no placement in the existing tree** → **keep going up** (one level higher in the code) → **climb until you find the correct 'existing placement'** (connecting back to some already-existing node in the existing tree); establish skeleton placeholders for any intermediate nodes missing along the way.
- ⚠️**It's not "build to the root every time"** — it's **climb to the nearest existing placement and stop** (incremental grafting, don't rebuild the whole lineage). That's how the tree grows out from the leaf upward, anchoring node by node onto existing nodes.

## How to dig (code = the only authority)
- **Finding the parent upward**: read the class's inheritance declaration (each language's own parent-class declaration syntax) to get the parent; read the **loader** (who gets require'd/registered = live) + find the system/manager class that operates on it.
- **At each level up, ask**: does this level **have a placement in the existing memory tree?** Yes → graft, stop; no → skeleton placeholder, keep going up.
- After connecting back to the existing tree, the core logic of the newly created intermediate nodes along the way can be **placeholder-pending** (skeleton first, don't rush to draw the full picture; follows [[premature-abstraction-and-overdistill]] concrete-before-abstract).
- ⚑**Don't hallucinate a classification = wild guessing**: I once nearly agonized over "is this new requirement a leaf or a branch" purely by hallucination, and the user called it out: what's missing is a branch/trunk, the hierarchy is unknown, so go check the real code structure and graft upward.

## What to do when you can't find it = three-tier triage (check the cheap stuff first, rooted in real code/words, don't hallucinate)
> ⚑The "the root is always the floor's 'abstract base case'" idea is a wrong hallucination (user rejected it 2026-06-27); the real situation is only the three below, **escalate from cheapest to most expensive**.

- **① Typo? (cheapest · check first)** — the user often mistypes, and a single typo makes the word not match and the whole trail come up empty. → **Gently confirm/correct first**, it often clears right up. Follows [[read-user-input-carefully-flag-typos]].
- **② Walked onto a "rotten branch"? (wrong code path)** — "can't find it" is often from climbing a **dead/broken branch (rotten branch) that wasn't pruned in time**, which never connected in the first place. → **Go back and check the same module for other branches** (don't hang yourself on one rotten branch); if you've exhausted the module's branches and still nothing → **mark this rotten branch + remind the user whether to prune it** (mark "unfinished," **wait for their decision**, don't prune on your own authority).
- **③ Genuinely can't connect to the root? (all branches exhausted, still won't connect)** — then it's **not a code problem, it's a requirement/semantics problem**. → **Re-understand the requirement's semantics**; still can't connect → **call it out bluntly with heat**: "there's a problem with your requirement, it's burned a stack of tokens for nothing" or "I don't get what you're saying, spell it out" — **don't be limply polite** (follows [[blunt-frustration-not-polite]]: politeness he won't remember).

## Byproduct: often catches contradictions
When reverse-checking code to stand up a skeleton, you often bump into **stale comments / multiple coexisting copies / mislabeling** in passing (example: a comment somewhere says "X inherits A," when actually X inherits B and the A file no longer exists = fossil comment). → With [[flag-obvious-contradictions]], flag it on the spot.

Structure rule [[memory-topic-by-project-structure]]. Same-root deviation [[premature-abstraction-and-overdistill]].
