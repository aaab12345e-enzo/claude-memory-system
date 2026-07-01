#!/usr/bin/env bash
# Map health check: verify that the code files/functions referenced by a "logic map" (node_type: map in the frontmatter) still exist. Read-only.
# The map is the most fatal one — if it's wrong it steers the AI onto code that doesn't exist / has been deprecated, so run it once during a daily consolidation.
#
# This is an "example" script: just edit the default repo paths and language detection below to fit your own project.
# The scenario shown = two code repos, two languages (a client project using .gd, a server project using .lua);
# a map's frontmatter can optionally write `repo: client` / `repo: server` to specify ownership, otherwise it's guessed from the extension.
# Usage: bash check-maps.sh [client repo path] [server repo path]
set -uo pipefail
CLIENT="${1:-$HOME/your-client-repo}"
SERVER="${2:-$HOME/your-server-repo}"
MEM="$(cd "$(dirname "$0")/.." && pwd)"
LUA_STD="table string math os io coroutine debug pairs ipairs type tostring tonumber print pcall setmetatable next select"

maps=$(grep -rl "node_type: map" "$MEM"/*.md 2>/dev/null | sort)
[ -z "$maps" ] && { echo "No maps found (node_type: map)"; exit 0; }

bad_maps=0
for m in $maps; do
  name=$(basename "$m" .md)
  repo=$(grep -m1 '^  repo:' "$m" | sed 's/.*repo: *//;s/[[:space:]]*$//')
  if [ "$repo" = server ]; then ROOT="$SERVER"; lang=lua; ext=lua
  elif [ "$repo" = client ]; then ROOT="$CLIENT"; lang=gd; ext=gd
  elif grep -qE '\.lua\b' "$m"; then ROOT="$SERVER"; lang=lua; ext=lua
  else ROOT="$CLIENT"; lang=gd; ext=gd; fi
  if [ ! -d "$ROOT" ]; then echo "⚠️ code repo for $name does not exist: $ROOT"; bad_maps=$((bad_maps+1)); continue; fi
  bad=0; out=""
  # ① file existence (.gd / .lua)
  for f in $(grep -oE "[A-Za-z0-9_/]+\.$ext" "$m" | sort -u); do
    base=$(basename "$f")
    if ! find "$ROOT" -name "$base" -not -path '*/.*' 2>/dev/null | grep -q .; then
      out+="  ❌ file not found: $f\n"; bad=1
    fi
  done
  # ② function existence
  if [ "$lang" = gd ]; then
    for ref in $(sed 's/`//g' "$m" | grep -oE '[A-Za-z_][A-Za-z0-9_]*\([0-9]+\)' | sort -u); do
      fn=${ref%%(*}
      grep -rqE "(func|var|const|signal)[[:space:]]+$fn\b" "$ROOT" --include=*.gd 2>/dev/null \
        || { out+="  ⚠️ definition not found: $fn (map says $ref)\n"; bad=1; }
    done
  else
    # Lua: grab references that "look like function calls" Module.method( or Module:method(, verify a definition exists
    # Only verify "Uppercase Module.method(" = class functions; skip lowercase variable field access (runtime fields, not functions)
    for ref in $(sed 's/`//g' "$m" | grep -oE '[A-Z][A-Za-z0-9_]*[.:][A-Za-z_][A-Za-z0-9_]*\(' | sed 's/($//;s/(//' | sort -u); do
      mod=${ref%[.:]*}; meth=${ref##*[.:]}
      case " $LUA_STD " in *" $mod "*) continue;; esac
      grep -rqE "function[[:space:]]+[A-Za-z0-9_]*[.:]?$meth\b|[.:]$meth[[:space:]]*=[[:space:]]*function|\b$meth[[:space:]]*=[[:space:]]*function" "$ROOT" --include=*.lua 2>/dev/null \
        || { out+="  ⚠️ function definition not found: $ref (renamed/deleted?)\n"; bad=1; }
    done
  fi
  if [ "$bad" = 0 ]; then echo "✅ $name ($lang) —— all files/functions check out"
  else echo "🔧 $name ($lang) —— has issues:"; printf "$out"; bad_maps=$((bad_maps+1)); fi
done
echo "──────── health check done: $bad_maps map(s) have issues (🔧 above), the rest check out ────────"
