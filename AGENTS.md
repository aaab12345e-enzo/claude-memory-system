# AGENTS.md — AI agent, read this first

You are an AI coding agent (e.g. Claude Code) and a user has pointed you at this folder and asked you to **use / adopt it as their persistent memory system**. This file is your bootstrap. **Do not just read the files and stop, and do not silently reorganize anything** — follow the steps below.

*（本文件是给 AI agent 看的启动说明;给人看的介绍在 [README.md](README.md)。）*

## What this is

A file-based persistent memory system. The single entry point is **`MEMORY.md`** — an index that also contains the **habit-hook table** (the workflow "thinking habits" you should follow every session). Every other `.md` is one memory; the two `README` files explain the design to humans.

## Bootstrap — when the user says "use this memory system"

Do these in order, and **confirm with the user before editing any of their config files**:

1. **Make `MEMORY.md` load every session.** This system only works if `MEMORY.md` is in your *always-loaded* context — otherwise the rules sit on disk and never fire. Ask the user where their agent auto-loads context (for Claude Code that's usually the project's `CLAUDE.md`, or the user-level memory). With their OK, add a line there that imports/points to this `MEMORY.md` (or move this folder to that location).

2. **Run the first-run onboarding.** Open the habit-hook table (in `MEMORY.md`, the section "🪝 习惯记忆·动作钩子"; **if the user communicates in English, use [`HABITS.en.md`](HABITS.en.md) instead**). Walk the user through it **one hook at a time**: read each hook, ask "keep this? change it?", edit or drop whatever doesn't fit. The goal is to make it *their* workflow, not inherit a stranger's.

3. **Confirm the memory DB.** Tell the user plainly: "from now on I'll save long-term knowledge as `.md` files in this folder, and `MEMORY.md` is the index." 

4. **Then start working** — and from here on, follow the habit-hook table every session.

## Ongoing (after bootstrap)

- **Every session**: read `MEMORY.md`; follow the habit-hook table.
- **New project knowledge** → organize as a `project → module → event` tree; one logic map per module. See [`memory-topic-by-project-structure.md`](memory-topic-by-project-structure.md) and [`module-maps.md`](module-maps.md).
- **On a mistake / correction** → refine a growth memory ([`growth-memory-refine-on-mistake.md`](growth-memory-refine-on-mistake.md)); important ones become new habit hooks in the table.
- **Periodically** → run the daily consolidation ([`daily-memory-consolidation.md`](daily-memory-consolidation.md)): dedup, resolve contradictions against the real code, re-weight.
- **Always** → keep the library contradiction-free, one fact one place ([`no-contradiction-when-writing-memory.md`](no-contradiction-when-writing-memory.md)).

## Language

- User speaks the repo's default language → habit table lives in `MEMORY.md`.
- **User speaks English → use `HABITS.en.md`** for the habit table and the onboarding walkthrough.

That's it: **bootstrap first, then be useful.**
