# Hybrid LLM with GitHub Copilot

> ⚠️ **IMPORTANT:** This is a **client-side wrapper** that routes queries to tools you install separately. It does NOT include, modify, or redistribute GitHub Copilot, Ollama, or any LLM models. You must have a valid GitHub Copilot subscription to use this tool. See [ATTRIBUTION.md](ATTRIBUTION.md) for full legal details.

**A smart AI assistant for everyone - from solo entrepreneurs to developers - combining local LLMs with GitHub Copilot for faster, private, and cost-effective AI assistance.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-blue)](https://github.com/barrersoftware/hybrid-llm-copilot)

---

---

## 🎯 Who Is This For?

### Perfect For:
- 🚀 **Entrepreneurs & Small Business Owners** - Need quick answers without paying per query
- 💼 **Freelancers** - Managing multiple projects, need fast context switching
- 👨‍💻 **Developers** - Building, debugging, learning new technologies
- 📚 **Students** - Learning to code, need instant syntax help
- 🎨 **Content Creators** - Researching, fact-checking, getting ideas
- 🔧 **IT Professionals** - Server management, troubleshooting, scripting

### Why?
You're already paying for GitHub Copilot. This makes it **faster** for simple queries while keeping the quality high for complex ones, **plus** adds memory so it never forgets what you're working on.

---

## ✨ What Is This?

A **memory-aware hybrid AI system** that intelligently routes queries between:

1. **Local Model** (DeepSeek Coder) - Fast, free, private
2. **GitHub Copilot** (Claude Sonnet 3.5) - Powerful, context-aware  
3. **Memory Database** (SQLite) - Remembers your work, prevents looping

### Smart Routing

- 🔹 **Simple queries** → Local model (instant, < 1 second)
- 🔶 **Complex queries** → GitHub Copilot (2-5 seconds)
- 🧠 **Status queries** → Memory database (milliseconds)
- 🔄 **Auto-fallback** → If local fails, uses Copilot

---

## ✨ Features

### Core Features
- ✅ **Smart routing** based on query complexity
- ✅ **Memory-aware** - queries SQLite database for context
- ✅ **Cross-platform** - Linux, macOS, Windows
- ✅ **Loop prevention** - remembers recent work
- ✅ **Auto-fallback** - always get good answers
- ✅ **Usage statistics** - track routing patterns
- ✅ **Learning-ready** - can fine-tune over time

### Privacy & Cost
- ✅ **Private**: Simple queries stay local (never sent anywhere)
- ✅ **Cost-effective**: Uses GitHub Copilot you already pay for
- ✅ **No extra subscriptions**: Just needs Copilot Pro/Business
- ✅ **Offline capable**: Local model works without internet

---

## �� Quick Start

### Prerequisites

- [GitHub Copilot](https://github.com/features/copilot) subscription (Pro or Business) - $10-19/month
- [GitHub CLI](https://cli.github.com/) (`gh`) installed and authenticated
- [Ollama](https://ollama.com/) for local models (free, open source)

### Installation

#### Linux / macOS

```bash
# Clone repository
git clone https://github.com/barrersoftware/hybrid-llm-copilot.git
cd hybrid-llm-copilot

# Run installer
chmod +x install.sh
./install.sh
```

#### Windows

```powershell
# Clone repository
git clone https://github.com/barrersoftware/hybrid-llm-copilot.git
cd hybrid-llm-copilot

# Run installer
.\install.ps1
```

### First Use

```bash
# Ask a simple question (local - instant)
ask "what is the grep flag for recursive search?"

# Ask about your current work (memory - instant)
ask "what am I currently working on?"

# Ask something complex (Copilot - high quality)
ask "create a business plan outline for a SaaS startup"

# View statistics
ai-stats
```

---

## 💡 Real-World Use Cases

### For Entrepreneurs
```bash
ask "create a pitch deck outline"
ask "what's my project status?"
ask "draft a customer email about shipping delays"
```

### For Developers
```bash
ask "what's the git command to undo last commit?"
ask "is my build done?"
ask "debug this error: connection refused"
```

### For Students
```bash
ask "explain Python loops"
ask "what homework did I just complete?"
ask "create a study schedule for 5 subjects"
```

### For Content Creators
```bash
ask "research topics on sustainable tech"
ask "what articles have I written this week?"
ask "generate 10 YouTube video ideas about cooking"
```

---

## 📊 How It Works

### Query Flow

```
User Query
    ↓
┌─────────────────┐
│ Classify Query  │
└─────────────────┘
         ↓
    ┌────┴────┬──────────┬─────────┐
    ↓         ↓          ↓         ↓
┌────────┐ ┌──────┐ ┌────────┐ ┌────────┐
│Memory  │ │Local │ │Copilot │ │ GitHub │
│Check   │ │Model │ │ CLI    │ │ API    │
└────────┘ └──────┘ └────────┘ └────────┘
    ↓         ↓          ↓         ↓
    └─────────┴──────────┴─────────┘
              ↓
         Response
```

### Routing Logic

**Memory Database Queries** (Instant):
- "What am I working on?"
- "Is my project done?"
- "What did I just complete?"

**Local Model** (< 1 second):
- Command syntax: "how to copy files?"
- Simple lookups: "what is HTML?"
- Basic questions: "list git commands"

**GitHub Copilot** (2-5 seconds):
- Business tasks: "create invoice template"
- Complex generation: "write marketing email"
- Debugging: "why isn't this working?"

---

## 🧠 Memory System

### What It Remembers

The system maintains a SQLite database with:

- **Active tasks** - What you're currently working on
- **Recent completions** - What was just done
- **Command history** - Recent actions taken
- **Project state** - Current status
- **Notes & reminders** - Things to remember

### Loop Prevention

**Without Memory:**
```
You: "What's the status of my project?"
AI: "I don't have that information..."
You: [5 minutes later] "What's the status?"
AI: "I don't have that information..." (frustrating!)
```

**With Memory:**
```
You: "What's the status of my project?"
AI: "Project XYZ: 75% complete, last updated 10 minutes ago"
You: [5 minutes later] "What's the status?"
AI: "Project XYZ: 78% complete, just deployed to staging"
```

---

## 📖 Usage Examples

### Example 1: Quick Syntax Lookup

```bash
$ ask "how do I compress a folder?"
🔹 [Local Model]
tar -czf archive.tar.gz folder_name/
```

### Example 2: Business Task

```bash
$ ask "write a professional email declining a meeting"
🔶 [GitHub Copilot]
[Full professional email template with warm tone]
```

### Example 3: Status Query

```bash
$ ask "what projects am I working on?"
🧠 [Memory Database]
Active projects:
- Website redesign (80% complete)
- Client proposal (draft ready)
- Blog post (in review)
```

### Example 4: Context-Aware Help

```bash
$ ask "how do I test this?"
🔶 [Copilot with Memory Context]
[Context from memory: You're working on website redesign]
[Specific testing instructions for YOUR project]
```

---

## 🛠️ Configuration

### Local Model Options

Edit `~/.config/hybrid-llm/config` (Linux/macOS) or `%APPDATA%\hybrid-llm\config` (Windows):

```ini
[local]
model=deepseek-coder:1.3b
# Other options: codellama:7b, qwen2.5-coder:3b

[routing]
simple_threshold=10  # Words to consider query "simple"
local_min_response=20  # Min chars before fallback

[memory]
database=~/.local/share/hybrid-llm/memory.db
update_interval=600  # 10 minutes
```

---

## 📈 Statistics

Track your usage and savings:

```bash
$ ai-stats

════════════════════════════════════════════════════════
  Hybrid AI Statistics
════════════════════════════════════════════════════════

Total Queries: 142

Routing:
  Memory:  23 (16.2%)  - Instant from database
  Local:   67 (47.2%)  - Free local model
  Copilot: 52 (36.6%)  - GitHub Copilot

Time Saved:
  Local handled: 67 queries instantly
  Average time saved: ~2 seconds per query
  Total: ~2.2 minutes saved this week

Cost Efficiency:
  Using Copilot Pro: $10/month (unlimited)
  Without hybrid: Would need faster responses = frustration
  With hybrid: 63% queries instant = productivity boost
════════════════════════════════════════════════════════
```

---

## 🔧 Commands

### Main Commands

```bash
ask "query"              # Smart routing
explain "command"        # Always use Copilot for detailed explanation
ai-stats                 # Show usage statistics
memory-query status      # Check current tasks
memory-query recent      # Recent activity
```

### Memory Commands

```bash
hybrid-llm memory query           # Query current state
hybrid-llm memory add-task NAME   # Add active task
hybrid-llm memory complete NAME   # Mark task complete
hybrid-llm memory recent          # Recent activity
```

---

## 🌐 Platform Support

| Platform | Status | Notes |
|----------|--------|-------|
| Linux | ✅ Full | Bash scripts, systemd integration |
| macOS | ✅ Full | Bash scripts, launchd integration |
| Windows | ✅ Full | PowerShell scripts, Task Scheduler |

---

## 🤝 Contributing

Contributions welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md)

---

## ⚖️ Legal & Attribution

### Trademarks & Copyright

This project integrates with and references the following trademarked products and services:

- **GitHub®** and **GitHub Copilot®** are registered trademarks of **GitHub, Inc.** (a subsidiary of Microsoft Corporation)
- **Microsoft®** is a registered trademark of **Microsoft Corporation**
- **Anthropic** and **Claude™** are trademarks of **Anthropic, PBC**
- **Ollama™** is a trademark of Ollama, Inc.
- **DeepSeek** is a trademark of DeepSeek AI

### Important Disclaimers

⚠️ **This project is NOT:**
- Affiliated with, endorsed by, or sponsored by GitHub, Microsoft, Anthropic, or any LLM provider
- A modification or fork of GitHub Copilot
- Sharing, redistributing, or reverse-engineering any proprietary systems
- Circumventing any terms of service

✅ **This project IS:**
- An independent tool that **uses** GitHub Copilot via its official CLI
- A client-side router that directs queries to appropriate services
- Fully compliant with GitHub Copilot's Terms of Service
- Using only official, documented APIs and CLI tools
- Open source (MIT License) for the routing logic only

### What This Tool Does

This tool acts as a **smart wrapper** around official tools:
1. **GitHub CLI (`gh`)** - Official GitHub command-line tool
2. **Ollama** - Open source local LLM runtime
3. **SQLite** - Open source database

It does NOT:
- ❌ Modify GitHub Copilot
- ❌ Access GitHub's servers directly
- ❌ Reverse engineer any APIs
- ❌ Redistribute proprietary code
- ❌ Bypass authentication or payment

It DOES:
- ✅ Route queries to the appropriate tool (local or Copilot)
- ✅ Use GitHub Copilot via official `gh` CLI commands
- ✅ Maintain a local memory database (your data only)
- ✅ Provide usage statistics

### Requirements

To use this tool, you MUST:
- ✅ Have a valid GitHub Copilot subscription (Pro or Business)
- ✅ Authenticate via official GitHub CLI
- ✅ Comply with [GitHub Copilot Terms of Service](https://github.com/features/copilot/terms)
- ✅ Comply with [GitHub Terms of Service](https://docs.github.com/en/site-policy/github-terms/github-terms-of-service)

### Data & Privacy

- **Local model queries**: Stay 100% on your computer (Ollama)
- **Copilot queries**: Sent to GitHub/Microsoft/Anthropic per their terms
- **Memory database**: Stored locally, never uploaded
- **No tracking**: This tool collects no telemetry

### License

This project's **routing logic and scripts** are licensed under the MIT License.

The underlying services have their own licenses:
- **GitHub Copilot**: Proprietary (subscription required)
- **Ollama**: MIT License
- **DeepSeek Coder**: Proprietary (free to use via Ollama)
- **SQLite**: Public Domain

---

## 📄 MIT License

```
MIT License

Copyright (c) 2025 Barrer Software

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 🙏 Acknowledgments

This project would not be possible without:

- **GitHub & Microsoft** - For creating GitHub Copilot and providing official CLI access
- **Anthropic** - For developing Claude (Sonnet 3.5), which powers GitHub Copilot
- **Ollama team** - For making local LLMs accessible and easy to run
- **DeepSeek AI** - For creating excellent open coding models
- **Open source community** - For tools, libraries, and inspiration

Thank you for making AI accessible to everyone! 🙏

---

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/barrersoftware/hybrid-llm-copilot/issues)
- **Discussions**: [GitHub Discussions](https://github.com/barrersoftware/hybrid-llm-copilot/discussions)
- **Email**: opensource@barrersoftware.com

---

## 🚀 Roadmap

- [x] Core routing system
- [x] Memory database integration
- [x] Linux support
- [x] macOS support
- [x] Windows support
- [ ] Web UI dashboard
- [ ] Weekly fine-tuning pipeline
- [ ] VSCode extension
- [ ] Response caching
- [ ] Multi-model support
- [ ] Business workflow templates

---

**Built with ❤️ by [Barrer Software](https://barrersoftware.com)**

*Making AI assistance faster, smarter, and more accessible to everyone.*

---

**Disclaimer**: This is an independent open-source project. Not affiliated with GitHub, Microsoft, Anthropic, or any LLM provider.
