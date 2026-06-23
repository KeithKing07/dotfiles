#!/bin/bash

echo "🔧 Setting up Keith's environment..."

# ── Node / npm guard ──────────────────────────────────────────
if ! command -v node &>/dev/null; then
  echo "📦 Installing Node.js..."
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi

# ── Claude Code ───────────────────────────────────────────────
echo "⚡ Installing Claude Code..."
npm install -g @anthropic-ai/claude-code

# ── Claude config directory ───────────────────────────────────
mkdir -p ~/.claude

echo "✅ Keith's environment is ready. Claude Code is live."
