# .zprofile - runs once at login

# Homebrew setup (Apple Silicon Macs)
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# If running interactively and .zshrc hasn't loaded yet, load it
[[ -f ~/.zshrc ]] && . ~/.zshrc
