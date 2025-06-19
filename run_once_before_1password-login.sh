#!/bin/zsh

# Install 1Password (via Homebrew if not present)
if ! command -v op &>/dev/null; then
  echo "🔐 Installing 1Password CLI..."
  brew install --cask 1password
  brew install 1password-cli
fi

# Open the GUI app to prompt login (no CLI login available without GUI)
echo "🔐 Launching 1Password..."
open -a "1Password"

# Wait until user logs in to the 1Password app
echo "⏳ Waiting for 1Password login..."
until op account list &>/dev/null; do
  sleep 3
done

echo "✅ 1Password is unlocked and ready."
