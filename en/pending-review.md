---
name: pending-review
description: "[Pending review] Things that came up in conversation but can't currently be verified against / matched to specific code — dump them here first; verify, file, or clear them out during the next memory consolidation."
metadata:
  type: reference
  weight: 1
---

# Pending review

During memory consolidation, **project-related content that can't currently be verified / matched to specific code** → dump it here first, **don't force it into the memory tree** (to avoid building the wrong anchor and creating contradictions).

> ⚠️ **Design-phase content doesn't count as "pending":** if it can be verified against a **design doc / spec**, then it's grounded → it goes straight into the tree (anchored to the design), don't dump it here. This bucket only holds genuinely dangling content that **can be verified against neither code nor design**.

**At the next consolidation**, re-verify each item:
- Now verifiable against code → file it into the tree per [anchor-first](examples/README.md) (build a leaf / update the map);
- Confirmed useless / off-topic → move it into [`trash.md`](trash.md);
- Still not verifiable → leave it, check again next time.

Format: one item per line, `- [date] one-sentence content — why it can't be verified right now (missing code / missing info / needs confirmation)`.

(empty)
