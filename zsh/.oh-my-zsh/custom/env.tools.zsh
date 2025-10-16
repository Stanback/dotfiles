# Development Environment Tools

# Go
export GOPATH="$HOME/Projects/gopath"

# Jenv version manager
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# SBT
export SBT_OPTS="-Xmx4G"

# Rbenv
eval "$(rbenv init - zsh)"

# Note: Using `fnm` as a faster-loading version of `nvm`
eval "$(fnm env --use-on-cd --shell zsh)"

# Add fnm to PATH with precedence over Homebrew
export PATH="/Users/bri/.local/state/fnm_multishells/current/bin:$PATH"

# Enable Corepack with fnm
export FNM_COREPACK_ENABLED=true

# Pyenv and pyenv-virtualenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# DBT environment activation helper
alias env_dbt='source /Users/bri/Projects/DemandIO/dbt/dbt-env/bin/activate'

# Conda (radioconda)
__conda_setup="$('/Users/bri/radioconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/bri/radioconda/etc/profile.d/conda.sh" ]; then
        . "/Users/bri/radioconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/bri/radioconda/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/bri/radioconda/etc/profile.d/mamba.sh" ]; then
    . "/Users/bri/radioconda/etc/profile.d/mamba.sh"
fi
