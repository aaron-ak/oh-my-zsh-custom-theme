```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
curl -o ~/.oh-my-zsh/custom/themes/robbyrussell.zsh-theme https://raw.githubusercontent.com/aaron-ak/oh-my-zsh-custom-theme/refs/heads/main/robbyrussell.zsh-theme
```



```
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
curl -fsSL -o ~/.oh-my-zsh/themes/robbyrussell.zsh-theme \
    https://raw.githubusercontent.com/aaron-ak/oh-my-zsh-custom-theme/refs/heads/main/robbyrussell.zsh-theme

echo "✅ Installation complete."
echo "👉 Update ~/.zshrc and set ZSH_THEME=\"robbyrussell\""
```
