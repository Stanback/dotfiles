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

## Gitignored Files (never tracked)

These files contain sensitive or machine-specific settings:

### `secrets.zsh`
API keys, tokens, and other sensitive credentials.

**Setup:**
```bash
cp secrets.zsh.example ~/dotfiles/zsh/secrets.zsh
chmod 600 ~/dotfiles/zsh/secrets.zsh
# Edit and add your actual secrets
```

### `local.zsh`
Machine-specific configuration that varies between computers (work laptop vs personal, different paths, etc.).

**Setup:**
```bash
cp local.zsh.example ~/dotfiles/zsh/local.zsh
chmod 600 ~/dotfiles/zsh/local.zsh
# Edit and customize for this machine
```

## How It Works

Your `.zshrc`:
1. Sets `ZSH_CUSTOM="$HOME/dotfiles/zsh"`
2. Oh-My-Zsh auto-sources all `*.zsh` files in this directory (except gitignored ones)
3. Manually sources `secrets.zsh` and `local.zsh` if they exist

## Security Note

Always run `chmod 600` on `secrets.zsh` and `local.zsh` to restrict access to your user only.
