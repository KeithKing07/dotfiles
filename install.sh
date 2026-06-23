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

# ── Claude Memory ─────────────────────────────────────────────
echo "🧠 Installing Claude memory..."
npx claude-mem install

echo "✅ Keith's environment is ready. Claude Code is live."
# Install Superpowers plugin for Claude Code
echo "🦸 Installing Superpowers..."
claude -p "/plugin install superpowers@claude-plugins-official" --no-interactive 2>/dev/null || true
echo "✅ Superpowers ready"
