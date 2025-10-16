# macOS-specific configuration

# iTerm2 Shell Integration
# if [ ! -e "$HOME/.iterm2_shell_integration.zsh" ]; then
#   curl -L https://iterm2.com/shell_integration/zsh -o "$HOME/.iterm2_shell_integration.zsh"
# fi
# source "$HOME/.iterm2_shell_integration.zsh"

# Ghostty integration (only when inside Ghostty)
if [[ -n $GHOSTTY_RESOURCES_DIR ]]; then
  source "$GHOSTTY_RESOURCES_DIR/shell-integration/zsh/ghostty-integration"
fi
