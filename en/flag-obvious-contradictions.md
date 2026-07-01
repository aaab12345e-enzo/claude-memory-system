---
name: flag-obvious-contradictions
description: "When filling in data / doing logic, proactively spot and notify the user of \"obvious contradictions/inconsistencies\"; don't just plow through to the end having found nothing"
metadata: 
  node_type: memory
  type: feedback
  weight: 2
  originSessionId: ""
---

Whether you're **filling in data** or **doing logic**, whenever you hit an **obvious contradiction / mismatch, notify the user proactively at the first moment** — don't plow all the way through the current state "having found nothing."

**Why:** The user raised this explicitly on 2026-06-16 (while wrapping up, dead tired). This time I took an **outdated schema** someone gave me and spent a whole day filling in config; without checking proactively I never noticed it didn't match the current authoritative definition at all (missing columns, fields landed in the wrong place), and in the end **someone else caught it first** — a big pointless detour, and I'd even mistakenly overwritten data. It could all have been avoided with one line up front: "this table doesn't match the authoritative source."

**How to apply:** Do consistency checks proactively before + during the work and put the suspicious points on the table:
- Does the source table / given data ↔ authoritative schema (authoritative field set) line up?
- Do data ↔ code match (field names, mechanics)?
- Is the file I got the latest version (check the time/source/version, don't assume "what was given is correct")?
- Same id / same concept with two implementations? Conflicting concurrent changes?
When you find a contradiction, **stop and flag it**: "X and Y don't line up — confirm which one we go with?" — better to ask one extra question than to silently assume one side is right and run on.
