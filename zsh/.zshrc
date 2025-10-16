# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Point to your custom directory in the dotfiles repo
export ZSH_CUSTOM="$HOME/dotfiles/zsh/.oh-my-zsh/custom"

# Update behavior
zstyle ':omz:update' mode reminder  # remind me to update when it's time
zstyle ':omz:update' frequency 14

# Plugins
plugins=(git)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Load Powerlevel10k Zsh theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load secrets if present (never tracked in git)
[[ -f ~/.config/shell/secrets.zsh ]] && source ~/.config/shell/secrets.zsh
