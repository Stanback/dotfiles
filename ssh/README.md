# SSH Configuration

Centralized SSH configuration for all your machines.

## Files

- `config` - Main SSH config (tracked in git)
- `config.local` - Machine-specific overrides (gitignored)
- `config.local.example` - Template for local config

## Setup

1. **Symlink the main config:**
   ```bash
   ln -sf ~/dotfiles/ssh/config ~/.ssh/config
   ```

2. **Create machine-specific config (optional):**
   ```bash
   cp ~/dotfiles/ssh/config.local.example ~/.ssh/config.local
   chmod 600 ~/.ssh/config.local
   # Edit with machine-specific hosts
   ```

## How It Works

The main `config` file includes `~/.ssh/config.local` at the top, so machine-specific settings can override or extend the shared config.

## Security Note

Always keep `~/.ssh/config` permissions at `600`:
```bash
chmod 600 ~/.ssh/config ~/.ssh/config.local
```
