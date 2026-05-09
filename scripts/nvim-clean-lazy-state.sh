#!/usr/bin/env bash
set -euo pipefail

rm -rf ~/.local/state/nvim/lazy
rm -rf ~/.cache/nvim

echo "Removed Lazy state and Neovim cache."
echo "Open nvim and run :Lazy sync"
