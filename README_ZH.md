# 🤖 repo2skill - 仓库转技能转换器

[![English](https://img.shields.io/badge/Language-English-blue?style=flat-square)](./README_EN.md)
[![简体中文](https://img.shields.io/badge/语言-简体中文-red?style=flat-square)](./README_ZH.md)
[![OpenCode](https://img.shields.io/badge/平台-OpenCode-blueviolet?style=for-the-badge&logo=github)](https://opencode.ai)
[![Claude Code](https://img.shields.io/badge/平台-Claude--Code-blue?style=for-the-badge&logo=anthropic)](https://claude.ai/code)
[![零依赖](https://img.shields.io/badge/依赖-零-2ECC71?style=for-the-badge&logo=none)](#)
[![多平台支持](https://img.shields.io/badge/平台-GitHub%20%7C%20GitLab%20%7C%20Gitee-orange?style=for-the-badge&logo=github)](#)

> ⚡ **一键将任意开源仓库转换为全面的 OpenCode/Claude Code 技能**

你在 GitHub 上看到了一个超棒的开源项目,想让 AI 帮你理解和处理它,却遇到了这些难题: 代码太多 AI 读不完? 配置太复杂 AI 搞不定? 手动复制粘贴累到手抽筋?

**repo2skill** 就是为了解决这些问题而诞生的!它就像一个"技能转换器",能把任何 GitHub/GitLab/Gitee 仓库转换成 AI 助手(OpenCode/Claude Code) 能直接理解、直接使用的完整技能包。你不需要手动下载代码,不需要配置复杂的环境,也不需要提供 API keys。只需要提供一个链接,它就能帮你搞定一切!

---

## ✨ 核心特性

### 🎯 能做什么

- **🤖 AI 智能分析**: 使用你在 OpenCode/Claude Code 中配置的 LLM 智能分析仓库
- **🌐 多平台支持**: 支持 GitHub、GitLab 和 Gitee - 一个工具搞定所有平台
- **⚡ 智能镜像轮换**: 内置 10+ 个 GitHub 镜像端点,自动故障转移和速率限制处理
- **📦 零依赖**: 无需 npm install,无需 API keys,无需外部包 - 开箱即用
- **🔄 批量转换**: 同时转换多个仓库,并行处理
- **📖 完整文档生成**: 生成包含 18+ 章节的全面技能,涵盖安装、使用、API、FAQ 等
- **🛡️ 智能重试逻辑**: 指数退避(1s, 2s, 4s, 8s)配合自动镜像切换
- **✅ 立即可用**: 生成的技能在 OpenCode 和 Claude Code 中立即可用

---

## ⚡ 快速开始

### 安装(30秒)

只需将 skill 复制到你的 skills 目录:

```bash
# 选项 1: 全局(推荐用于所有项目)
mkdir -p ~/.config/opencode/skills
cp -r repo2skill ~/.config/opencode/skills/

# 选项 2: Claude 兼容
mkdir -p ~/.claude/skills
cp -r repo2skill ~/.claude/skills/

# 选项 3: 项目特定
mkdir -p your-project/.opencode/skills
cp -r repo2skill your-project/.opencode/skills/
```

就这么简单!无需 npm install,无需 API keys。🎉

### 使用(一个命令)

启动 OpenCode 或 Claude Code 并说:

```
帮我把这个仓库转成技能:https://github.com/vercel/next.js
```

**技能会自动:**
1. ✅ 解析仓库 URL 并检测平台
2. 🔍 从多个镜像端点获取数据
3. 📖 使用你配置的 LLM 分析仓库
4. 📝 生成包含 18+ 章节的完整 SKILL.md
5. 💾 询问你想把生成的技能保存到哪里

---

## 🌐 支持的平台

### GitHub ✅

**支持的 URL:**
- `https://github.com/owner/repo`
- `https://www.github.com/owner/repo`
- `github.com/owner/repo` (简写)

**特性:**
- 8 个 API 镜像自动轮换
- 5 个 Raw 内容镜像
- 无 token 60 次/小时,有 token 5000 次/小时
- 全面的项目分析

**示例:**
```
帮我把这个 GitHub 仓库转成技能:https://github.com/anthropics/anthropic-sdk-typescript
```

### GitLab ✅

**支持的 URL:**
- `https://gitlab.com/owner/repo`
- `https://www.gitlab.com/owner/repo`
- `gitlab.com/owner/repo`

**特性:**
- 官方 API + 代理支持
- URL 编码的项目路径
- 未认证约 60 次/分钟
- 完整的仓库结构分析

**示例:**
```
帮我把这个 GitLab 仓库转成技能:https://gitlab.com/gitlab-org/gitlab
```

### Gitee ✅

**支持的 URL:**
- `https://gitee.com/owner/repo`
- `https://www.gitee.com/owner/repo`
- `gitee.com/owner/repo`

**特性:**
- 国内原生平台 - 在中国访问速度快
- 无需镜像轮换(原生速度)
- API v5 支持
- 认证约 5000 次/小时,未认证约 100 次/小时

**示例:**
```
帮我把这个 Gitee 仓库转成技能:https://gitee.com/mindspore/docs
```

---

## 🛠️ 工作原理

### 架构概览

```
仓库 URL
       ↓
1. 解析平台(GitHub/GitLab/Gitee)
       ↓
2. 镜像轮换 API 调用
   - 元数据(stars, forks, 语言)
   - README 内容
   - 文件树结构
   - 关键文档文件
       ↓
3. AI 分析(你配置的 LLM)
   - 项目概览和特性
   - 安装指南
   - 使用示例
   - API 参考
   - 故障排除
       ↓
4. 生成 SKILL.md
   - YAML frontmatter
   - 18+ 全面章节
   - 真实示例
       ↓
5. 保存到用户选择的位置
   - 项目本地
   - 全局用户配置
   - Claude 兼容
       ↓
✅ 准备使用!
```

### 镜像配置

**GitHub API 镜像(优先级顺序):**
1. `https://api.github.com` (官方)
2. `https://gh.api.888888888.xyz`
3. `https://gh-proxy.com/api/github`
4. `https://api.fastgit.org`
5. `https://api.kgithub.com`
6. `https://githubapi.muicss.com`
7. `https://github.91chi.fun`
8. `https://mirror.ghproxy.com`

**GitHub Raw 镜像:**
1. `https://raw.githubusercontent.com`
2. `https://raw.fastgit.org`
3. `https://raw.kgithub.com`

**速率限制处理:**
- 连续 3 次失败后自动切换镜像
- 指数退避: 1s, 2s, 4s, 8s
- 每个端点最多重试 5 次
- 30 秒请求超时

---

## 📚 使用示例

### 示例 1: 转换热门框架

**输入:**
```
帮我把这个仓库转成技能:https://github.com/vercel/next.js
```

**输出:**
全面的 Next.js 技能(~400-600 行),包括:
- 安装指南(npm, yarn, pnpm)
- App Router 和 Pages Router
- Server Components 和 Client Components  
- API Routes 和 Server Actions
- Image, Font 和 Script 优化
- 测试和部署
- FAQ 和故障排除

### 示例 2: 批量转换多个仓库

**输入:**
```
帮我转换这几个仓库:
- https://github.com/anthropics/anthropic-sdk-typescript
- https://gitlab.com/gitlab-org/gitlab
- https://gitee.com/mindspore/docs
```

**输出:**
并行处理,约 2-4 分钟生成 3 个完整技能。

### 示例 3: 转换小型工具库

**输入:**
```
帮我把这个工具库转成技能:https://github.com/user/my-utils
```

**输出:**
专注的文档(~200-300 行),包括:
- 使用示例
- 所有函数的 API 参考
- 快速入门指南

### 示例 4: 中文仓库

**输入:**
```
帮我把这个国内项目转成技能:https://gitee.com/mindspore/docs
```

**输出:**
双语技能,保留中文文档并提供英文翻译。

---

## 📁 项目结构

```
repo2skill/
├── repo2skill/                       # 🎯 主 Skill 目录(复制这个目录使用)
│   ├── SKILL.md                      # 核心系统指令(397 行)
│   ├── IMPLEMENTATION.md             # 技术文档(165 行)
│   ├── references/                   # API 参考文档
│   │   ├── github-api.md             # GitHub API 速查表(123 行)
│   │   ├── gitlab-api.md             # GitLab API 速查表(114 行)
│   │   └── gitee-api.md              # Gitee API 速查表(31 行)
│   └── scripts/                      # 工具脚本
│       └── utils.sh                  # Bash 辅助函数(95 行)
├── README.md                         # 英文主文档
├── README_EN.md                      # 英文简版
├── README_ZH.md                      # 本文件
├── INSTALL.md                        # 安装指南
├── QUICKSTART.md                     # 5 分钟快速开始
├── EXAMPLES.md                       # 10 个真实示例
├── IMPLEMENTATION.md                 # 技术实现细节
```

---

## 🎯 生成的内容

生成的技能包含 18+ 个全面章节:

### 完整文档结构

1. **概述** - 项目摘要、stars、forks、语言
2. **核心功能** - 主要能力列表
3. **安装** - 设置说明(多种包管理器)
4. **使用指南** - 常见任务和代码示例
5. **API 参考** - 端点、函数、参数
6. **配置** - 环境变量和设置
7. **开发** - 架构、测试、贡献
8. **测试** - 测试设置和命令
9. **FAQ** - 常见问题和答案
10. **故障排除** - 调试提示和解决方案
11. **性能** - 优化说明
12. **安全** - 安全考虑
13. **最佳实践** - 行业标准实践
14. **资源** - 文档和示例链接
15. **支持** - 社区和帮助资源

### YAML Frontmatter

```yaml
---
name: nextjs-skill
description: The React Framework for the Web
author: auto-generated by repo2skill
platform: github
source: https://github.com/vercel/next.js
tags: [react, framework, ssr, web-app]
version: 1.0.0
generated: 2026-01-23T10:30:00Z
---
```

---

## 🎨 安装路径

当技能生成后,你可以选择保存位置:

### 选项 1: 项目本地
```
./opencode/skills/<skill-name>/SKILL.md
```
- 仅在当前项目中可用
- 适合项目特定工具

### 选项 2: 全局用户配置
```
~/.config/opencode/skills/<skill-name>/SKILL.md
```
- 在所有项目中可用
- **推荐用于常用工具**

### 选项 3: Claude 兼容
```
~/.claude/skills/<skill-name>/SKILL.md
```
- 同时兼容 OpenCode 和 Claude Code
- 最大兼容性

技能生成后会自动询问你选择!

---

## 🔧 高级用法

### 批量转换

一次转换多个仓库:

```
帮我转换这几个仓库:
- https://github.com/vercel/next.js
- https://github.com/facebook/react
- https://github.com/anthropics/anthropic-sdk-typescript
```

优势:
- 并行处理
- 所有技能格式一致
- 高效处理多个仓库

### 平台特定提示

**GitHub:**
- 使用 `github.com`(非原始 URL)
- 公共仓库无需 token
- 私有仓库需要 `GITHUB_TOKENS` 环境变量

**GitLab:**
- 如果 URL 编码失败,尝试按项目名称搜索
- 使用 main 分支,回退到 master

**Gitee:**
- 先尝试 `master` 分支(更常见)
- 非常适合中文项目
- 从中国内地访问更快

### 可选: API Token

对于私有仓库或更高速率限制:

```bash
# GitHub token(逗号分隔用于轮换)
export GITHUB_TOKENS="ghp_xxx,ghp_yyy,ghp_zzz"

# GitLab token
export GITLAB_TOKENS="glpat_xxx,glpat_yyy"

# Gitee token
export GITEE_TOKEN="your_token"
```

---

## 🏮 常见问题

### Q: 我需要安装什么吗?

**A:** 不需要!这是一个纯 OpenCode/Claude Code skill。只需复制到你的 skills 目录即可立即使用。

### Q: 我需要为 LLM 提供 API keys 吗?

**A:** 不需要!技能使用你在 OpenCode/Claude Code 设置中配置的任何 LLM。

### Q: 所有镜像都失败了,我该怎么办?

**A:** 检查网络连接,确认仓库存在,或者尝试使用 VPN(如果在中国)。

### Q: 我可以用于私有仓库吗?

**A:** 可以!在使用前设置环境变量(GITHUB_TOKENS, GITLAB_TOKENS, GITEE_TOKEN)。

### Q: 生成技能需要多长时间?

**A:**
- 小型仓库(< 500 文件): 30-60 秒
- 中型仓库(500-2k 文件): 1-2 分钟
- 大型仓库(2k+ 文件): 2-5 分钟

### Q: 如果仓库没有 README 怎么办?

**A:** 会回退到分析文件结构和其他文档文件(CONTRIBUTING.md, docs/*.md 等)。

### Q: 我可以一次转换多个仓库吗?

**A:** 可以!提供多个 URL 进行批量处理。

### Q: 生成的技能保存在哪里?

**A:** 技能生成时你可以在三个位置中选择。

### Q: 这是否适用于 Cursor、VS Code 扩展等?

**A:** 可以!只要工具支持 OpenCode Skills 或 Claude Code Skil
