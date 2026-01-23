# repo2skill

> 🤖 Convert GitHub/GitLab/Gitee repositories into comprehensive OpenCode Skills with one command

> ⚡ Zero dependencies - uses your configured LLM in OpenCode/Claude Code

---

## ✨ Features

- **Multi-Platform**: GitHub, GitLab, and Gitee support
- **AI-Powered**: Uses your OpenCode/Claude Code configured LLM
- **Mirror Rotation**: Auto-bypass rate limits with 8+ mirrors
- **Complete Documentation**: Generates full skills with installation, usage, API, FAQ
- **Zero Setup**: No API keys required, no packages to install

## 🚀 Quick Start

### Installation

1. Clone this repository or download the skill directory
2. Copy to your OpenCode/Claude Code skills directory:

```bash
# Option 1: Project-specific
mkdir -p your-project/.opencode/skills
cp -r repo2skill your-project/.opencode/skills/

# Option 2: Global (recommended)
mkdir -p ~/.config/opencode/skills
cp -r repo2skill ~/.config/opencode/skills/

# Option 3: Claude-compatible
mkdir -p ~/.claude/skills  
cp -r repo2skill ~/.claude/skills/
```

### Usage

Once installed, simply tell your AI assistant:

```
帮我把这个仓库转成技能：https://github.com/user/repo
```

That's it! The skill will:
1. Parse the repository URL
2. Fetch data from multiple mirror endpoints
3. Use your configured LLM to analyze the repository
4. Generate a complete SKILL.md file
5. Ask you where to save it

### Batch Conversion

Convert multiple repositories:

```
帮我转换这些仓库:
- https://github.com/vercel/next.js
- https://gitlab.com/gitlab-org/gitlab
- https://gitee.com/mindspore/docs
```

## 📁 Project Structure

```
repo2skill/
├── SKILL.md                    # Main skill file
├── references/                 # API documentation
│   ├── github-api.md          # GitHub API quick reference
│   ├── gitlab-api.md          # GitLab API quick reference
│   └── gitee-api.md           # Gitee API quick reference
└── scripts/                    # Utility scripts
    └── utils.sh               # Mirror rotation functions
```

## 🔧 How It Works

1. **URL Parsing**: Detects platform (GitHub/GitLab/Gitee) and extracts owner/repo
2. **Data Collection**: Fetches metadata, README, file tree via API
3. **Mirror Rotation**: Automatic endpoint switching for reliability
4. **AI Analysis**: Uses your LLM to understand and document the project
5. **Skill Generation**: Creates comprehensive SKILL.md with all sections

## 🌐 Supported Platforms

| Platform | Status | Mirrors |
|----------|--------|---------|
| GitHub | ✅ Full | 8 API + 5 Raw mirrors |
| GitLab | ✅ Full | Official + proxy |
| Gitee | ✅ Full | Native (fast in China) |

## 📖 Generated Skills Include

- Project overview and features
- Installation instructions
- Usage guide with examples
- API reference
- Configuration guide
- Development and contribution guide
- Testing information
- FAQ and troubleshooting
- Performance and security notes

## ⚙️ Configuration

### No Setup Required!

This skill uses:
- Your configured LLM (Claude/GPT/Ollama/etc.) from OpenCode/Claude Code settings
- Built-in tools (webfetch, bash, read, write)
- Zero external dependencies

### Optional: API Tokens

For private repositories or higher rate limits:

```bash
# GitHub (comma-separated for rotation)
export GITHUB_TOKENS="ghp_xxx,ghp_yyy"

# GitLab
export GITLAB_TOKENS="glpat_xxx,glpat_yyy"

# Gitee  
export GITEE_TOKEN="your_token"
```

## 🎯 Examples

### Convert a Popular Framework

```
帮我把这个仓库转成技能：https://github.com/facebook/react
```

This will generate a comprehensive React skill covering:
- Installation guides (npm, yarn, pnpm)
- Core concepts and API
- Component examples
- Hooks reference
- Testing guide
- Contributing guidelines

### Convert a Small Library

```
帮我把这个库转成技能：https://github.com/user/my-utils
```

Will generate focused documentation with:
- Usage examples
- API reference
- Quick start guide

## 🐛 Troubleshooting

| Problem | Solution |
|---------|----------|
| All mirrors failed | Check internet connection, verify URL |
| Repository not found | Verify repo exists and is public |
| Poor quality output | Choose repos with better documentation |
| Rate limit exceeded | Add API tokens or wait a few minutes |

## 💡 Tips

- ✅ Start with well-documented repositories
- ✅ Public repositories don't need tokens
- ✅ GitHub/GitLab have better API support than Gitee
- ✅ Retry if mirrors fail - auto-rotation works

## 📄 License

MIT License - feel free to use, modify, and distribute!

## 🤝 Contributing

1. Test on various repositories
2. Report issues and edge cases
3. Suggest new mirror endpoints
4. Improve documentation

---

**Built for the OpenCode/Claude Code ecosystem**

Made with ❤️ by the repo2skill team
