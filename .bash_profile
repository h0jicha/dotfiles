# Prompt
eval "$(starship init bash)"

# Path

## CUDA
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# Aliases
alias vim='nvim'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias nf='neofetch'

alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gd='git diff'
alias gs='git status'
alias gps='git push'
alias gpl='git pull'
alias gb='git branch'
alias gst='git status'
alias gco='git checkout'
alias gf='git fetch'
alias gc='git commit'
alias gcm='git commit -m'
alias gsw='git switch'
alias gswc='git switch -c'
alias glg='git log'

alias dc="docker compose"
alias dcr="docker compose run"
alias dce="docker compose exec"
alias dcb="docker compose build"
alias dcu="docker compose up -d"
alias dcl="docker compose logs -ft --tail=50"

alias ca="conda activate"
alias cda="conda deactivate"

alias t="tmux a"
alias tls="tmux ls"
alias tks="tmux kill-session -t"

alias gmi="go mod init"
alias gb="go build"

# Environment variables
export EDITOR='nvim'

export OPENAI_API_KEY=
export OPENAI_API_KEY_AM=
export GEMINI_API_KEY=
export GEMINI_API_KEY_AM=
export WANDB_API_KEY=
export WANDB_API_KEY_AM=

export HUGGINGFACE_TOKEN=