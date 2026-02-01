#!/usr/bin/env bash
set -e

if command -v just &>/dev/null; then
    echo "just is already installed"
    just --version
    exit 0
fi

OS="$(uname)"

if [ "$OS" = "Darwin" ]; then
    if ! command -v brew &>/dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install just
elif [ "$OS" = "Linux" ] && command -v pacman &>/dev/null; then
    sudo pacman -S --needed just
else
    echo "Unsupported OS"
    exit 1
fi

if ! grep -q "alias j='just'" ~/.zshrc 2>/dev/null; then
    echo "alias j='just'" >> ~/.zshrc
fi

echo "Done. Run: source ~/.zshrc"
