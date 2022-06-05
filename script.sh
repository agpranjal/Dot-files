[ -f ~/.vimrc ] && cp ~/.vimrc vimrc
[ -f ~/.zshrc ] && cp ~/.zshrc zshrc
[ -f ~/.tmux.conf ] && cp ~/.tmux.conf tmux.conf
[ -f ~/.hyper.js ] && cp ~/.hyper.js hyper.js
[ -f ~/.config/nvim/init.vim ] && cp ~/.config/nvim/init.vim init.vim
[ -f ~/.config/fusuma/config.yml ] && cp ~/.config/fusuma/config.yml config.yml

git add .
git commit -m "Update"
git push --force
