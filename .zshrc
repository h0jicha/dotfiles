# Prompt
eval "$(starship init zsh)"

# Homebrew (Mac)
export PATH="/opt/homebrew/bin:$PATH"

if [ -f ~/.common ]; then
    source ~/.common
fi