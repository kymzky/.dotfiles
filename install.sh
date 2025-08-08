#!/usr/bin/env bash
dir=$(dirname $(realpath $0))

function create_symlink() {
  local source="$1"
  local dest="$2"

  if [ -L "$dest" ]; then
    rm "$dest"
  fi

  if [ -e "$dest" ]; then
    rm -r "$dest"
  fi

  ln -s "$source" "$dest"
}

create_symlink "$dir"/alacritty ~/.config/alacritty
create_symlink "$dir"/fish ~/.config/fish
create_symlink "$dir"/lazygit ~/.config/lazygit
create_symlink "$dir"/lsd ~/.config/lsd
create_symlink "$dir"/nvim ~/.config/nvim
create_symlink "$dir"/tmux/.tmux.conf ~/.tmux.conf
