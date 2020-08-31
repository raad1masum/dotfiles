#!/bin/bash

echo "syncing dotfiles..."

cp ~/.zshrc .zshrc
cp ~/.vimrc .vimrc
cp ~/.tmux.conf .tmux.conf
cp ~/.config/starship.toml ./config/starship.toml
cp ~/.config/nvim/init.vim ./config/nvim/init.vim
cp ~/.config/bspwm/bspwmrc ./config/bspwm/bspwmrc
cp ~/.config/sxhkd/sxhkdrc ./config/sxhkd/sxhkdrc
cp ~/.config/i3/config ./config/i3/config
cp ~/.config/i3/i3blocks.conf ./config/i3/i3blocks.conf
cp ~/.config/polybar/config ./config/polybar/config
cp ~/.config/polybar/launch.sh ./config/polybar/launch.sh
cp ~/.config/rofi/config.rasi ./config/rofi/config.rasi
cp ~/.config/neofetch/config.conf ./config/neofetch/config.conf
cp ~/.config/coc/extensions/package.json ./config/coc/extensions/package.json
cp ~/.config/coc/memos.json ./config/coc/memos.json

echo "dotfiles successfully synced!"

git add .
git commit -a -m "automatically update dotfiles"
git push
