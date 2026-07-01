---
name: claude-classifier-blocks-agent-privileged-actions
description: "Pitfall iron rule: the Claude Code safety classifier blocks the agent's autonomous/privileged actions (editing its own memory · exporting memory outward · self-privilege-escalation) — these must be run by the user manually, don't work around it"
metadata:
  node_type: memory
  type: feedback
  weight: 2
  originSessionId: ""
---

**Pitfall iron rule: some actions where "the agent touches its own config/memory OR escalates its own privileges" are guaranteed to be blocked by the Claude Code safety classifier — don't try to work around it, just have the user do it manually in the terminal.**

The three categories already hit (twice on 2026-06-17 + once before, hence the weight bump):
1. **Auto-editing memory (unattended)** — using a background scheduler (e.g. launchd) plus approval-off `claude -p --permission-mode acceptEdits` to run background memory consolidation, blocked as "unauthorized persistence + an autonomous agent loop with the approval gate off." → Memory consolidation can only be manually triggered.
2. **Pushing the `~/.claude` memory tree to an external repo** — using `gh repo create … --source ~/.claude/.../memory --push` to directly create a repo from the local memory directory and push it outward, blocked as "memory exported outside the trust boundary." → Have the user push manually in the terminal.
3. **Writing permission rules for yourself** — Write/Edit'ing rules into `permissions.allow` in `.claude/settings.json` (even if the user verbally says "I'm granting you permission"), blocked as "unauthorized self-privilege-escalation." → Permission rules must be written into settings **by the user themselves**.

**How to apply:** When you hit something like "edit the agent's own memory/settings, turn off approval, export a local sensitive directory outward," **expect it to be blocked** — don't retry over and over, don't hunt for a crooked workaround (that's abuse); at the first moment, hand the user "the one command that needs running / the one config line that needs adding" and let them execute it manually. This is a reasonable safety boundary, not a lack of cooperation. Related: [[daily-memory-consolidation]], [[api-overload-retry-cadence]].
