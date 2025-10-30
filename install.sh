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
echo "[1/7] Checking prerequisites..."

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

# Check for GitHub Copilot extension
echo ""
echo "[2/7] Checking GitHub Copilot CLI extension..."
if gh extension list | grep -q copilot; then
    echo "✓ GitHub Copilot CLI extension already installed"
else
    echo "⚠️  GitHub Copilot CLI extension not found"
    echo ""
    echo "The hybrid system needs the GitHub Copilot CLI extension."
    echo "This requires a GitHub Copilot subscription (Pro or Business)."
    echo ""
    read -p "Install GitHub Copilot CLI extension? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Installing gh copilot extension..."
        gh extension install github/gh-copilot
        echo "✓ Installed!"
    else
        echo "⚠️  Skipping Copilot extension. System will use local model only."
        echo "   You can install later with: gh extension install github/gh-copilot"
    fi
fi

# Install Ollama if not present
echo ""
echo "[3/7] Checking Ollama..."
if ! command -v ollama &> /dev/null; then
    echo "Installing Ollama..."
    curl -fsSL https://ollama.com/install.sh | sh
else
    echo "✓ Ollama already installed"
fi

# Pull local model
echo ""
echo "[4/7] Pulling local model (776 MB)..."
ollama pull deepseek-coder:1.3b

# Create directories
echo ""
echo "[5/7] Creating directories..."
mkdir -p ~/bin
mkdir -p ~/.config/hybrid-llm
mkdir -p ~/.local/share/hybrid-llm/{logs,cache,training}

# Install scripts
echo ""
echo "[6/7] Installing scripts..."

# Copy ask command
cp scripts/ask ~/bin/ask
chmod +x ~/bin/ask

# Copy memory-query
cp scripts/memory-query ~/bin/memory-query
chmod +x ~/bin/memory-query

# Copy ai-stats
cp scripts/ai-stats ~/bin/ai-stats
chmod +x ~/bin/ai-stats

# Initialize memory database if it doesn't exist
if [ ! -f ~/.local/share/hybrid-llm/memory.db ]; then
    sqlite3 ~/.local/share/hybrid-llm/memory.db < scripts/init-db.sql 2>/dev/null || true
fi

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
echo "[7/7] Updating PATH..."
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
    echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc 2>/dev/null || true
    echo "✓ Added ~/bin to PATH (restart shell or run: source ~/.bashrc)"
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
echo "GitHub Copilot Status:"
if gh extension list | grep -q copilot; then
    echo "  ✅ Installed - Complex queries will use Copilot"
else
    echo "  ⚠️  Not installed - Using local model only"
    echo "  Install with: gh extension install github/gh-copilot"
fi
echo ""
echo "Try it:"
echo "  ask \"what is the grep flag for recursive?\""
echo ""
echo "Documentation: https://github.com/barrersoftware/hybrid-llm-copilot"
echo ""
