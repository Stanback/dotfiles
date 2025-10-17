# Dotfiles task runner
# Run `just` to see all available commands

# Default recipe - show available commands
default:
    @just --list

# Install dotfiles (run bootstrap script)
install:
    @./scripts/bootstrap

# Update all tools (Oh My Zsh, Powerlevel10k, etc.)
update:
    @UPDATE_TOOLS=yes ./scripts/bootstrap

# Dry run - show what would be done without making changes
dry-run:
    @DRY_RUN=yes ./scripts/bootstrap

# Install/update Homebrew packages from Brewfile
brew:
    @brew bundle install --file=Brewfile

# Update Homebrew and packages
brew-update:
    @brew update && brew upgrade

# Cleanup unused Homebrew packages
brew-cleanup:
    @brew bundle cleanup --file=Brewfile && brew cleanup

# Check Homebrew installation health
brew-doctor:
    @brew doctor
