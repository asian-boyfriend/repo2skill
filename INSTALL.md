# Installation Guide

## Quick Installation

### Option 1: Global Installation (Recommended for all projects)

```bash
# Copy to global OpenCode skills directory
mkdir -p ~/.config/opencode/skills
cp -r repo2skill ~/.config/opencode/skills/

# Or for Claude Code compatibility
mkdir -p ~/.claude/skills
cp -r repo2skill ~/.claude/skills/
```

### Option 2: Project-specific Installation

```bash
# Copy to your project
mkdir -p your-project/.opencode/skills
cp -r repo2skill your-project/.opencode/skills/
```

### Option 3: From GitHub (when published)

```bash
# Clone or download the repository
git clone https://github.com/yourusername/repo2skill.git
cd repo2skill

# Then use one of the options above to copy the repo2skill directory
cp -r repo2skill ~/.config/opencode/skills/
```

## Verify Installation

Start OpenCode or Claude Code and check that repo2skill appears in available skills.

## First Use

Once installed, simply tell your AI assistant:

```
Convert this repository into a skill: https://github.com/user/repo
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
