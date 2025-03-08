if [ -f ~/.config/common/.sources ]; then
    source ~/.config/common/.sources
fi

# Prompt
eval "$(starship init bash)"

## CUDA
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
