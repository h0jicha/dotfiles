#!/usr/bin/env bash

set -e

# dotfiles リポジトリのパスを取得
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# バックアップ先ディレクトリ（タイムスタンプ付き）
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# OS 判定
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  if command -v apt &>/dev/null; then
    OS_TYPE="debian"
  else
    OS_TYPE="linux"
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  OS_TYPE="mac"
else
  echo "Unsupported OS: $OSTYPE"
  exit 1
fi

echo "Detected OS: $OS_TYPE"

# シンボリックリンク用関数
link_file() {
  local src="$1"
  local dest="$2"

  # 既存のファイルやシンボリックリンクがある場合はバックアップしてから作り直す
  if [[ -e "$dest" || -L "$dest" ]]; then
    echo "Backing up existing $dest to $BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/"
  fi

  ln -s "$src" "$dest"
  echo "Linked $src -> $dest"
}

# =========================
# 共通ファイルのリンク
# =========================
link_file "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
link_file "$DOTFILES_DIR/.bash_profile" "$HOME/.bash_profile"
link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/.gitignore_global" "$HOME/.gitignore_global"
link_file "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"

# .config ディレクトリ以下のリンク
mkdir -p "$HOME/.config"
link_file "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"

# 共通シェル設定
mkdir -p "$HOME/.config/common"
link_file "$DOTFILES_DIR/.config/common/.aliases" "$HOME/.config/common/.aliases"
link_file "$DOTFILES_DIR/.config/common/.functions" "$HOME/.config/common/.functions"
link_file "$DOTFILES_DIR/.config/common/.paths" "$HOME/.config/common/.paths"
link_file "$DOTFILES_DIR/.config/common/.variables" "$HOME/.config/common/.variables"
link_file "$DOTFILES_DIR/.config/common/.sources" "$HOME/.config/common/.sources"

# Neovim の設定
mkdir -p "$HOME/.config/nvim"
link_file "$DOTFILES_DIR/.config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
link_file "$DOTFILES_DIR/.config/nvim/mason.vim" "$HOME/.config/nvim/mason.vim"
link_file "$DOTFILES_DIR/.config/nvim/lualine.vim" "$HOME/.config/nvim/lualine.vim"
link_file "$DOTFILES_DIR/.config/nvim/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"

# alacritty の設定
mkdir -p "$HOME/.config/alacritty"
link_file "$DOTFILES_DIR/.config/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

# =========================
# OSごとの設定（必要なら追記）
# =========================
case "$OS_TYPE" in
debian)
  # link_file "$DOTFILES_DIR/.config/debian_specific.conf" "$HOME/.config/specific.conf"
  ;;
mac)
  # link_file "$DOTFILES_DIR/.config/mac_specific.conf" "$HOME/.config/specific.conf"
  ;;
linux)
  # link_file "$DOTFILES_DIR/.config/linux_specific.conf" "$HOME/.config/specific.conf"
  ;;
esac

echo "✅ All dotfiles have been linked successfully."
