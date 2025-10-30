# Hybrid LLM with GitHub Copilot - Windows Installer

Write-Host "============================================================"
Write-Host "  Hybrid LLM with GitHub Copilot - Installer"
Write-Host "  © 2025 Barrer Software"
Write-Host "============================================================"
Write-Host ""

# Check prerequisites
Write-Host "[1/6] Checking prerequisites..."

# Check GitHub CLI
if (!(Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "❌ GitHub CLI (gh) not found" -ForegroundColor Red
    Write-Host "Install from: https://cli.github.com/"
    exit 1
}

# Check gh auth
$authStatus = gh auth status 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ GitHub CLI not authenticated" -ForegroundColor Red
    Write-Host "Run: gh auth login"
    exit 1
}

Write-Host "✓ GitHub CLI found and authenticated" -ForegroundColor Green

# Install Ollama
Write-Host ""
Write-Host "[2/6] Checking Ollama..."
if (!(Get-Command ollama -ErrorAction SilentlyContinue)) {
    Write-Host "Please install Ollama from: https://ollama.com/download"
    Write-Host "Then run this installer again"
    exit 1
} else {
    Write-Host "✓ Ollama found" -ForegroundColor Green
}

# Pull model
Write-Host ""
Write-Host "[3/6] Pulling local model..."
ollama pull deepseek-coder:1.3b

# Create directories
Write-Host ""
Write-Host "[4/6] Creating directories..."
$appData = "$env:LOCALAPPDATA\hybrid-llm"
New-Item -ItemType Directory -Force -Path $appData\logs | Out-Null
New-Item -ItemType Directory -Force -Path $appData\cache | Out-Null
New-Item -ItemType Directory -Force -Path $appData\training | Out-Null

# Install scripts
Write-Host ""
Write-Host "[5/6] Installing scripts..."

$binPath = "$env:USERPROFILE\bin"
New-Item -ItemType Directory -Force -Path $binPath | Out-Null

Copy-Item scripts\ask.ps1 $binPath\ask.ps1
Copy-Item scripts\ai-stats.ps1 $binPath\ai-stats.ps1
Copy-Item scripts\memory-query.ps1 $binPath\memory-query.ps1

# Add to PATH
Write-Host ""
Write-Host "[6/6] Updating PATH..."
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -notlike "*$binPath*") {
    [Environment]::SetEnvironmentVariable("Path", "$currentPath;$binPath", "User")
    Write-Host "✓ Added to PATH (restart PowerShell)" -ForegroundColor Green
} else {
    Write-Host "✓ Already in PATH" -ForegroundColor Green
}

Write-Host ""
Write-Host "============================================================"
Write-Host "  ✅ Installation Complete!" -ForegroundColor Green
Write-Host "============================================================"
Write-Host ""
Write-Host "Commands available:"
Write-Host "  ask `"your question`"     - Smart AI assistant"
Write-Host "  ai-stats                  - View usage statistics"
Write-Host ""
Write-Host "Restart PowerShell and try:"
Write-Host "  ask `"what is the tar command?`""
Write-Host ""
