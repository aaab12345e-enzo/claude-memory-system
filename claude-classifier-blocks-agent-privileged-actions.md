---
name: claude-classifier-blocks-agent-privileged-actions
description: "避坑铁律:Claude Code 安全分类器会拦 agent 的自主/越权动作(改自己记忆·外传记忆·自我提权)——这些必须用户手动跑,别绕"
metadata:
  node_type: memory
  type: feedback
  weight: 2
  originSessionId: ""
---

**避坑铁律:有些"agent 对自己的配置/记忆动手 或 自我提权"的动作,Claude Code 安全分类器一定会拦——别试图绕,直接让用户在终端手动做。**

已撞过的三类(2026-06-17 两次 + 之前一次,故升权重):
1. **自动改记忆(无人值守)** —— 用后台调度(如 launchd)加上关审批的 `claude -p --permission-mode acceptEdits` 跑后台整理记忆,被判"未授权持久化 + 关审批门的自主 agent 循环"拦。→ 记忆整理只能手动触发。
2. **把 `~/.claude` 记忆树推到外部库** —— 用 `gh repo create … --source ~/.claude/.../memory --push` 把本地记忆目录直接创库外推,被判"记忆外传到信任边界外"拦。→ 用户在终端手动 push。
3. **给自己写权限规则** —— Write/Edit 往 `.claude/settings.json` 的 `permissions.allow` 加规则(哪怕用户口头说"给你开权限"),被判"未授权自我提权"拦。→ 权限规则必须**用户本人**写进 settings。

**How to apply:** 碰到"改 agent 自身记忆/设置、关审批、把本地敏感目录外传"这类,**预期会被拦**——别反复重试、别找歪招绕(那是滥用),第一时间把"该跑的那一条命令/该加的那行配置"给用户,让他手动执行。这是合理安全边界,不是配合不到位。相关:[[daily-memory-consolidation]]、[[api-overload-retry-cadence]]。
