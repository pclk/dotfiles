#!/usr/bin/env bash
set -euo pipefail

sudo pacman -Syu

sudo pacman -S --needed \
  git chezmoi \
  zsh neovim kitty kitty-terminfo kitty-shell-integration \
  fzf zoxide eza jq lazygit git-delta ripgrep fd \
  unzip gcc make nodejs npm go python python-pip \
  zsh-autosuggestions zsh-syntax-highlighting

if ! command -v yay >/dev/null 2>&1; then
  echo "yay not found. Install yay manually if you need AUR packages."
else
  yay -S --needed zsh-theme-powerlevel10k
fi

echo "Bootstrap complete."
echo "Now run: chezmoi apply"
