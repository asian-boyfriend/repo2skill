# Implementation Guide for repo2skill

This document explains how this skill works internally.

## Architecture

### Skill Structure
```
repo2skill/
├── SKILL.md              # Main skill definition (what you're reading)
├── references/           # API reference documents
│   ├── github-api.md
│   ├── gitlab-api.md
│   └── gitee-api.md
└── scripts/
    ├── utils.sh         # Helper bash functions
    └── .gitkeep
```

### How the Skill Executes

When a user asks to convert a repository:

1. **URL Parsing** (Language tool: Regex matching in skill instructions)
   - Detects platform (github/gitlab/gitee)
   - Extracts owner and repo name
   - Validates URL format

2. **Data Collection** (Tool: webfetch / bash curl)
   - Fetches repository metadata via API
   - Gets README content
   - Retrieves file tree
   - Extracts key documentation files
   
   Mirror rotation is built into the skill via retry logic

3. **AI Analysis** (Tool: Configured LLM in OpenCode/Claude Code)
   - Analyzes README and gathered content
   - Understands project structure
   - Identifies key features
   - Generates comprehensive documentation

4. **Skill Generation** (Tool: write)
   - Builds YAML frontmatter
   - Creates markdown sections
   - Writes SKILL.md to chosen location

## Implementation Details

### Mirror Rotation Logic

The skill instructs the AI to:
1. Try primary endpoint (api.github.com)
2. On failure (403/429/timeout), try next mirror
3. Use exponential backoff between retries
4. Retry up to 5 times per endpoint

Mirror priority is defined in references/github-api.md

### Rate Limit Handling

- Headers checked: X-RateLimit-Remaining, X-RateLimit-Reset
- When limit reached: switch mirrors or wait
- Wait time calculated from reset timestamp

### LLM Integration

The skill does NOT hardcode LLM provider:
- Uses whatever LLM is configured in OpenCode/Claude Code
- No API keys needed in the skill
- Works with Claude, GPT, Ollama, local models

### Tool Usage

Only built-in OpenCode/Claude Code tools are used:

| Tool | Purpose |
|------|---------|
| `skill` | Load this skill's instructions |
| `webfetch` | Fetch API responses |
| `bash` | Execute curl for fallback API calls |
| `read` | Read reference documents |
| `write` | Write generated SKILL.md |
| Configured LLM | Analyze and generate content |

## For Users Installing This Skill

### What Happens When You Use It

```
User: "帮我把这个仓库转成技能：https://github.com/user/repo"
```

**AI Process:**
1. Loads repo2skill skill instructions
2. Parses URL → detects GitHub, owner=user, repo=repo
3. Calls webfetch/bash to get repo data from mirrors
4. Retrieves README, metadata, file tree
5. Uses configured LLM (Claude/GPT/etc.) to analyze
6. Generates comprehensive SKILL.md with:
   - YAML frontmatter
   - Overview and features
   - Installation guide
   - Usage examples
   - API reference
   - Troubleshooting
   - Resources
7. Asks user where to save:
   - `./.opencode/skills/repo-name/SKILL.md`
   - `~/.config/opencode/skills/repo-name/SKILL.md`
   - `~/.claude/skills/repo-name/SKILL.md`
8. Writes the file
9. Done!

### Why It Works

- ✅ Pure markdown skill - no dependencies
- ✅ Uses your configured LLM
- ✅ Leverages built-in tools
- ✅ Mirror rotation built into prompts
- ✅ Works across OpenCode/Claude Code/Cursor

## Extending the Skill

To add features:

1. **New Mirror**: Add to references/github-api.md
2. **New Platform**: Create references/platform-api.md
3. **New LLM Prompts**: Add to SKILL.md instructions
4. **Helper Functions**: Add to scripts/utils.sh

## Debugging

If the skill doesn't work:

1. Check the skill is in correct directory
2. Verify OpenCode/Claude Code recognizes it
3. Check internet connection
4. Verify repository exists and is public
5. Check LLM provider is configured correctly

## Performance

Expected times:
- Small repo (< 500 files): 30-60s
- Medium repo (500-2k files): 1-2min
- Large repo (2k+ files): 2-5min

Factors affecting speed:
- Mirror response times
- Repository size
- README length
- LLM speed (model, provider)
- Network connectivity

## Security

- No user data sent to external services except open APIs
- No secrets stored in the skill
- Uses your trusted LLM provider
- HTTPS used for all API calls

## License

MIT - Feel free to modify and extend!
