#!/bin/bash

# Terminal
[ -f ~/.zshrc ] && cp ~/.zshrc zshrc
[ -f ~/.tmux.conf ] && cp ~/.tmux.conf tmux.conf
[ -f ~/.hyper.js ] && cp ~/.hyper.js hyper.js

# Editor
# [ -f ~/.vimrc ] && cp ~/.vimrc vimrc
# [ -f ~/.config/nvim/init.vim ] && cp ~/.config/nvim/init.vim init.vim
# [ -f ~/.config/nvim/coc-settings.json ] && cp ~/.config/nvim/coc-settings.json coc-settings.json
# [ -f ~/.config/nvim/coc-settings.json ] && cp ~/.config/nvim/coc-settings.json coc-settings.json
# [ -f "$HOME/.local/share/fonts/Monaco Nerd Font.ttf" ] && cp "$HOME/.local/share/fonts/Monaco Nerd Font.ttf" "Monaco Nerd Font.ttf"
[ -d ~/.config/nvim ] && cp -r ~/.config/nvim .

git add .
git commit -m "Update"
git push origin master