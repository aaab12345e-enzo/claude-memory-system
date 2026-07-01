#!/usr/bin/env bash
# 树完整性体检:一件事做完后,反向验证整棵记忆树长得齐不齐(对内核结构;与 check-maps 对外核代码互补)。
# 纯只读。验三件:① 每片叶子(事件)都链回了某张地图 ② 每张地图(枝)都在 module-maps 名单里 ③ 无孤儿
set -uo pipefail
MEM="$(cd "$(dirname "$0")/.." && pwd)"; cd "$MEM"
bad=0
maps=$(grep -rl "node_type: map" *.md 2>/dev/null | sort)
events=$(grep -rl "node_type: event" *.md 2>/dev/null | sort)

echo "① 每片叶子(事件)是否声明了它的地图(那行『模块地图 = [[..]]』):"
for e in $events; do
  eslug=$(basename "$e" .md)
  declared=$(grep '模块地图' "$e" | grep -oE '\[\[[a-z0-9-]+\]\]' | head -1 | tr -d '[]')
  if [ -z "$declared" ]; then echo "  ⚠️ $eslug 没声明『模块地图 = [[..]]』(孤儿叶)"; bad=$((bad+1))
  elif [ -f "$declared.md" ] && grep -qE "node_type: (map|root)" "$declared.md"; then tag=$(grep -m1 '^  tag:' "$e" | sed 's/.*tag: *//'); pt=$(grep -q "node_type: root" "$declared.md" && echo "(挂根·枝地图待建)" || echo ""); echo "  ✅ $eslug → $declared $pt [反查标签:${tag:-无}]"
  else echo "  ⚠️ $eslug 声明的地图『$declared』不存在或不是地图"; bad=$((bad+1)); fi
done

echo "② 每张地图(枝)是否在 module-maps 名单:"
for m in $maps; do
  mslug=$(basename "$m" .md)
  if grep -q "\[\[$mslug\]\]" module-maps.md 2>/dev/null; then echo "  ✅ $mslug"
  else echo "  ⚠️ $mslug 不在 module-maps 名单(没登记的枝)"; bad=$((bad+1)); fi
done

echo "──────── 树体检完:$bad 处不齐(上面 ⚠️),其余结构完整 ────────"
