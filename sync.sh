#!/bin/bash

echo -e "\e[32msyncing dotfiles...\e[0m"

cp ~/.zshrc ~/Github/dotfiles/.zshrc
cp ~/.vimrc ~/Github/dotfiles/.vimrc
cp ~/.tmux.conf ~/Github/dotfiles/.tmux.conf
cp ~/.config/starship.toml ~/Github/dotfiles/config/starship.toml
cp ~/.config/nvim/init.vim ~/Github/dotfiles/config/nvim/init.vim
cp ~/.config/bspwm/bspwmrc ~/Github/dotfiles/config/bspwm/bspwmrc
cp ~/.config/sxhkd/sxhkdrc ~/Github/dotfiles/config/sxhkd/sxhkdrc
cp ~/.config/i3/config ~/Github/dotfiles/config/i3/config
cp ~/.config/i3/i3blocks.conf ~/Github/dotfiles/config/i3/i3blocks.conf
cp ~/.config/polybar/config ~/Github/dotfiles/config/polybar/config
cp ~/.config/polybar/launch.sh ~/Github/dotfiles/config/polybar/launch.sh
cp ~/.config/dunst/dunstrc ~/Github/dotfiles/config/dust/dunstrc
cp ~/.config/rofi/config.rasi ~/Github/dotfiles/config/rofi/config.rasi
cp ~/.config/neofetch/config.conf ~/Github/dotfiles/config/neofetch/config.conf
cp ~/.config/coc/extensions/package.json ~/Github/dotfiles/config/coc/extensions/package.json
cp ~/.config/coc/memos.json ~/Github/dotfiles/config/coc/memos.json

cd ~/Github/dotfiles/

git add .
git commit -a -m "Automatically Update Dotfiles"
git push

echo -e "\e[32mdotfiles successfully synced\e[0m"
