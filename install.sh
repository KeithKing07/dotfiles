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

# ── Claude plugins ────────────────────────────────────────────
echo "🦸 Installing Superpowers..."
claude plugin install superpowers@claude-plugins-official 2>/dev/null || true

echo "📚 Adding Anthropic skills marketplace..."
claude plugin marketplace add anthropics/skills 2>/dev/null || true

echo "📄 Installing Anthropic agent skills..."
claude plugin install document-skills@anthropic-agent-skills 2>/dev/null || true
claude plugin install example-skills@anthropic-agent-skills 2>/dev/null || true

# ── Custom skills ─────────────────────────────────────────────
echo "🎨 Installing custom skills..."
npx -y skills add Leonxlnx/taste-skill --skill "design-taste-frontend" --agent claude-code -g 2>/dev/null || true
npx -y skills add Jakubantalik/transitions.dev --agent claude-code -g 2>/dev/null || true
npx -y skills add anthropics/skills --skill "web-artifacts-builder" --agent claude-code -g 2>/dev/null || true

echo "✅ Keith's environment is ready. Claude Code is live."
