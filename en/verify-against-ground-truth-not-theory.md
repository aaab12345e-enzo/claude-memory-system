---
name: verify-against-ground-truth-not-theory
description: "When I have an authoritative source in hand (data / resource files / client code / bundled preview images = ground truth), for any 'is this right?' question, just hold it up against that source and there's the answer — don't spin on theory. The user praised my self-reflection + the core idea I gave"
metadata: 
  node_type: memory
  type: feedback
  weight: 2
  originSessionId: ""
---

**User's core idea**: "you have the resources, you have the data, you have the client code — finding a solution should be a very simple thing."

**Trigger scenario (once doing a coordinate-system / handedness conversion, agonizing over whether flipping some axis would mirror)**: I **spun on theory for a long time** over "would flipping this axis mirror it / does swapping that axis change handedness" (tied myself in knots, and nearly changed it wrong again). The correct move was the one the user praised — **directly pull up the preview image bundled with the resource (ground truth) and put my render side by side with it**: all the features on the same side → immediately confirms "no mirroring, this axis is right," case closed in a second.

**Why**: for this task I had a **complete set of authoritative sources** in hand: ① the resource file + bundled preview image (= ground truth for correct orientation) ② the binary data itself ③ the existing client code (how it assembles). Having ground truth and not using it, instead relying on geometry/handedness theory to deduce right-or-wrong = putting the cart before the horse, both slow and easy to tie myself in knots.

**How to apply**: when facing "is my version right / which solution should I use" — **first ask 'is there an authoritative source I can compare against directly'**: bundled preview image / original render, config/binary data, real logic code, or just run it and look at the result. **If there is, immediately go compare / go run it (empiricism), don't deduce it in my head.** Reasoning is only for "no ground truth to compare against." Especially for handedness/coordinates/mirroring/orientation and the like — things "easy to tie yourself in knots over in theory" — **always prefer real testing.**

Extends from [[reframe-question-tool-platform-constraints]] (question the wrapper · take the underlying data directly) and [[premature-abstraction-and-overdistill]] (jumping ahead to abstraction sacrifices validate-first). Same family: [[flag-obvious-contradictions]].
