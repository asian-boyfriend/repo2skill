---
name: repo2skill
description: Automatically convert GitHub/GitLab/Gitee repositories into comprehensive OpenCode Skills - No LLM API keys required, uses your configured model
author: repo2skill team
version: 1.0.0
tags: [repository, conversion, documentation, automation, github, gitlab, gitee]
---

# repo2skill - Repository to Skill Converter

🤖 **Intelligent tool to convert open-source repositories into comprehensive, production-ready OpenCode Skills**

> ⚡ **Zero Dependencies** - Uses your configured LLM in OpenCode/Claude Code  
> 🌐 **Multi-Platform** - GitHub, GitLab, and Gitee support  
> 🔄 **Mirror Rotation** - Auto-bypass rate limits with 10+ mirror endpoints  
> 📦 **One-Command** - Complete skill generation from a single URL

---

## Quick Start

### Basic Usage

Simply tell me which repository to convert:

```
用户: 帮我把这个仓库转成技能：https://github.com/vercel/next.js

我会立即:
1. ✅ 解析仓库URL
2. 🔍 从多个镜像站并发抓取数据
3. 📖 使用你配置的LLM分析内容
4. 📝 生成完整的 SKILL.md
5. 💾 让你选择保存位置
```

### Batch Conversion

Convert multiple repositories at once:

```
用户: 帮我转换这几个仓库:
- https://github.com/anthropics/anthropic-sdk-typescript  
- https://gitlab.com/gitlab-org/gitlab
- https://gitee.com/mindspore/docs

我会: 并行分析所有仓库并生成完整技能
```

---

## Features

### ✨ Core Capabilities

| Feature | Description |
|---------|-------------|
| **Multi-Platform** | GitHub, GitLab, Gitee - all supported |
| **Smart API Client** | Auto mirror rotation + rate limit handling |
| **LLM Integration** | Uses your configured model (Claude/GPT/Ollama/Local) |
| **Concurrent Fetching** | Parallel API calls with adaptive throttling |
| **Complete Documentation** | Installation, usage, API, debugging, FAQ |
| **Auto-Installation** | Choose from multiple installation paths |

### 🛠️ Technical Features

- **Mirror Rotation**: 8 GitHub API mirrors + 5 Raw content mirrors
- **Rate Limit Bypass**: Exponential backoff + automatic endpoint switching
- **Intelligent Parsing**: URL detection for all 3 platforms
- **Content Extraction**: README, file tree, key docs, metadata
- **AI Analysis**: Uses your LLM to understand and document projects
- **Structured Output**: YAML frontmatter + comprehensive Markdown

---

## How It Works

### The Workflow

```
1. URL Parsing
   ↓ Detect platform (GitHub/GitLab/Gitee)
   ↓ Extract owner/repo
   
2. Data Collection (with mirror rotation)
   ↓ Repository metadata (stars, forks, language)
   ↓ README content (with fallback to multiple branches)
   ↓ File tree structure
   ↓ Key configuration files
   
3. AI Analysis (using your configured model)
   ↓ Understand project purpose  
   ↓ Extract features and architecture
   ↓ Identify APIs and usage patterns
   ↓ Generate comprehensive documentation
   
4. Skill Generation
   ↓ Build YAML frontmatter
   ↓ Create structured markdown sections
   ↓ Add examples and troubleshooting
   
5. Installation
   ↓ User chooses location
   ↓ Create skill directory
   ↓ Write SKILL.md file
   ✅ Ready to use!
```

---

## Configuration

### No Setup Required!

This skill uses:
- ✅ **Your configured LLM** from OpenCode/Claude Code settings
- ✅ **Built-in tools** (webfetch, bash, read, write)
- ✅ **Zero external dependencies**

### Optional: Mirror Priority

The skill automatically tries mirrors in this order:

**GitHub API Mirrors:**
1. api.github.com (official)
2. gh.api.888888888.xyz
3. gh-proxy.com/api/github
4. api.fastgit.org
5. api.kgithub.com
6. githubapi.muicss.com
7. github.91chi.fun
8. mirror.ghproxy.com

**GitHub Raw Mirrors:**
1. raw.githubusercontent.com
2. gh-proxy.com proxy
3. raw.fastgit.org
4. raw.kgithub.com

---

## Installation Options

When a skill is generated, you can choose where to install:

### Option 1: Project Local
```
./.opencode/skills/<repo-name>/SKILL.md
```
- Available only in the current project
- Good for project-specific tools

