[ -f ~/.vimrc ] && cp ~/.vimrc vimrc
[ -f ~/.zshrc ] && cp ~/.zshrc zshrc
[ -f ~/.tmux.conf ] && cp ~/.tmux.conf tmux.conf
[ -f ~/.hyper.js ] && cp ~/.hyper.js hyper.js
[ -f ~/.config/nvim/init.vim ] && cp ~/.config/nvim/init.vim init.vim
[ -f ~/.config/nvim/coc-settings.json] && cp ~/.config/nvim/coc-settings.json coc-settings.json

git add .
git commit -m "Update"
git push --force
