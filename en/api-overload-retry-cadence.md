---
name: api-overload-retry-cadence
description: The wait-and-retry cadence for when you hit API overload (529 / a tool blocked as unavailable by the safety classifier)
metadata: 
  node_type: memory
  type: feedback
  originSessionId: ""
---

> Example · feedback-type memory: this is a sample of "recording your user's preferences" — swap it out for your own user's actual preferences.

When you hit API overload (529 Overloaded, or a tool temporarily blocked as unavailable due to the safety classifier), the default cadence: **the first time, wait 20 minutes before continuing; after that, try once every 10 minutes**, until it recovers.

**Why:** overload is a temporary server-side queue, unrelated to the user's quota (don't make the user go top up their balance); frequent retries just flood the screen and burn cycles for nothing — a fixed cadence is more economical.

**How to apply:** use a scheduled-wake/wait mechanism to set the wait (about 1200 seconds the first time, 600 seconds after), and carry the specific task to retry in the prompt. Each time you wake, first run a read-only probe to confirm whether the tool has recovered, then do the write operation. Before it recovers, don't keep retrying write operations back-to-back.
