# Dotfiles

Clean, modular zsh configuration using Oh My Zsh and Powerlevel10k.

## Philosophy

- **Squashed, not mirrored**: Oh My Zsh core is installed locally, not tracked in this repo
- **Modular custom config**: Only your custom zsh modules are tracked (`zsh/.oh-my-zsh/custom/`)
- **Secrets never committed**: API keys and tokens live in `~/.config/shell/secrets.zsh` (gitignored)
- **Portable**: Bootstrap script sets up everything on a fresh machine

## Structure

```
dotfiles/
├── zsh/
│   ├── .zshrc                      # Slim loader, points to custom/
│   ├── .zprofile                   # Login shell config
│   └── .oh-my-zsh/custom/          # Your custom modules (tracked)
│       ├── aliases.zsh             # Docker, k8s, git aliases
│       ├── functions.zsh           # Kubernetes helper functions
│       ├── env.tools.zsh           # Dev tool configs (fnm, pyenv, etc.)
│       ├── env.paths.zsh           # PATH modifications
│       ├── env.cloud.zsh           # GCP, redis shortcuts
│       ├── ssh.zsh                 # SSH connection aliases
│       ├── macos.zsh               # macOS-specific (iTerm2 integration)
│       └── local.zsh.example       # Template for machine-specific config
├── p10k/
│   └── .p10k.zsh                   # Powerlevel10k theme config
├── config/
│   └── .config/shell/
│       └── secrets.zsh.example     # Template for API keys (copy & fill in)
└── scripts/
    └── bootstrap                   # Installation script
```

## Quick Start

### Fresh Machine Setup

```bash
# Clone the repo
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles

# Run bootstrap (installs OMZ, creates backups, links configs)
~/dotfiles/scripts/bootstrap

# Fill in your secrets
vi ~/.config/shell/secrets.zsh

# Start new shell
exec zsh
```

### Existing Machine Migration

If you already have zsh configs:

```bash
# Bootstrap will automatically back up existing files with timestamps
# e.g., ~/.zshrc.20231016-143022.bak
~/dotfiles/scripts/bootstrap
```

## What Gets Tracked vs Not

### In this repo:
- Your `.zshrc` (slim loader)
- Your `.zprofile`
- Your custom zsh modules (`zsh/.oh-my-zsh/custom/`)
- Your p10k theme config
- Secrets template (example only)

### Not in this repo:
- Oh My Zsh core (installed at `~/.oh-my-zsh` by bootstrap)
- Powerlevel10k theme (cloned by bootstrap)
- Actual secrets (`~/.config/shell/secrets.zsh`)
- Machine-specific config (`local.zsh`)

## Configuration Details

### How ZSH_CUSTOM Works

The `.zshrc` sets `ZSH_CUSTOM="$HOME/dotfiles/zsh/.oh-my-zsh/custom"`, which tells Oh My Zsh to load your custom modules directly from this repo. No symlink gymnastics needed.

### Secrets Management

Your `.zshrc` automatically sources `~/.config/shell/secrets.zsh` if it exists. This file:
- Is created from the example during bootstrap
- Is gitignored (never committed)
- Has 600 permissions
- Stores all API keys, tokens, and sensitive data

### Local Machine Overrides

Create `zsh/.oh-my-zsh/custom/local.zsh` (gitignored) for machine-specific config like:
- Work vs personal machine differences
- Experimental aliases
- Local proxy settings

## Updating

### Update Oh My Zsh
```bash
omz update
```

### Update Powerlevel10k
```bash
cd ~/powerlevel10k
git pull
```

### Update Your Dotfiles
```bash
cd ~/dotfiles
git pull
```

## Bootstrap Script Features

- Installs Oh My Zsh if missing (with `KEEP_ZSHRC=yes`)
- Installs Powerlevel10k theme if missing
- Creates timestamped backups of existing files
- Symlinks configs from repo to home directory
- Creates secrets file from template (600 permissions)
- Idempotent (safe to run multiple times)

## Customization

### Add New Custom Module

Create a new `.zsh` file in `zsh/.oh-my-zsh/custom/`:

```bash
echo 'alias myalias="echo hello"' > zsh/.oh-my-zsh/custom/mymodule.zsh
```

Oh My Zsh automatically sources all `.zsh` files in the custom directory.

### Change Theme Settings

```bash
p10k configure
```

This will update `~/.p10k.zsh` (which is symlinked to `p10k/.p10k.zsh` in this repo).

## Tips

- Use `local.zsh` for machine-specific tweaks (not tracked)
- Keep secrets out of git (use `secrets.zsh`)
- Run bootstrap after pulling repo updates to refresh symlinks
- Install a Nerd Font (e.g., MesloLGS NF) for p10k symbols

## Why This Approach?

**Less churn**: Oh My Zsh updates frequently; you don't want its core files cluttering your diffs.

**Cleaner repo**: Only track what you actually customize.

**Portable**: Bootstrap can set up a fresh machine in seconds.

**Secure**: Secrets never touch git.
