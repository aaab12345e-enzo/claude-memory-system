# Event bloodline log

One file per topic (`<slug>.md`), with **purely chronological numbering** `[1] [2] [3]…` accumulating. Records the **raw conversation** for key decisions (keep the user's words as intact as possible; the AI's questions and answers may be condensed).

Each "leaf" memory uses a `🩸conversation▸N` index to point in here → when a feature point is hit, follow the index to **load precisely those few entries**, instead of re-reading the whole big file. This way even the oldest decision can't be lost, as long as an index points at it.

> Empty directory, add to it as needed.
