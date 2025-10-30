# Third-Party Software Attribution & Legal Notices

This file contains all required attributions, copyright notices, and trademark acknowledgments for software and services used by this project.

---

## ⚠️ Important Disclaimer

**This project ("Hybrid LLM with GitHub Copilot") is:**
- A **client-side wrapper/router** that directs queries to appropriate tools
- **NOT** a modification, fork, or redistribution of any proprietary software
- **NOT** affiliated with, endorsed by, or sponsored by any listed companies
- **ONLY** using publicly available, official tools and APIs

---

## 🔧 What This Tool Actually Does

This is a **smart routing script** that:
1. Analyzes your query (simple vs complex)
2. Routes to the appropriate tool:
   - Local queries → Ollama (installed separately by user)
   - Complex queries → GitHub CLI `gh` (installed separately by user)
   - Status queries → Local SQLite database (our code)

**We provide:** Routing logic, memory database, usage statistics (all MIT licensed)

**We do NOT provide:** GitHub Copilot, Ollama, or any LLM models

---

## 📋 Required Third-Party Software

To use this tool, users must install these separately:

### 1. GitHub CLI (`gh`)

**Copyright:** © GitHub, Inc. (a Microsoft company)  
**License:** MIT License  
**Source:** https://github.com/cli/cli  
**Terms:** https://docs.github.com/en/site-policy/github-terms/github-terms-of-service  

**Trademarks:**
- GitHub® is a registered trademark of GitHub, Inc.
- GitHub Copilot® is a registered trademark of GitHub, Inc.
- Microsoft® is a registered trademark of Microsoft Corporation

**What we use:**
- Command: `gh copilot suggest` (official CLI command)
- Command: `gh copilot explain` (official CLI command)

**User requirements:**
- Valid GitHub Copilot subscription (Pro or Business)
- Authenticated via `gh auth login`
- Compliance with GitHub Copilot Terms of Service
- Compliance with GitHub Terms of Service

**Important:** Users must have their own subscription. This tool does NOT bypass, circumvent, or provide access to GitHub Copilot.

---

### 2. Ollama

**Copyright:** © Ollama, Inc.  
**License:** MIT License  
**Source:** https://github.com/ollama/ollama  
**Trademark:** Ollama™ is a trademark of Ollama, Inc.

**What we use:**
- Command: `ollama run <model>` (official CLI command)
- Models downloaded separately by user

**User requirements:**
- Users install Ollama themselves
- Users download models themselves (free)
- Compliance with Ollama's terms

**Important:** We do NOT redistribute Ollama or any models.

---

### 3. DeepSeek Coder (via Ollama)

**Copyright:** © DeepSeek AI  
**License:** Model-specific license (free for use via Ollama)  
**Source:** https://github.com/deepseek-ai/DeepSeek-Coder  
**Website:** https://www.deepseek.com/

**What we use:**
- Model: `deepseek-coder:1.3b` (downloaded via Ollama by user)

**User requirements:**
- Users download model via Ollama
- Compliance with DeepSeek's terms

**Important:** We do NOT redistribute this model.

---

### 4. Claude (via GitHub Copilot)

**Copyright:** © Anthropic, PBC  
**Trademark:** Claude™ is a trademark of Anthropic, PBC  
**Website:** https://www.anthropic.com/

**What we use:**
- Accessed indirectly via GitHub Copilot
- We have NO direct access to Claude
- GitHub Copilot uses Claude 3.5 Sonnet as its backend

**User requirements:**
- Valid GitHub Copilot subscription
- Anthropic's terms apply via GitHub Copilot

**Important:** We do NOT have access to, modify, or redistribute Claude in any way.

---

### 5. SQLite

**Copyright:** Public Domain  
**Source:** https://www.sqlite.org/  
**License:** Public Domain (no restrictions)

**What we use:**
- Local database for memory system
- Standard SQLite commands

**Important:** SQLite is public domain software.

---

## 🔒 What This Project Does NOT Do

To be absolutely clear:

❌ **Does NOT modify** GitHub Copilot  
❌ **Does NOT modify** Ollama  
❌ **Does NOT modify** any LLM models  
❌ **Does NOT redistribute** any proprietary software  
❌ **Does NOT bypass** authentication or payments  
❌ **Does NOT reverse engineer** any APIs  
❌ **Does NOT access** GitHub/Microsoft/Anthropic servers directly  
❌ **Does NOT store or transmit** user data to any third party  
❌ **Does NOT circumvent** any Terms of Service  

---

## ✅ What This Project DOES Do

To be absolutely clear:

✅ **Provides** routing logic (our code, MIT licensed)  
✅ **Calls** official CLI commands (`gh`, `ollama`)  
✅ **Maintains** local SQLite database (your data only)  
✅ **Displays** usage statistics locally  
✅ **Requires** users to install and configure tools themselves  
✅ **Requires** users to have valid subscriptions/licenses  
✅ **Respects** all Terms of Service  

---

## 📜 License & Copyright

### This Project's Code

**Copyright:** © 2025 Barrer Software  
**License:** MIT License  

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

**What is MIT licensed:**
- Our routing scripts (`ask`, `ai-stats`, `memory-query`)
- Our installation scripts (`install.sh`, `install.ps1`)
- Our documentation
- Our SQLite database schema

**What is NOT MIT licensed:**
- GitHub Copilot (proprietary)
- GitHub CLI (MIT, but separate project)
- Ollama (MIT, but separate project)
- DeepSeek models (separate license)
- Claude (proprietary)

---

## ⚖️ Compliance Statement

This project complies with:

✅ **GitHub Terms of Service**  
✅ **GitHub Copilot Terms of Service**  
✅ **Microsoft Terms of Use**  
✅ **Anthropic Terms of Service** (via GitHub Copilot)  
✅ **Ollama License** (MIT)  
✅ **DeepSeek License**  

We are a **client-side tool** that helps users organize their own queries to tools they've already installed and paid for.

---

## 📞 Contact for Legal Questions

If you have concerns about licensing or compliance:

**Barrer Software**  
Email: legal@barrersoftware.com  

**GitHub/Microsoft**  
For GitHub Copilot terms: https://github.com/features/copilot/terms  

**Anthropic**  
For Claude terms: https://www.anthropic.com/legal  

---

## 🙏 Acknowledgments

We are grateful to these companies for creating excellent tools:

- **GitHub & Microsoft** - For GitHub Copilot and GitHub CLI
- **Anthropic** - For Claude, which powers GitHub Copilot
- **Ollama team** - For making local LLMs accessible
- **DeepSeek AI** - For excellent coding models
- **SQLite team** - For reliable database software

Without their work, this project wouldn't exist. We respect their intellectual property and encourage users to support these companies by using their services legally and ethically.

---

**Last Updated:** 2025-10-30  
**Version:** 1.0
