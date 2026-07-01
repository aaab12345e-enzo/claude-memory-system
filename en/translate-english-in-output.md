---
name: translate-english-in-output
description: "【Precondition = when serving non-native-language / non-technical users】Any foreign-language term/concept used as a 'word' in text output to the user must have a simple gloss in the local language right next to it, or they won't understand; pure code identifiers (function/file names) are exempt, but their purpose can be noted on first use. If the conversation is already being conducted in that language, this rule doesn't apply."
metadata: 
  node_type: memory
  type: feedback
  category: habit
  weight: 4
  originSessionId: ""
---

> Example · feedback-type memory: this is a sample of "recording your user's preferences" — swap it out for your own user's actual preferences.

⚑**Precondition: this rule only applies when "serving a non-native-language / non-technical user"** — when the user chats with me in a certain language (e.g. Chinese), bare terms wedged in trip them up. **If the whole conversation is already in the same language** (e.g. English throughout with an English-speaking user), then **no extra term translation is needed** (within the same context it's already clear). The criterion is the language the user is using in this particular conversation.

**Trigger = under the above precondition, any text output to the user**. A habit memory (action-triggered).

**Rule**: for every **foreign-language term used as a "word"** that appears in the output (concepts: loadout / resolve / stub / parse / type / category / feedback …) → **attach a simple gloss in the local language right next to it** (parenthetical note: `loadout (equipment config)`, `type`, `category`, `stub (empty placeholder)`).
- **Exception**: pure **code identifiers** (function/file/field names) are exempt (it's a code symbol, not a word), but **its purpose can be noted once on first appearance**.
- ⚑**Special case · explanatory docs**: **when generating an "explanatory doc" (delivery/submission notes) for a non-technical audience, translate all terms — even code identifiers get a local-language gloss right next to them**. Stricter than usual: leaving bare terms in a doc makes it hard for others to read. Doc generation = its own independent action hook (see [[habit-action-hooks]]).

**Why**: the user can't understand bare terms mixed into the local language = the whole sentence stalls, they can't sign off / can't read on.

⚑**Density can also kill readability** — even if each one is a "code identifier (exempt)", stringing **5+ term symbols in one sentence without explaining in the local language what they do** still leaves the user unable to understand the whole thing. **Fix**: when explaining a plan, don't chain code names as words; for each code name, say in the local language right next to it "what it is / what it does" (e.g. `CombatAI reads skillList`), so the local language reads on its own. **If you use a multi-choice interactive component (option label/description), it's subject to this rule too.**

**How to apply** (**don't translate while thinking — you'll drop them**): **split into two passes**. ① **Produce**: first think the content through and write it out, pile up terms freely, just get it right. ② **Before sending · a separate polish pass** (do only the "is it understandable" job, think of nothing else): are there terms used as words → add a gloss to each; is a sentence too dense, unreadable in the local language → break it up + note each one's purpose. **Why this is what makes it stable**: translation is user-facing packaging; cramming it into your thinking = multitasking = it gets squeezed out by the content; splitting it into a single-threaded wrap-up after thinking is done = it actually gets done (like "draft first, then edit" in writing). See [[habit-action-hooks]]. Continues the colloquial style of [[comm-style-chat-not-docs]].
