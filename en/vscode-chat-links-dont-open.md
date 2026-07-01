---
name: vscode-chat-links-dont-open
description: In some IDE chat panels, clicking a file link can't open the file; when referencing files, just give a clear path
metadata: 
  node_type: memory
  type: feedback
  originSessionId: ""
---

> Example · feedback-type memory: this is a sample of "recording your user's preferences" — swap it out for your own user's actual preferences.

In some IDE chat environments (e.g. VS Code), clicking a markdown file link in a chat reply may not work (a single click only selects it, a double click selects the word as text — tried both relative and absolute paths). In this case, drop the link and use the file tree to open it — it's less hassle.

**Why:** repeatedly making the user click links to test, only to fail, just wastes the user's time.

**How to apply:** you can still use markdown link format when referencing a file (it's harmless), but don't make the user "click the link to open"; when the user needs to view a file, give a clear filename/path, suggest opening it via the file explorer or a shortcut, or open it for the user directly from the command line (e.g. `code -r <absolute path>`).
