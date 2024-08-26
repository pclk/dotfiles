# dotfiles

## Tools

- `aerospace`

> MacOS Window manager. Primarily used for its workspace function.

- `alacritty`

> Lightweight, fast and configurable terminal

- `nvim`

> My IDE

- `tmux`

> Multiplexer (able to create new windows and panes), while
also retaining session when terminal is abruptly closed.

- `zsh`

> MacOS default shell.

You will be able to find README for each tool by going into each directory.
In this directory, `.zshrc` is available, so let's start describing that.

## zsh

zsh is setup with powerlevel10k prompt. Some command line tools can be seen:

- `zoxide`: remapped to `cd` in `.zshrc`. A drop-in cd replacement with
a caching functionality, allowing me to type something as simple as `cd wa`
when I would like to go `~/Repo/wa-vf-go-server/`, based on my most
recently visited directories.

- `eza`: remapped to `ll`. A drop-in ls replacement with coloring and tree
displaying functionality.

- `lazygit`: remapped to `lg`. A visualizer for git commits, pulls and pushes.

## chezmoi
>
> A configuration manager, with the ability to apply this repository's config
files to any machine easily.

### Steps to apply

Step 0: Install chezmoi

```bash
brew install chezmoi
```

```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```

If this repo is public:

```bash
chezmoi init --apply https://github.com/pclk/dotfiles.git
```

<details>
<summary>If this repo is private:</summary>

Step 1: Generate SSH key:

```bash
ssh-keygen -t ed25519 -C "pclk"
  ```

Step 2: Create ssh config files:

```bash
vim ~/.ssh/config
  ```

Step 3: Paste the following:

```bash
Host home
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519
```

Step 2: Copy the public key:

```bash
cat ~/.ssh/id_ed25519.pub
  ```

Step 3: Paste it in Github > Settings > SSH and GPG Keys > New SSH Key

Step 4: Apply configuration using chezmoi: (NOT TESTED)

```bash
chezmoi init --apply git@home:pclk/dotfiles.git
  ```

If you are asked for passphrase, do the following:

Step 5: Edit .zshrc/.bashrc file

```bash
vim ~/.zshrc
  ```

Step 6: Paste in the following:

``` bash
eval $(ssh-agent -s)
ssh-add ~/.ssh/my_private_ssh_key
```

Step 7: Source it

```bash
source ~/.zshrc
  ```

Step 8: Try again

```bash
chezmoi init --apply git@home:pclk/dotfiles.git
```

</details>
