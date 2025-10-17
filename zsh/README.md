# Zsh Configuration

This directory contains all zsh configuration files for your shell environment.

## Tracked Files (in git)

These files are automatically sourced by Oh-My-Zsh via `ZSH_CUSTOM`:

- `aliases.zsh` - Shell aliases (docker, k8s, git, vim, etc.)
- `env.cloud.zsh` - Cloud provider configs (GCloud, AWS, etc.)
- `env.paths.zsh` - PATH modifications
- `env.tools.zsh` - Development tool initializations (rbenv, pyenv, fnm, etc.)
- `functions.zsh` - Custom shell functions
- `macos.zsh` - macOS-specific configuration (terminal integrations)
- `ssh.zsh` - SSH connection shortcuts

## How It Works

Your `.zshrc`:
1. Sets `ZSH_CUSTOM="$HOME/dotfiles/zsh"`
2. Oh-My-Zsh auto-sources all `*.zsh` files in this directory
3. Manually sources `~/.config/shell/secrets.zsh` and `~/.config/shell/local.zsh` if they exist

## Local Overrides (Gitignored)

Secrets and machine-specific configuration live in `~/.config/shell/` (outside the repo):

- `~/.config/shell/secrets.zsh` - API keys, tokens, sensitive credentials
- `~/.config/shell/local.zsh` - Machine-specific config (paths, work vs personal)

These files are created by the bootstrap script from templates in `config/shell/` and are manually sourced by `.zshrc`.

## Security Note

The bootstrap script automatically sets `chmod 600` on secrets and local config files to restrict access to your user only.