### Option 2: Global User Config
```
~/.config/opencode/skills/<repo-name>/SKILL.md  
```
- Available in all projects
- Recommended for frequently used tools

### Option 3: Claude Compatible
```
~/.claude/skills/<repo-name>/SKILL.md
```
- Works with both OpenCode and Claude Code
- Maximum compatibility

---

## Supported Platforms

### GitHub
✅ **Fully Supported**

Supported URLs:
- `https://github.com/owner/repo`
- `https://www.github.com/owner/repo`
- `github.com/owner/repo`

Features:
- Public repositories: No token needed
- Private repositories: Requires GITHUB_TOKEN env var
- Mirror rotation: 8 API mirrors

### GitLab  
✅ **Fully Supported**

Supported URLs:
- `https://gitlab.com/owner/repo`
- `https://www.gitlab.com/owner/repo`
- `gitlab.com/owner/repo`

Features:
- Public repositories: No token needed
- Private repositories: Requires GITLAB_TOKEN env var

### Gitee
✅ **Fully Supported**

Supported URLs:
- `https://gitee.com/owner/repo`
- `https://www.gitee.com/owner/repo`
- `gitee.com/owner/repo`

Features:
- Native Chinese platform - fast access
- API v5 support

---

## What Gets Generated

The generated skill includes:

### 📋 Complete Sections

1. **Overview** - Project summary and purpose
2. **Key Features** - Main capabilities
3. **Installation** - Setup instructions
4. **Usage Guide** - Common tasks with examples
5. **API Reference** - Endpoints and parameters
6. **Configuration** - Settings and options
7. **Development** - Architecture and contribution guide
8. **Testing** - Test setup and commands
9. **FAQ** - Common questions and answers
10. **Troubleshooting** - Debug tips
11. **Performance** - Optimization notes
12. **Security** - Security considerations
13. **Resources** - Links to docs and examples

### 🏷️ Metadata (YAML Frontmatter)

```yaml
---
name: <repo-name>-skill
description: Auto-generated documentation
author: auto-generated
platform: github|gitlab|gitee
source: <repository-url>
tags: [auto-generated]
version: 1.0.0
generated: <timestamp>
---
```

---

## Usage Examples

### Example 1: Popular Framework

```
用户: 转换 React 项目: https://github.com/facebook/react

我会生成:
✅ Complete React documentation skill
✅ Installation guides (npm, yarn, pnpm)
✅ Component examples
✅ Hooks reference
✅ Testing guide
✅ Contributing guidelines
✅ FAQ and troubleshooting
```

### Example 2: Small Library

```
用户: 转换这个工具库: 
https://github.com/user/my-utils

我会生成:
✅ Focused documentation
✅ Usage examples
✅ API reference
✅ Quick start guide
```

### Example 3: Gitee Repository

```
用户: 转换 Gitee 的这个项目:
https://gitee.com/mindspore/docs

我会:
✅ Use Gitee API
✅ Extract Chinese documentation
✅ Generate bilingual skill if needed
```

---

## Implementation Details

### Tools Used

This skill ONLY uses OpenCode/Claude Code built-in tools:

| Tool | Purpose |
|------|---------|
| `webfetch` | Fetch API content from GitHub/GitLab/Gitee |
| `bash` | Execute curl for fallback API calls |
| `read` | Read local files |
| `write` | Write generated SKILL.md files |
| `grep` | Search local patterns |
| Your LLM | Analyze and generate documentation |

### API Calls Made

For each repository:

1. **GET Repository Metadata**
   ```bash
   curl https://api.github.com/repos/{owner}/{repo}
   ```

2. **GET README** (tries multiple branches)
   ```bash
   curl https://api.github.com/repos/{owner}/{repo}/readme
   ```

3. **GET File Tree**
   ```bash
   curl https://api.github.com/repos/{owner}/{repo}/contents/
   ```

4. **Key Files** (package.json, docs/*.md, etc.)

### Rate Limit Handling

- **Rotation**: Auto-switch mirrors on 3+ failures
- **Backoff**: Exponential delay (1s, 2s, 4s, 8s)
- **Retries**: Max 5 attempts per endpoint
- **Concurrency**: Max 3 parallel requests

---

## Troubleshooting

### "All mirrors failed"

**Cause**: Network issues or all endpoints blocked

**Solutions**:
- Check internet connection
- Verify repository exists and is public
- Try a different repository
- Use VPN if in China

### "Repository not found"

**Caus
