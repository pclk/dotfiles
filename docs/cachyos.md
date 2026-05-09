# CachyOS Dotfiles Setup

This guide sets up this dotfiles repo on a fresh CachyOS machine using chezmoi, kitty, zsh, LazyVim, lazygit, and Powerlevel10k.

## 1. Install base packages

```bash
sudo pacman -Syu

sudo pacman -S --needed \
  git chezmoi \
  zsh neovim kitty kitty-terminfo kitty-shell-integration \
  fzf zoxide eza jq lazygit git-delta ripgrep fd \
  unzip gcc make base-devel \
  nodejs npm go python python-pip \
  zsh-autosuggestions zsh-syntax-highlighting
````

Powerlevel10k may be in CachyOS repos or AUR depending on package availability:

```bash
sudo pacman -S --needed zsh-theme-powerlevel10k
```

If that fails and `yay` is available:

```bash
yay -S --needed zsh-theme-powerlevel10k
```

## 2. Pull dotfiles with chezmoi

For first-time setup:

```bash
chezmoi init https://github.com/pclk/dotfiles.git --branch cachyos
```

For an existing setup:

```bash
cd "$(chezmoi source-path)"
git switch cachyos
git pull
```

## 3. Preview before applying

Always preview first:

```bash
chezmoi diff
```

Then apply:

```bash
chezmoi apply
```

## 4. Set zsh as default shell

```bash
chsh -s /usr/bin/zsh
```

Log out fully and log back in.

Verify:

```bash
echo "$SHELL"
ps -p $$ -o comm=
getent passwd "$USER" | cut -d: -f7
```

Expected:

```text
/usr/bin/zsh
zsh
/usr/bin/zsh
```

If `$SHELL` still shows fish in the current session, use:

```bash
export SHELL=/usr/bin/zsh
```

## 5. Kitty setup

Kitty config is managed by chezmoi at:

```text
dot_config/kitty/kitty.conf
```

Applied location:

```text
~/.config/kitty/kitty.conf
```

The config is intended to:

```text
- launch /usr/bin/zsh
- use MesloLGS Nerd Font Mono
- keep window decorations enabled
- use kitty-native tabs
- use cmd+k as a zoxide project picker
```

Reload kitty config:

```text
Ctrl+Shift+F5
```

or:

```bash
kitty @ load-config
```

If `cmd+k` does nothing, the desktop environment is probably intercepting the Super key before kitty receives it.

Test key input:

```bash
kitty --debug-input
```

Press `Super+K` and check whether kitty receives the event.

## 6. Zoxide project picker

The picker script is managed at:

```text
dot_local/bin/executable_kitty-zoxide-session
```

Applied location:

```text
~/.local/bin/kitty-zoxide-session
```

It requires:

```bash
sudo pacman -S --needed zoxide fzf eza
```

Seed zoxide:

```bash
zoxide add ~
zoxide add ~/.config
zoxide query -l
```

Then press:

```text
cmd+k
```

Expected behavior:

```text
fzf overlay opens -> select directory -> new kitty tab opens there
```

## 7. Powerlevel10k

Redo the Powerlevel10k setup wizard:

```bash
p10k configure
```

If `p10k` is not found, check the installed path:

```bash
pacman -Ql zsh-theme-powerlevel10k 2>/dev/null | grep powerlevel10k.zsh-theme
```

Common paths:

```text
/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
/usr/share/powerlevel10k/powerlevel10k.zsh-theme
/usr/share/zsh/powerlevel10k/powerlevel10k.zsh-theme
```

The zsh config checks these paths automatically.

After configuring:

```bash
chezmoi add ~/.p10k.zsh
```

## 8. Neovim / LazyVim

Apply Neovim config:

```bash
chezmoi apply ~/.config/nvim
```

Clean stale Lazy state if plugins behave strangely:

```bash
rm -rf ~/.local/state/nvim/lazy
rm -rf ~/.cache/nvim
```

If plugin installs are badly corrupted:

```bash
rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.local/state/nvim/lazy
rm -rf ~/.cache/nvim
rm -f ~/.config/nvim/lazy-lock.json
```

Then open:

```bash
nvim
```

Inside Neovim:

```vim
:Lazy sync
```

## 9. Removed Neovim plugins

The CachyOS branch intentionally removes or disables:

```text
codecompanion.nvim
VectorCode
vim-jukit
```

If old errors still appear, remove stale local installs:

```bash
rm -rf ~/.local/share/nvim/lazy/codecompanion.nvim
rm -rf ~/.local/share/nvim/lazy/VectorCode
rm -rf ~/.local/share/nvim/lazy/vim-jukit
rm -rf ~/.local/state/nvim/lazy
rm -rf ~/.cache/nvim
```

Then run:

```bash
nvim
```

and inside Neovim:

```vim
:Lazy sync
```

## 10. Mini plugin rename cleanup

If Lazy warns about old Mini repos:

```text
echasnovski/mini.surround -> nvim-mini/mini.surround
echasnovski/mini.files    -> nvim-mini/mini.files
```

Clean local state:

```bash
rm -rf ~/.local/share/nvim/lazy/mini.surround
rm -rf ~/.local/share/nvim/lazy/mini.files
rm -rf ~/.local/state/nvim/lazy
rm -rf ~/.cache/nvim
rm -f ~/.config/nvim/lazy-lock.json
```

Then:

```bash
nvim
```

Inside Neovim:

```vim
:Lazy sync
```

## 11. Lazygit and delta

Install delta using the Arch package name:

```bash
sudo pacman -S --needed git-delta
```

Verify:

```bash
which delta
delta --version
```

Lazygit config is managed at:

```text
dot_config/lazygit/config.yml
```

Applied location:

```text
~/.config/lazygit/config.yml
```

Expected lazygit paging config:

```yaml
git:
  paging:
    colorArg: always
    pager: delta --dark --paging=never
```

## 12. Useful aliases

The zsh config includes aliases such as:

```bash
ll      # eza -l --icons --git
la      # eza -la --icons --git
tree    # eza --tree --icons
h       # nvim
c       # chezmoi
ccd     # cd "$(chezmoi source-path)"
s       # source ~/.zshrc
lg      # lazygit
```

Use this instead of `chezmoi cd` if `$SHELL` is still unreliable:

```bash
ccd
```

or:

```bash
cd "$(chezmoi source-path)"
```

## 13. Accept live changes into chezmoi

If you edit a live file directly, accept it back into chezmoi:

```bash
chezmoi add ~/.zshrc
chezmoi add ~/.config/kitty/kitty.conf
chezmoi add ~/.config/lazygit/config.yml
```

Then commit:

```bash
cd "$(chezmoi source-path)"
git status
git add -A
git commit -m "Update CachyOS dotfiles"
git push
```

## 14. Common recovery

If zsh breaks:

```bash
exec bash
mv ~/.zshrc ~/.zshrc.broken
chezmoi apply ~/.zshrc
zsh
```

If kitty config breaks:

```bash
mv ~/.config/kitty ~/.config/kitty.broken
chezmoi apply ~/.config/kitty
kitty
```

If Neovim breaks:

```bash
rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.local/state/nvim/lazy
rm -rf ~/.cache/nvim
rm -f ~/.config/nvim/lazy-lock.json
nvim
```

## 15. Recommended validation

After setup, run:

```bash
zsh -i -c 'echo zsh ok'
kitty --debug-config
nvim --headless '+Lazy! sync' +qa
lazygit --version
delta --version
```

If these pass, the CachyOS setup is in a usable state.
