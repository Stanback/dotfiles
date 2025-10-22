# Dotfiles

Clean, modular zsh configuration using Oh My Zsh and Powerlevel10k.

## Philosophy

- **Squashed, not mirrored**: Oh My Zsh core is installed locally, not tracked in this repo
- **Modular custom config**: Only your custom zsh modules are tracked in `zsh/`
- **Secrets never committed**: API keys, tokens, and machine-specific configs are gitignored
- **Portable**: Bootstrap script sets up everything on a fresh machine
- **Centralized**: All shell, SSH, and Git configs in one repo

## Structure

### In This Repo (tracked in git)

```
dotfiles/
├── zsh/                            # All zsh configuration
│   ├── .zshrc                      # Main zsh config
│   ├── .zprofile                   # Login shell config
│   ├── README.md                   # Setup instructions
│   ├── aliases.zsh                 # Docker, k8s, git aliases
│   ├── functions.zsh               # Kubernetes helper functions
│   ├── env.tools.zsh               # Dev tool configs: fnm, pyenv, etc.
│   ├── env.paths.zsh               # PATH modifications
│   ├── env.cloud.zsh               # GCP, redis shortcuts
│   ├── ssh.zsh                     # SSH connection aliases
│   └── macos.zsh                   # macOS-specific terminal integration
├── ssh/
│   ├── config                      # Main SSH config
│   ├── config.local.example        # Template for machine-specific SSH
│   └── README.md
├── git/
│   ├── .gitconfig                  # Main git config with aliases
│   ├── .gitconfig.local.example    # Template for user info
│   ├── hooks/
│   │   └── pre-commit              # Prevents committing secrets
│   └── README.md
├── config/
│   ├── shell/
│   │   ├── secrets.zsh.example     # Template for API keys
│   │   └── local.zsh.example       # Template for machine-specific config
│   ├── ghostty/
│   │   └── config                  # Ghostty terminal config
│   ├── btop/
│   │   └── btop.conf               # btop resource monitor config
│   ├── k9s/
│   │   ├── config.yaml             # k9s Kubernetes UI config
│   │   └── skins/                  # Rose Pine themes for k9s
│   └── nvim/lua/plugins/
│       └── rose-pine.lua           # Rose Pine theme for Neovim
├── p10k/
│   └── .p10k.zsh                   # Powerlevel10k theme config (Rose Pine colors)
├── scripts/
│   └── bootstrap                   # Installation script
├── Justfile                        # Task runner (like make, but simpler)
└── Brewfile                        # Homebrew package dependencies
```

### Created in Home Directory (gitignored, never tracked)

Bootstrap creates these files from templates:
```
~/.config/shell/
├── secrets.zsh                     # Your API keys/tokens
└── local.zsh                       # Machine-specific overrides

~/.gitconfig.local                  # Your git name/email/signing keys
~/.ssh/config.local                 # Machine-specific SSH hosts (optional)
```

## Quick Start

### Fresh Machine Setup

```bash
# Clone the repo
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Run bootstrap (installs OMZ, creates backups, links configs)
just install
# Or run directly: ./scripts/bootstrap

# Fill in your secrets and local configs
vi ~/.config/shell/secrets.zsh
vi ~/.config/shell/local.zsh
vi ~/.gitconfig.local
vi ~/.ssh/config.local  # optional

# Start new shell
exec zsh
```

**Note**: If `just` is not installed, run `brew install just` first, or call the bootstrap script directly: `./scripts/bootstrap`

### Existing Machine Migration

If you already have zsh configs:

```bash
# Bootstrap will automatically back up existing files with timestamps
# e.g., ~/.zshrc.20231016-143022.bak
just install

# Or preview what will be changed without making modifications
just dry-run
```

## What Gets Tracked vs Not

### In this repo:
- Your `.zshrc` (slim loader)
- Your `.zprofile`
- Your custom zsh modules (`zsh/.oh-my-zsh/custom/`)
- Your p10k theme config (with Rose Pine colors)
- Your Ghostty terminal config
- Your btop resource monitor config (with Rose Pine themes)
- Your k9s Kubernetes UI config (with Rose Pine skins)
- Your Neovim plugin configs (`config/.config/nvim/lua/plugins/`)
- Brewfile (Homebrew package list)
- Secrets template (example only)

### Not in this repo:
- Oh My Zsh core (installed at `~/.oh-my-zsh` by bootstrap)
- Powerlevel10k theme (cloned to `~/powerlevel10k` by bootstrap)
- LazyVim (installed at `~/.config/nvim` by bootstrap, `.git` removed)
- Actual secrets (`~/.config/shell/secrets.zsh`)
- Machine-specific config (`local.zsh`)

## Configuration Details

### How ZSH_CUSTOM Works

The `.zshrc` sets `ZSH_CUSTOM="$HOME/dotfiles/zsh"`, which tells Oh My Zsh to automatically source all `.zsh` files in that directory. Your custom modules live directly in the repo without a nested `custom/` directory.

