---
name: vscode-chat-links-dont-open
description: 某些 IDE 聊天面板里点文件链接无法打开文件,引用文件时给清晰路径即可
metadata: 
  node_type: memory
  type: feedback
  originSessionId: ""
---

> 示例·反馈类记忆:这是"记录你的用户偏好"的样例,换成你自己用户的实际偏好。

在某些 IDE(如 VS Code)聊天环境里,聊天回复中的 markdown 文件链接点击可能无效(单击只有选中效果,双击是文本选词,相对/绝对路径都试过)。这种情况下放弃链接、改用文件树打开更省事。

**Why:** 反复让用户点链接测试都失败,只会浪费用户时间。

**How to apply:** 引用文件时仍可用 markdown 链接格式(无害),但不要让用户"点击链接打开";需要用户查看文件时,给出清晰的文件名/路径,提示用资源管理器或快捷键打开,或直接用命令行(如 `code -r <绝对路径>`)帮用户打开。
