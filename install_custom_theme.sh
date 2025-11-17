#!/bin/bash
set -e

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if zsh is installed
if ! command_exists zsh; then
    echo "❌ Zsh is not installed."
    echo "👉 Please install it with:"
    echo "    sudo apt update && sudo apt install zsh"
    exit 1
fi

echo "✅ Zsh is installed, continuing with Oh My Zsh installation..."

# Install Oh My Zsh (unattended to prevent prompt)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Ensure theme directory exists
mkdir -p ~/.oh-my-zsh/themes

# Download custom robbyrussell theme
echo "⬇️ Downloading custom theme..."
curl -fsSL -o ~/.oh-my-zsh/themes/robbyrussell-custom.zsh-theme \
    https://raw.githubusercontent.com/aaron-ak/oh-my-zsh-custom-theme/refs/heads/main/robbyrussell.zsh-theme

# Update .zshrc to use the custom theme
echo "🔧 Updating ~/.zshrc to use robbyrussell-custom theme..."
if [ -f ~/.zshrc ]; then
    # Replace existing ZSH_THEME line or add it if it doesn't exist
    if grep -q "^ZSH_THEME=" ~/.zshrc; then
        sed -i.bak 's/^ZSH_THEME=.*/ZSH_THEME="robbyrussell-custom"/' ~/.zshrc
    else
        echo 'ZSH_THEME="robbyrussell-custom"' >> ~/.zshrc
    fi
    echo "✅ Theme updated in ~/.zshrc"
else
    echo "⚠️ ~/.zshrc not found. Please set ZSH_THEME=\"robbyrussell-custom\" manually."
fi

echo "✅ Installation complete."
echo "⚠️ Change your default shell to zsh with 'chsh -s $(which zsh)' if you haven't already."
