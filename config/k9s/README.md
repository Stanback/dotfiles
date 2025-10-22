# k9s Configuration

## Overview

k9s is a terminal-based UI to manage Kubernetes clusters. It provides an intuitive interface to interact with your clusters and resources.

## Configuration

The `config.yaml` includes sensible defaults:
- Auto-refresh enabled (2 second refresh rate)
- Mouse support enabled
- Rose Pine skin as default theme
- Resource thresholds: 70% warning, 90% critical

## Skins

The skins in `skins/` are Rose Pine themed to match the rest of your terminal environment:

Available skins:
- `rose-pine` - Main variant (default)
- `rose-pine-moon` - Moon variant (darker)
- `rose-pine-dawn` - Dawn variant (light)

## Usage

The bootstrap script will symlink this entire directory to `~/Library/Application Support/k9s` (the default k9s config location on macOS).

### Changing the Skin

Edit `config.yaml` and change the `skin:` value:

```yaml
k9s:
  ui:
    skin: rose-pine-moon  # or rose-pine, rose-pine-dawn
```

Then restart k9s to apply the changes.

### Customizing Configuration

You can customize any settings in `config.yaml`. See the [k9s documentation](https://k9scli.io/topics/config/) for all available options.

## Quick Start

```bash
# Connect to current kubectl context
k9s

# Connect to specific context
k9s --context my-context

# View pods in a specific namespace
k9s -n my-namespace

# Read-only mode
k9s --readonly
```

## Keyboard Shortcuts

Common shortcuts (press `?` in k9s for full list):
- `:` - Command mode (type resource name like `pods`, `deployments`, etc.)
- `/` - Filter resources
- `d` - Describe resource
- `l` - View logs
- `e` - Edit resource
- `ctrl-d` - Delete resource
- `s` - Shell into pod
- `?` - Show all keyboard shortcuts
- `ctrl-c` - Quit

## Resources

- [k9s documentation](https://k9scli.io/)
- [Rose Pine theme](https://rosepinetheme.com/)
