#!/bin/bash
# Hybrid LLM with GitHub Copilot - Installer
# Supports: Linux, macOS

set -e

echo "════════════════════════════════════════════════════════"
echo "  Hybrid LLM with GitHub Copilot - Installer"
echo "  © 2025 Barrer Software"
echo "════════════════════════════════════════════════════════"
echo ""

# Check prerequisites
echo "[1/6] Checking prerequisites..."

# Check GitHub CLI
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) not found"
    echo "Install from: https://cli.github.com/"
    exit 1
fi

# Check gh auth
if ! gh auth status &> /dev/null; then
    echo "❌ GitHub CLI not authenticated"
    echo "Run: gh auth login"
    exit 1
fi

echo "✓ GitHub CLI found and authenticated"

# Install Ollama if not present
echo ""
echo "[2/6] Checking Ollama..."
if ! command -v ollama &> /dev/null; then
    echo "Installing Ollama..."
    curl -fsSL https://ollama.com/install.sh | sh
else
    echo "✓ Ollama already installed"
fi

# Pull local model
echo ""
echo "[3/6] Pulling local model (776 MB)..."
ollama pull deepseek-coder:1.3b

# Create directories
echo ""
echo "[4/6] Creating directories..."
mkdir -p ~/bin
mkdir -p ~/.config/hybrid-llm
mkdir -p ~/.local/share/hybrid-llm/{logs,cache,training}

# Install scripts
echo ""
echo "[5/6] Installing scripts..."

# Copy ask command
cp scripts/ask ~/bin/ask
chmod +x ~/bin/ask

# Copy memory-query
cp scripts/memory-query ~/bin/memory-query
chmod +x ~/bin/memory-query

# Copy ai-stats
cp scripts/ai-stats ~/bin/ai-stats
chmod +x ~/bin/ai-stats

# Initialize memory database
sqlite3 ~/.local/share/hybrid-llm/memory.db < scripts/init-db.sql

# Create config
cat > ~/.config/hybrid-llm/config << 'CONFIG'
[local]
model=deepseek-coder:1.3b

[routing]
simple_threshold=10
local_min_response=20

[memory]
database=~/.local/share/hybrid-llm/memory.db
update_interval=600
CONFIG

# Add to PATH if needed
echo ""
echo "[6/6] Updating PATH..."
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
    echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc 2>/dev/null || true
    echo "✓ Added ~/bin to PATH (restart shell)"
else
    echo "✓ ~/bin already in PATH"
fi

echo ""
echo "════════════════════════════════════════════════════════"
echo "  ✅ Installation Complete!"
echo "════════════════════════════════════════════════════════"
echo ""
echo "Commands available:"
echo "  ask \"your question\"    - Smart AI assistant"
echo "  ai-stats                 - View usage statistics"
echo "  memory-query status      - Check current tasks"
echo ""
echo "Try it:"
echo "  ask \"what is the grep flag for recursive?\""
echo ""
echo "Documentation: https://github.com/barrersoftware/hybrid-llm-copilot"
echo ""
