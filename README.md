# Dotfiles

```bash
git clone https://github.com/h0jicha/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash link.sh

# 設定ファイルを適用
if [[ $SHELL == */bash ]]; then
  source "$HOME/.bashrc"
elif [[ $SHELL == */zsh ]]; then
  source "$HOME/.zshrc"
fi
```
