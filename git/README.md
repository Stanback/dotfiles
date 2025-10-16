# Git Configuration

Centralized Git configuration with machine-specific overrides.

## Files

- `.gitconfig` - Main git config (tracked in git)
- `.gitconfig.local` - Machine-specific settings (gitignored)
- `.gitconfig.local.example` - Template for local config

## Setup

1. **Symlink the main config:**
   ```bash
   ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
   ```

2. **Create machine-specific config:**
   ```bash
   cp ~/dotfiles/git/.gitconfig.local.example ~/.gitconfig.local
   # Edit with your name, email, and signing key
   ```

   Example `~/.gitconfig.local`:
   ```ini
   [user]
       name = Your Name
       email = your.email@example.com
       signingkey = YOUR_GPG_KEY

   [commit]
       gpgsign = true
   ```

## What's Included

The main `.gitconfig` includes:
- Sensible defaults (rebase=false, prune on fetch, etc.)
- Useful aliases (st, lg, amend, unstage, etc.)
- Better diff/merge display (diff3, zebra coloring)
- Rerere enabled for conflict resolution

## Machine-Specific Settings

Use `.gitconfig.local` for:
- User name and email (different for work/personal)
- GPG signing keys
- Machine-specific SSH keys or paths
