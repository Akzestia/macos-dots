install-rust:
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

install-bun:
    curl -fsSL https://bun.sh/install | bash

brew-deps:
    brew bundle --file=homebrew/Brewfile

zsh-plugins:
    #!/usr/bin/env bash
    ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    fi

    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    fi

    echo "Done. Run: source ~/.zshrc"

setup: brew-deps install-rust zsh-plugins
