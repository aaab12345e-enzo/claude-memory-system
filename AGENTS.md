# AGENTS.md — AI agent, read this first

You are an AI coding agent (e.g. Claude Code) and a user has pointed you at this folder and asked you to **use / adopt it as their persistent memory system**. This file is your bootstrap. **Do not just read the files and stop, and do not silently reorganize anything** — follow the steps below.

*(This file is the agent-facing bootstrap; the human-facing intro is in [README.md](README.md).)*

## What this is

A file-based persistent memory system. It ships in **two languages** — pick one:

- **`zh/`** — 中文 (default; this system was built in Chinese)
- **`en/`** — English

Each folder is a complete, self-contained copy. Inside it, the single entry point is **`MEMORY.md`** — an index that also contains the **habit-hook table** (the workflow "thinking habits" you follow every session). Every other `.md` in that folder is one memory.

Below, wherever it says `<lang>/`, substitute `en/` or `zh/` per the user's language.

## Bootstrap — when the user says "use this memory system"

Do these in order, and **confirm with the user before editing any of their config files**:

0. **Pick the language.** Detect the user's language from how they talk to you → use **`zh/`** (Chinese, default) or **`en/`** (English). If it's some *other* language, translate the `zh/` folder (the Chinese original this was built from) into their language once (as part of setup) and work in that. From here on, "`MEMORY.md`" means `<lang>/MEMORY.md`.

1. **Make `<lang>/MEMORY.md` load every session.** This system only works if it's in your *always-loaded* context — otherwise the rules sit on disk and never fire. Ask the user where their agent auto-loads context (for Claude Code that's usually the project's `CLAUDE.md`, or user-level memory). With their OK, add a line there that imports/points to `<lang>/MEMORY.md` (or move that folder to the load location).

2. **Run the first-run onboarding.** Open the habit-hook table at the top of `<lang>/MEMORY.md` and walk the user through it **one hook at a time**: read each hook, ask "keep this? change it?", edit or drop whatever doesn't fit. Make it *their* workflow, not a stranger's.

3. **Confirm the memory DB.** Tell the user plainly: "from now on I'll save long-term knowledge as `.md` files in `<lang>/`, and `<lang>/MEMORY.md` is the index."

4. **Then start working** — and from here on, follow the habit-hook table every session.

## Ongoing (after bootstrap)

- **Every session**: read `<lang>/MEMORY.md`; follow the habit-hook table.
- **New project knowledge** → organize as a `project → module → event` tree; one logic map per module. See `<lang>/memory-topic-by-project-structure.md` and `<lang>/module-maps.md`.
- **On a mistake / correction** → refine a growth memory (`<lang>/growth-memory-refine-on-mistake.md`); important ones become new habit hooks in the table.
- **Periodically** → run the daily consolidation (`<lang>/daily-memory-consolidation.md`): dedup, resolve contradictions against the real code, re-weight.
- **Always** → keep the library contradiction-free, one fact one place (`<lang>/no-contradiction-when-writing-memory.md`).

## Note

The user works in **one** language after setup — you don't maintain both `en/` and `zh/`. The two folders exist only so a new adopter can start in their own language.

That's it: **pick the language, bootstrap, then be useful.**
