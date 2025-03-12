if [ -f ~/.config/common/.sources ]; then
    source ~/.config/common/.sources
fi

# Prompt
eval "$(starship init zsh)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/git/bin:$PATH"
export PATH="/Users/tanabehikaru/.npm-global/lib/node_modules:$PATH"

alias gst='git status'

bindkey -e
