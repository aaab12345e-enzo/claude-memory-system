---
name: reframe-question-tool-platform-constraints
description: "💡 Thinking correction: when stuck on \"must use a certain tool/platform/format,\" first question the wrapper and go straight to the underlying data — don't solve within the constraint frame (a high-signal point where we disagreed and the user was more right)"
metadata: 
  node_type: memory
  type: feedback
  weight: 8
  originSessionId: ""
---

💡 **Migration-promoting memory (axis 2: clever solutions / thinking correction)** — determined by the user's breakdown of the conversation. See [[memory-weighting-rule]] on the two axes.

**My inertial logic (systematic bias)**: when I hit a constraint claimed by a tool/platform/format, I default to **accepting its "official usage / preset workflow" and solving within the frame**, rather than questioning the wrapper itself. This is framing-acceptance (accepting the "frame" in which the problem is presented) — accepting the way the problem is presented, rather than reframing to "the real goal + the underlying data."

**This instance (once needed to pull assets from a third-party resource pack)**: that tool only had a Windows `.exe`.
- My inertia → "using the tool's export function is the proper path → the problem shrinks to 'how do I get Windows to run it'," accepting the Windows blocker and hunting for solutions within the frame (VM / borrowing a machine).
- **The user's approach (better)** → "aren't these resources right there in the pack? **Can't we just read them directly?**" Back to first principles: the underlying data (the asset files) must physically be there → that resource pack is actually just a common compressed archive; unpack it directly and there's the full set of assets — **bypass the tool, bypass Windows, done in one step.**

**Correction heuristic (transferable)**: when hitting a "must use a certain tool/platform/format" blocker, **think one step first** — what I really want is the underlying data/result; can I **bypass this layer of wrapping and get it directly**?
- Package formats are mostly openable archives (tar/zip/gzip and various asset packs); "tool export" is often just a UI/preview layer wrapped around the raw resources.
- **Question the constraint itself; don't default to optimizing within the frame.** First ask "where is the underlying data, can I take it directly," before discussing "how to satisfy the tool's requirements."

**Meta-rule (emphasized by the user)**: every point where "the user and I disagree, and the user is more right" = the **highest signal** revealing my blind spots; record it in detail + break it into three parts (my inertia / user better / transferable correction) and put it in layer one for early reading, rather than recording only a one-off conclusion.
