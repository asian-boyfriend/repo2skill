# Installation Guide

## Quick Installation

### Option 1: Global Installation (Recommended for all projects)

```bash
# Copy to global OpenCode skills directory
mkdir -p ~/.config/opencode/skills
cp -r .opencode/skills/repo2skill ~/.config/opencode/skills/

# Or for Claude Code compatibility
mkdir -p ~/.claude/skills
cp -r .opencode/skills/repo2skill ~/.claude/skills/
```

### Option 2: Project-specific Installation

```bash
# Copy to your project
mkdir -p your-project/.opencode/skills
cp -r .opencode/skills/repo2skill your-project/.opencode/skills/
```

### Option 3: From GitHub (when published)

```bash
# Clone the skill (this is the repo itself - no clone needed!)
# The repo2skill directory IS the skill

# Just copy it to your skills location
cp -r . ~/.config/opencode/skills/repo2skill
```

## Verify Installation

Start OpenCode or Claude Code and check that repo2skill appears in available skills.

## First Use

Once installed, simply tell your AI assistant:

```
帮我把这个仓库转成技能：https://github.com/user/repo
```

That's all you need to do!

## Requirements

- OpenCode or Claude Code installed
- Any configured LLM (Claude, GPT, Ollama, etc.)
- No additional packages or API keys needed

## Troubleshooting

### Skill not loading

1. Verify you copied to the correct directory
2. Check that the SKILL.md file exists
3. Restart OpenCode/Claude Code
4. Check file permissions

### "Skill not found" error

1. Ensure you're in a supported environment (OpenCode/Claude Code)
2. Verify the skill path matches your installation choice
3. Check for typos in the skill name: `repo2skill`

### LLM errors

This skill uses your configured LLM. Check your OpenCode/Claude Code settings if you encounter LLM-related errors.