### Secrets Management

`~/.config/shell/secrets.zsh` (gitignored):
- Created from `config/shell/secrets.zsh.example` during bootstrap
- Stores all API keys, tokens, and sensitive data
- Manually sourced in `.zshrc`
- Lives outside repo directory for security

### Local Machine Overrides

`~/.config/shell/local.zsh` (gitignored):
- Created from `config/shell/local.zsh.example`
- Machine-specific config (work vs personal, experimental aliases, etc.)
- Manually sourced in `.zshrc`
- Lives outside repo directory

### SSH Configuration

`~/.ssh/config` is symlinked to `~/dotfiles/ssh/config`:
- Main config is tracked in git
- Machine-specific hosts go in `~/.ssh/config.local` (gitignored)
- Uses `Include` directive to load local config

### Git Configuration

`~/.gitconfig` is symlinked to `~/dotfiles/git/.gitconfig`:
- Main config with aliases and defaults is tracked
- Your name/email/signing keys go in `~/.gitconfig.local` (gitignored)
- Uses `[include]` directive to load local config

## Common Tasks

Use `just` to run common tasks:

```bash
just              # Show all available commands
just install      # Run bootstrap (initial setup)
just update       # Update all tools (OMZ, p10k, etc.)
just dry-run      # Preview changes without making them
just brew         # Install Homebrew packages
just brew-update  # Update Homebrew and packages
just brew-cleanup # Remove unused packages
```

### Update All Tools at Once
```bash
just update
# Or: UPDATE_TOOLS=yes ./scripts/bootstrap
```

### Update Individual Tools

**Oh My Zsh:**
```bash
omz update
```

**Powerlevel10k:**
```bash
cd ~/powerlevel10k && git pull
```

**LazyVim plugins:**
```bash
nvim  # then run :Lazy sync
```

**Your Dotfiles:**
```bash
cd ~/dotfiles && git pull
```

## Bootstrap Script Features

- Checks for required dependencies (git, curl, zsh)
- Installs Oh My Zsh if missing (with `KEEP_ZSHRC=yes`)
- Installs Powerlevel10k theme if missing
- Installs LazyVim (Neovim distribution) if nvim is present
- Creates timestamped backups of existing files
- Symlinks configs from repo to home directory
- Creates secrets file from template (600 permissions)
- Sets up pre-commit framework hooks (gitleaks, shellcheck, detect-secrets)
- Idempotent (safe to run multiple times)
- Supports dry-run mode with `DRY_RUN=yes` or `just dry-run`
- Optional: Update all tools with `UPDATE_TOOLS=yes` or `just update`

## Customization

### Add New Custom Module

Create a new `.zsh` file in `zsh/.oh-my-zsh/custom/`:

```bash
echo 'alias myalias="echo hello"' > zsh/.oh-my-zsh/custom/mymodule.zsh
```

Oh My Zsh automatically sources all `.zsh` files in the custom directory.

### Change Theme Settings

**Powerlevel10k:**
```bash
p10k configure
```
This will update `~/.p10k.zsh` (which is symlinked to `p10k/.p10k.zsh` in this repo).

Note: The p10k config uses Rose Pine Main color palette. If you reconfigure, you may need to reapply the colors.

**Neovim (Rose Pine):**
The Rose Pine theme is configured in `config/.config/nvim/lua/plugins/rose-pine.lua`. You can change variants by editing:
```lua
opts = {
  variant = "auto", -- change to "main", "moon", or "dawn"
}
```

## Pre-Commit Hooks

This repo uses the [pre-commit framework](https://pre-commit.com/) to run automated checks before each commit.

### What's Checked

- **Secrets Detection**: `gitleaks` and `detect-secrets` scan for API keys, tokens, and credentials
- **Shell Linting**: `shellcheck` validates shell scripts for common issues
- **File Quality**: trailing whitespace, end-of-file fixers, large file detection
- **Format Validation**: YAML and JSON syntax checking

### Usage

```bash
# Install hooks (done automatically by bootstrap)
pre-commit install

# Run checks manually on all files
pre-commit run --all-files

# Run checks on staged files only
pre-commit run

# Update hook versions
pre-commit autoupdate
```

### Bypassing Hooks

Only in emergencies (not recommended):
```bash
git commit --no-verify -m "emergency commit"
```

## Tips

- Use `local.zsh` for machine-specific tweaks (not tracked)
- Keep secrets out of git (use `secrets.zsh`)
- Run bootstrap after pulling repo updates to refresh symlinks
- Install a Nerd Font (e.g., MesloLGS NF) for p10k symbols
- Run `pre-commit run --all-files` after pulling to catch issues early

## Why This Approach?

**Less churn**: Oh My Zsh updates frequently; you don't want its core files cluttering your diffs.

**Cleaner repo**: Only track what you actually customize.

**Portable**: Bootstrap can set up a fresh machine in seconds.

**Secure**: Secrets never touch git.
