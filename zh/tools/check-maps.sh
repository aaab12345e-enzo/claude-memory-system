#!/usr/bin/env bash
# 地图体检:验证「逻辑地图」(frontmatter 里 node_type: map)引用的代码文件/函数是否还存在。纯只读。
# 地图最致命——它错了会把 AI 引到不存在/已废弃的代码上,所以日清时跑一遍。
#
# 这是个「示例」脚本:下面按你自己的项目改默认仓路径和语言判断即可。
# 演示的场景 = 两个代码仓、两种语言(一个客户端项目用 .gd,一个服务端项目用 .lua);
# 地图的 frontmatter 里可选写 `repo: client` / `repo: server` 指定归属,否则按扩展名猜。
# 用法:bash check-maps.sh [客户端仓路径] [服务端仓路径]
set -uo pipefail
CLIENT="${1:-$HOME/your-client-repo}"
SERVER="${2:-$HOME/your-server-repo}"
MEM="$(cd "$(dirname "$0")/.." && pwd)"
LUA_STD="table string math os io coroutine debug pairs ipairs type tostring tonumber print pcall setmetatable next select"

maps=$(grep -rl "node_type: map" "$MEM"/*.md 2>/dev/null | sort)
[ -z "$maps" ] && { echo "没找到地图(node_type: map)"; exit 0; }

bad_maps=0
for m in $maps; do
  name=$(basename "$m" .md)
  repo=$(grep -m1 '^  repo:' "$m" | sed 's/.*repo: *//;s/[[:space:]]*$//')
  if [ "$repo" = server ]; then ROOT="$SERVER"; lang=lua; ext=lua
  elif [ "$repo" = client ]; then ROOT="$CLIENT"; lang=gd; ext=gd
  elif grep -qE '\.lua\b' "$m"; then ROOT="$SERVER"; lang=lua; ext=lua
  else ROOT="$CLIENT"; lang=gd; ext=gd; fi
  if [ ! -d "$ROOT" ]; then echo "⚠️ $name 的代码仓不存在:$ROOT"; bad_maps=$((bad_maps+1)); continue; fi
  bad=0; out=""
  # ① 文件存在性(.gd / .lua)
  for f in $(grep -oE "[A-Za-z0-9_/]+\.$ext" "$m" | sort -u); do
    base=$(basename "$f")
    if ! find "$ROOT" -name "$base" -not -path '*/.*' 2>/dev/null | grep -q .; then
      out+="  ❌ 文件找不到:$f\n"; bad=1
    fi
  done
  # ② 函数存在性
  if [ "$lang" = gd ]; then
    for ref in $(sed 's/`//g' "$m" | grep -oE '[A-Za-z_][A-Za-z0-9_]*\([0-9]+\)' | sort -u); do
      fn=${ref%%(*}
      grep -rqE "(func|var|const|signal)[[:space:]]+$fn\b" "$ROOT" --include=*.gd 2>/dev/null \
        || { out+="  ⚠️ 定义找不到:$fn(地图写 $ref)\n"; bad=1; }
    done
  else
    # Lua:取"像函数调用"的引用 Module.method( 或 Module:method(,验有无定义
    # 只验「大写模块.方法(」=类函数;跳过小写变量字段访问(运行时字段非函数)
    for ref in $(sed 's/`//g' "$m" | grep -oE '[A-Z][A-Za-z0-9_]*[.:][A-Za-z_][A-Za-z0-9_]*\(' | sed 's/($//;s/(//' | sort -u); do
      mod=${ref%[.:]*}; meth=${ref##*[.:]}
      case " $LUA_STD " in *" $mod "*) continue;; esac
      grep -rqE "function[[:space:]]+[A-Za-z0-9_]*[.:]?$meth\b|[.:]$meth[[:space:]]*=[[:space:]]*function|\b$meth[[:space:]]*=[[:space:]]*function" "$ROOT" --include=*.lua 2>/dev/null \
        || { out+="  ⚠️ 函数定义找不到:$ref(改名/删了?)\n"; bad=1; }
    done
  fi
  if [ "$bad" = 0 ]; then echo "✅ $name ($lang) —— 文件/函数全对得上"
  else echo "🔧 $name ($lang) —— 有疑点:"; printf "$out"; bad_maps=$((bad_maps+1)); fi
done
echo "──────── 体检完:$bad_maps 张地图有疑点(上面 🔧),其余对得上 ────────"
