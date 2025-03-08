# Prompt
eval "$(starship init bash)"

## CUDA
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

if [ -f ~/.common ]; then
    source ~/.common
fi