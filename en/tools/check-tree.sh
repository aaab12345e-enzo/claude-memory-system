#!/usr/bin/env bash
# Tree integrity health check: after finishing a task, reverse-verify that the whole memory tree is grown out completely (against the internal structure; complementary to check-maps which checks against external code).
# Read-only. Verifies three things: ① every leaf (event) links back to some map ② every map (branch) is in the module-maps list ③ no orphans
set -uo pipefail
MEM="$(cd "$(dirname "$0")/.." && pwd)"; cd "$MEM"
bad=0
maps=$(grep -rl "node_type: map" *.md 2>/dev/null | sort)
events=$(grep -rl "node_type: event" *.md 2>/dev/null | sort)

echo "① whether each leaf (event) declares its map (the line 'module map = [[..]]'):"
for e in $events; do
  eslug=$(basename "$e" .md)
  declared=$(grep -iE 'module map' "$e" | grep -oE '\[\[[a-z0-9-]+\]\]' | head -1 | tr -d '[]')
  if [ -z "$declared" ]; then echo "  ⚠️ $eslug does not declare 'module map = [[..]]' (orphan leaf)"; bad=$((bad+1))
  elif [ -f "$declared.md" ] && grep -qE "node_type: (map|root)" "$declared.md"; then tag=$(grep -m1 '^  tag:' "$e" | sed 's/.*tag: *//'); pt=$(grep -q "node_type: root" "$declared.md" && echo "(on root · branch map to be built)" || echo ""); echo "  ✅ $eslug → $declared $pt [reverse-lookup tag: ${tag:-none}]"
  else echo "  ⚠️ the map '$declared' declared by $eslug does not exist or is not a map"; bad=$((bad+1)); fi
done

echo "② whether each map (branch) is in the module-maps list:"
for m in $maps; do
  mslug=$(basename "$m" .md)
  if grep -q "\[\[$mslug\]\]" module-maps.md 2>/dev/null; then echo "  ✅ $mslug"
  else echo "  ⚠️ $mslug is not in the module-maps list (unregistered branch)"; bad=$((bad+1)); fi
done

echo "──────── tree health check done: $bad issue(s) (⚠️ above), the rest of the structure is intact ────────"
