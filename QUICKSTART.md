# 🚀 Quick Start

## Get Started with repo2skill in 5 Minutes

### Step 1: Install the Skill

```bash
# Copy to global directory (recommended)
mkdir -p ~/.config/opencode/skills
cp -r repo2skill ~/.config/opencode/skills/

# Or copy to Claude compatible directory
mkdir -p ~/.claude/skills
cp -r repo2skill ~/.claude/skills/
```

### Step 2: Restart OpenCode/Claude Code

Restart your AI tool to ensure repo2skill is loaded

### Step 3: Start Using!

Enter any repository URL in the conversation:

```
Convert this repository into a skill: https://github.com/vercel/next.js
```

That's it! 🎉

---

## Supported Platforms

✅ GitHub - `https://github.com/user/repo`  
✅ GitLab - `https://gitlab.com/user/repo`  
✅ Gitee - `https://gitee.com/user/repo`

## Batch Conversion

```
Convert these repositories:
- https://github.com/facebook/react
- https://github.com/vercel/next.js
- https://gitee.com/mindspore/docs
```

## Generated Skills Include

- ✅ Project Overview
- ✅ Installation Guide
- ✅ Usage Examples
- ✅ API Reference
- ✅ Configuration Guide
- ✅ Development Guide
- ✅ FAQ
- ✅ Troubleshooting

## Features

- 🌐 Auto mirror rotation (8+ mirrors)
- 🔄 Rate limit handling
- 📖 Uses your configured LLM (Claude/GPT/Ollama)
- 📦 Zero dependencies, zero installation
- ⚡ Concurrent fetching, fast generation

## Not Required

❌ npm install  
❌ API Keys  
❌ Config files  
❌ Any external dependencies

All functionality uses OpenCode/Claude Code's built-in tools and your configured LLM!

---

**That's it! Start converting repositories!** 🎯
