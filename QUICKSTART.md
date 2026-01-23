# 🚀 快速开始

## 5分钟上手 repo2skill

### 步骤1: 安装 Skill

```bash
# 复制到全局目录(推荐)
mkdir -p ~/.config/opencode/skills
cp -r .opencode/skills/repo2skill ~/.config/opencode/skills/

# 或者复制到 Claude 兼容目录
mkdir -p ~/.claude/skills
cp -r .opencode/skills/repo2skill ~/.claude/skills/
```

### 步骤2: 重启 OpenCode/Claude Code

重启你的 AI 工具,确保 repo2skill 被加载

### 步骤3: 开始使用!

在对话中输入任意仓库 URL:

```
帮我把这个仓库转成技能：https://github.com/vercel/next.js
```

就这么简单! 🎉

---

## 支持的平台

✅ GitHub - `https://github.com/user/repo`  
✅ GitLab - `https://gitlab.com/user/repo`  
✅ Gitee - `https://gitee.com/user/repo`

## 批量转换

```
帮我转换这几个仓库:
- https://github.com/facebook/react
- https://github.com/vercel/next.js
- https://gitee.com/mindspore/docs
```

## 生成的技能包含

- ✅ 项目概述
- ✅ 安装指南
- ✅ 使用示例
- ✅ API 参考
- ✅ 配置说明
- ✅ 开发指南
- ✅ FAQ
- ✅ 故障排除

## 特性

- 🌐 多镜像站自动轮换(8+镜像)
- 🔄 速率限制自动处理
- 📖 使用你配置的 LLM(Claude/GPT/Ollama)
- 📦 零依赖,零安装
- ⚡ 并发抓取,快速生成

## 不需要

❌ npm install  
❌ API Keys  
❌ 配置文件  
❌ 任何外部依赖

所有功能都使用 OpenCode/Claude Code 的内置工具和你已配置的 LLM!

---

**就是这样! 开始转换仓库吧!** 🎯
