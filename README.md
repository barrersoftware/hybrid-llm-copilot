# Hybrid LLM with GitHub Copilot

**A smart AI assistant that combines local LLMs with GitHub Copilot (Sonnet 3.5) for the best of both worlds.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-blue)](https://github.com/barrersoftware/hybrid-llm-copilot)

---

## 🎯 What Is This?

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
- ✅ **Private**: Simple queries stay local
- ✅ **Cost-effective**: Uses GitHub Copilot you already pay for
- ✅ **No extra subscriptions**: Just needs Copilot Pro/Business
- ✅ **Offline capable**: Local model works without internet

---

## 🚀 Quick Start

### Prerequisites

- [GitHub Copilot](https://github.com/features/copilot) subscription (Pro or Business)
- [GitHub CLI](https://cli.github.com/) (`gh`) installed and authenticated
- [Ollama](https://ollama.com/) for local models (optional but recommended)

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
# Ask a simple question (local)
ask "what is the grep flag for recursive search?"

# Ask something complex (Copilot)
ask "create a systemd service for monitoring"

# Check status (memory database)
ask "what am I currently working on?"

# View statistics
ai-stats
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
- Status questions: "what's running?", "is X done?"
- Context queries: "what did we just do?"
- Project state: "current build status?"

**Local Model** (< 1 second):
- Command syntax: "grep flags", "tar extract"
- Simple lookups: "git status command"
- Basic code snippets

**GitHub Copilot** (2-5 seconds):
- Complex generation: "create systemd service"
- Debugging: "why did my build fail?"
- Architecture: "design X system"

---

## 🧠 Memory System

### What It Remembers

The system maintains a SQLite database with:

- **Active tasks** - What you're currently working on
- **Recent completions** - What was just done
- **Command history** - Recent actions taken
- **System state** - Build progress, tool status
- **Restrictions** - Things not to do

### Loop Prevention

**Without Memory:**
```
You: "Is the build done?"
AI: "I don't know, let me help you check..."
You: "Is the build done?" (5 minutes later)
AI: "I don't know, let me help you check..." (repeats)
```

**With Memory:**
```
You: "Is the build done?"
AI: [Queries database] "Android build: Phase 2, 45% complete"
You: "Is the build done?" (5 minutes later)
AI: [Queries database] "Android build: Phase 2, 67% complete"
```

---

## 📖 Usage Examples

### Example 1: Quick Command Lookup

```bash
$ ask "what's the tar command to extract?"
🔹 [Local Model]
tar -xzf archive.tar.gz
```

### Example 2: Complex Task

```bash
$ ask "create a bash script to monitor a build"
🔶 [GitHub Copilot]
[Full script with monitoring, notifications, error handling]
```

### Example 3: Status Query

```bash
$ ask "what am I working on?"
🧠 [Memory Database]
Active tasks:
- Android APK Build (Phase 2: Building, 45%)
- Chromium build monitoring

Recent completions:
- GitHub release v131.0.6778.69 published
- Windows portable package created
```

### Example 4: Context-Aware Response

```bash
$ ask "how do I test the android build?"
🔶 [Copilot with Memory Context]
[Context from memory: Android v131.0.6778.69 building]
[Specific instructions for YOUR build]
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
database=~/.ai_memory.db
update_interval=600  # 10 minutes
```

### Memory Database

Initialize your own memory:

```bash
# Create database
hybrid-llm init-memory

# Add active task
hybrid-llm memory add-task "Building Project X"

# Mark task complete
hybrid-llm memory complete-task "Building Project X"

# Query memory
hybrid-llm memory query
```

---

## 📈 Statistics

Track your usage patterns:

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

Cost Savings:
  Local handled: 67 queries
  Would cost ~$0.67 if all Copilot

Last 5 queries:
  [2025-10-30 16:45] android build status (memory)
  [2025-10-30 16:42] grep recursive flag (local)
  [2025-10-30 16:38] create systemd service (copilot)
  [2025-10-30 16:35] what's running? (memory)
  [2025-10-30 16:30] tar extract syntax (local)
════════════════════════════════════════════════════════
```

---

## 🎓 Learning System (Coming Soon)

The system is designed to learn from your usage:

1. **Collect** - Saves successful Copilot responses
2. **Analyze** - Identifies patterns in your workflow
3. **Fine-tune** - Updates local model weekly
4. **Improve** - Local model gets better at YOUR tasks

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

### Development Setup

```bash
# Clone
git clone https://github.com/barrersoftware/hybrid-llm-copilot.git

# Install dev dependencies
pip install -r requirements-dev.txt

# Run tests
./test.sh
```

---

## 📄 License

MIT License - see [LICENSE](LICENSE)

---

## 🙏 Acknowledgments

- [GitHub Copilot](https://github.com/features/copilot) - Powered by Claude Sonnet 3.5
- [Ollama](https://ollama.com/) - Local model runtime
- [DeepSeek Coder](https://github.com/deepseek-ai/DeepSeek-Coder) - Excellent local coding model

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
- [ ] Confidence scoring

---

**Built with ❤️ by [Barrer Software](https://barrersoftware.com)**

*Making AI assistance faster, smarter, and more private.*
