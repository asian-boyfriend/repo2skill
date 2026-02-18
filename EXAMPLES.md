# Usage Examples

This document shows real-world examples of using repo2skill.

## Example 1: Convert a Popular Framework

### Input
```
Convert this repository into a skill: https://github.com/vercel/next.js
```

### Expected Behavior

1. **Parsing** 
   - Detects: GitHub, owner=vercel, repo=next.js
   - URL validated

2. **Data Collection**
   - Fetches repo metadata (stars: ~125k, language: TypeScript)
   - Gets README.md (~8KB)
   - Retrieves file tree (main branch)
   - Extracts key docs (docs/, CONTRIBUTING.md, etc.)

3. **AI Analysis**
   - Analyzes: React framework for SSR web apps
   - Features: File routing, API routes, Image optimization
   - Extracts: Installation commands, usage examples

4. **Generated Skill**
   - Name: `nextjs-skill`
   - Sections: Overview, Installation, Usage, API, Testing, FAQ
   - Size: ~400-600 lines

5. **Installation**
   - User chooses: `~/.config/opencode/skills/nextjs-skill/SKILL.md`
   - File written successfully

### Output
A comprehensive Next.js documentation skill ready to use!

---

## Example 2: Convert a Small Utility Library

### Input
```
Convert this library into a skill: https://github.com/user/my-utils
```

### Expected Behavior

1. **Lightweight Generation**
   - Focused on usage examples
   - API reference for main functions
   - Quick start guide
   - ~200-300 lines

2. **Special Considerations**
   - May skip complex sections if not applicable
   - Focus on practical usage
   - Include all public APIs

---

## Example 3: Batch Conversion

### Input
```
Convert these repositories:
- https://github.com/anthropics/anthropic-sdk-typescript
- https://gitlab.com/gitlab-org/gitlab
- https://gitee.com/mindspore/docs
```

### Expected Behavior

1. **Parallel Processing**
   - Processes all 3 repos concurrently
   - Uses different mirrors for each
   - Overall time: ~2-4 minutes

2. **Individual Skills**
   - `anthropic-sdk-skill`
   - `gitlab-skill`
   - `mindspore-docs-skill`

3. **Installation**
   - User chooses location for each
   - Or all installed to same directory

---

## Example 4: Gitee Repository

### Input
```
Convert this Gitee project into a skill:
https://gitee.com/mindspore/docs
```

### Expected Behavior

1. **Platform Detection**
   - Detects: Gitee
   - Uses Gitee API v5
   - Native Chinese support

2. **Chinese Content**
   - Preserves Chinese documentation
   - May generate bilingual skill
   - Handles character encoding properly

3. **Performance**
   - Faster access in China
   - No mirror rotation needed

---

## Example 5: Repository with No README

### Input
```
Convert this project into a skill: https://github.com/user/code-only-repo
```

### Expected Behavior

1. **Fallback Strategy**
   - No README detected
   - Analyzes file structure instead
   - Looks docs/ directory
   - Checks for package.json, README.txt, etc.

2. **Limited but Complete**
   - Generates skill based on code analysis
   - Focuses on file structure and exports
   - May show warnings: "No README found"

---

## Example 6: Large Repository

### Input
```
Convert this large project into a skill: https://github.com/facebook/react
```

### Expected Behavior

1. **Extended Processing**
   - Takes longer (~3-5 minutes)
   - Processes larger file tree (10k+ files)
   - Might analyze only key directories

2. **Optimized Output**
   - Focuses on main features
   - May skip less important files
   - Generates comprehensive but focused skill

---

## Example 7: Invalid URL

### Input
```
Convert this into a skill: https://not-a-real-site.com/user/repo
```

### Expected Behavior

1. **URL Validation**
   - Fails parsing: "not a recognized platform"
   - Asks user to verify URL

2. **Supported Formats**
   - ✅ https://github.com/user/repo
   - ✅ github.com/user/repo
   - ✅ https://gitlab.com/user/repo
   - ✅ https://gitee.com/user/repo
   - ❌ https://not-real.com/user/repo

---

## Example 8: Private Repository (with token)

### Setup
```bash
export GITHUB_TOKENS="ghp_xxx,ghp_yyy"
```

### Input
```
Convert this private repository into a skill: https://github.com/user/private-repo
```

### Expected Behavior

1. **Authentication**
   - Uses GITHUB_TOKENS from environment
   - Tries rotation through multiple tokens
   - Accesses private repository successfully

2. **Process**
   - Same as public repository
   - Private content preserved
   - Skill marked as private in metadata

---

## Example 9: All Mirrors Failed

### Input
```
Convert this repository into a skill: https://github.com/user/repo
```

### Error Scenario

1. **Mirror Exhaustion**
   - All 8 GitHub mirrors fail
   - Network issues or blocks

2. **User Guidance**
   - Error: "All mirrors failed"
   - Suggestions:
     - Check internet connection
     - Try using VPN
     - Wait and retry
     - Verify repository URL

---

## Example 10: Installation Paths

### After Generation

The skill asks: *"Where should I save the generated skill?"*

### Option 1: Project Local
```
Path: ./.opencode/skills/nextjs-skill/SKILL.md
Use case: This project only
```

### Option 2: Global User
```
Path: ~/.config/opencode/skills/nextjs-skill/SKILL.md
Use case: All projects (OpenCode)
```

### Option 3: Claude Compatible
```
Path: ~/.claude/skills/nextjs-skill/SKILL.md
Use case: Works in both OpenCode and Claude Code
```

---

## Tips From Examples

### For Best Results

1. **Start Small** - Try simple repos first
2. **Public Repos** - Don't need tokens
3. **Well-Documented** - Better input = better output
4. **Check URL** - Ensure correct platform
5. **Internet** - Stable connection needed

### Common Failures

1. **Typo in URL** - Double-check spelling
2. **Private without token** - Need GITHUB_TOKENS
3. **All mirrors down** - Network or VPN issues
4. **Very large repo** - Takes longer, might timeout

---

## Performance Reference

| Repo Size | Files | Expected Time |
|-----------|-------|---------------|
| Small | < 500 | 30-60s |
| Medium | 500-2k | 1-2min |
| Large | 2k-10k | 2-5min |
| Huge | 10k+ | 5-10min |

---

**Try it yourself and convert any repository into a skill!** 🚀
