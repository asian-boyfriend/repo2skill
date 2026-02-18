# 🤖 repo2skill - Repository to Skill Converter

[![English](https://img.shields.io/badge/Language-English-blue?style=flat-square)](./README_EN.md)
[![简体中文](https://img.shields.io/badge/语言-简体中文-red?style=flat-square)](./README_ZH.md)
[![OpenCode](https://img.shields.io/badge/Platform-OpenCode-blueviolet?style=for-the-badge&logo=github)](https://opencode.ai)
[![Claude Code](https://img.shields.io/badge/Platform-Claude--Code-blue?style=for-the-badge&logo=anthropic)](https://claude.ai/code)
[![Zero-Dependencies](https://img.shields.io/badge/Dependencies-Zero-2ECC71?style=for-the-badge&logo=none)](#)
[![Multi-Platform](https://img.shields.io/badge/Platforms-GitHub%20%7C%20GitLab%20%7C%20Gitee-orange?style=for-the-badge&logo=github)](#)

> ⚡ **Convert any open-source repository into a comprehensive OpenCode/Claude Code Skill with one command**

You found an amazing open-source project and want AI to help you understand and work with it, but faced these problems: Too much code for AI to read? Complicated configuration AI can't handle? Manual copy-paste exhausting?

**repo2skill** is here to solve these problems! It's like a "skill converter" that can transform any GitHub/GitLab/Gitee repository into a comprehensive skill package that AI assistants (OpenCode/Claude Code) can directly understand and use. You don't need to manually download code, configure complex environments, or provide API keys. Just provide a link, and it handles everything!

---

## ✨ Key Features

### 🎯 What It Does

- **🤖 AI-Powered Analysis**: Uses your configured LLM in OpenCode/Claude Code to analyze repositories intelligently
- **🌐 Multi-Platform Support**: Supports GitHub, GitLab, and Gitee - one tool for all
- **⚡ Intelligent Mirror Rotation**: Built-in 10+ GitHub mirrors with automatic failover and rate limit handling
- **📦 Zero Dependencies**: No npm install, no API keys, no external packages - works out of the box
- **🔄 Batch Conversion**: Convert multiple repositories simultaneously with parallel processing
- **📖 Complete Documentation**: Generates comprehensive 18+ section skills covering installation, usage, API, FAQ, and more
- **🛡️ Smart Retry Logic**: Exponential backoff (1s, 2s, 4s, 8s) with automatic mirror switching
- **✅ Ready to Use**: Generated skills work immediately in OpenCode and Claude Code

---

## ⚡ Quick Start

### Installation (30 seconds)

Simply copy the skill to your skills directory:

```bash
# Option 1: Global (recommended for all projects)
mkdir -p ~/.config/opencode/skills
cp -r repo2skill ~/.config/opencode/skills/

# Option 2: Claude-compatible
mkdir -p ~/.claude/skills
cp -r repo2skill ~/.claude/skills/

# Option 3: Project-specific
mkdir -p your-project/.opencode/skills
cp -r repo2skill your-project/.opencode/skills/
```

That's it! No npm install, no API keys needed. 🎉

### Usage (One Command)

Start OpenCode or Claude Code and say:

```
Convert this repository into a skill: https://github.com/vercel/next.js
```

**The skill will automatically:**
1. ✅ Parse repository URL and detect platform
2. 🔍 Fetch data from multiple mirror endpoints
3. 📖 Use your configured LLM to analyze the repository
4. 📝 Generate a complete SKILL.md with 18+ sections
5. 💾 Ask you where to save the generated skill

---

## 🌐 Supported Platforms

### GitHub ✅

**Supported URLs:**
- `https://github.com/owner/repo`
- `https://www.github.com/owner/repo`
- `github.com/owner/repo` (short form)

**Features:**
- 8 API mirrors with automatic rotation
- 5 Raw content mirrors
- 60 requests/hour without token, 5000/hour with token
- Comprehensive analysis of projects

**Example:**
```
Convert this GitHub repository into a skill: https://github.com/anthropics/anthropic-sdk-typescript
```

### GitLab ✅

**Supported URLs:**
- `https://gitlab.com/owner/repo`
- `https://www.gitlab.com/owner/repo`
- `gitlab.com/owner/repo`

**Features:**
- Official API + proxy support
- URL-encoded project paths
- ~60 requests/minute unauthenticated
- Full repository structure analysis

**Example:**
```
Convert this GitLab repository into a skill: https://gitlab.com/gitlab-org/gitlab
```

### Gitee ✅

**Supported URLs:**
- `https://gitee.com/owner/repo`
- `https://www.gitee.com/owner/repo`
- `gitee.com/owner/repo`

**Features:**
- Native Chinese platform - fast access in China
- No mirror rotation needed (native speed)
- API v5 support
- ~5000 requests/hour authenticated, ~100/hour unauthenticated

**Example:**
```
Convert this Gitee repository into a skill: https://gitee.com/mindspore/docs
```

---

## 🛠️ How It Works

### Architecture Overview

```
Repository URL
       ↓
1. Parse Platform (GitHub/GitLab/Gitee)
       ↓
2. Mirror Rotation API Calls
   - Metadata (stars, forks, language)
   - README content
   - File tree structure
   - Key documentation files
       ↓
3. AI Analysis (Your Configured LLM)
   - Project overview and features
   - Installation guides
   - Usage examples
   - API reference
   - Troubleshooting
       ↓
4. Generate SKILL.md
   - YAML frontmatter
   - 18+ comprehensive sections
   - Real-world examples
       ↓
5. Save to User-Selected Location
   - Project local
   - Global user config
   - Claude-compatible
       ↓
✅ Ready to Use!
```

### Mirror Configuration

**GitHub API Mirrors (priority order):**
1. `https://api.github.com` (official)
2. `https://gh.api.888888888.xyz`
3. `https://gh-proxy.com/api/github`
4. `https://api.fastgit.org`
5. `https://api.kgithub.com`
6. `https://githubapi.muicss.com`
7. `https://github.91chi.fun`
8. `https://mirror.ghproxy.com`

**GitHub Raw Mirrors:**
1. `https://raw.githubusercontent.com`
2. `https://raw.fastgit.org`
3. `https://raw.kgithub.com`

**Rate Limit Handling:**
- Automatic mirror switching on 3 consecutive failures
- Exponential backoff: 1s, 2s, 4s, 8s
- Max 5 retries per endpoint
- 30-second request timeout

---

## 📚 Usage Examples

### Example 1: Convert a Popular Framework

**Input:**
```
Convert this repository into a skill: https://github.com/vercel/next.js
```

**Output:**
A comprehensive Next.js skill (~400-600 lines) including:
- Installation guides (npm, yarn, pnpm)
- App Router and Pages Router
- Server Components and Client Components
- API Routes and Server Actions
- Image, Font, and Script optimization
- Testing and deployment
- FAQ and troubleshooting

### Example 2: Batch Multiple Repositories

**Input:**
```
Convert these repositories:
- https://github.com/anthropics/anthropic-sdk-typescript
- https://gitlab.com/gitlab-org/gitlab
- https://gitee.com/mindspore/docs
```

**Output:**
Parallel processing generates 3 complete skills in ~2-4 minutes.

### Example 3: Convert a Small Library

**Input:**
```
Convert this utility library into a skill: https://github.com/user/my-utils
```

**Output:**
Focused documentation (~200-300 lines) with:
- Usage examples
- API reference for all functions
- Quick start guide

### Example 4: Chinese Repository

**Input:**
```
Convert this Chinese project into a skill: https://gitee.com/mindspore/docs
```

**Output:**
Bilingual skill preserving Chinese documentation with English translations.

---

## 📁 Project Structure

```
repo2skill/
├── repo2skill/                       # 🎯 Main Skill Directory (copy this to use)
│   ├── SKILL.md                      # Core system instructions (397 lines)
│   ├── IMPLEMENTATION.md             # Technical documentation (165 lines)
│   ├── references/                   # API reference documentation
│   │   ├── github-api.md             # GitHub API quick reference (123 lines)
│   │   ├── gitlab-api.md             # GitLab API quick reference (114 lines)
│   │   └── gitee-api.md              # Gitee API quick reference (31 lines)
│   └── scripts/                      # Utility scripts
│       └── utils.sh                  # Bash helper functions (95 lines)
├── README.md                         # This file
├── README_EN.md                      # English version
├── README_ZH.md                      # Chinese version
├── INSTALL.md                        # Installation guide
├── QUICKSTART.md                     # 5-minute quick start
├── EXAMPLES.md                   
