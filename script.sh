cp ~/.vimrc vimrc
cp ~/.zshrc zshrc
cp ~/.tmux.conf tmux.conf
cp ~/.hyper.js hyper.js
cp ~/.config/nvim/init.vim init.vim
cp ~/.config/fusuma/config.yml config.yml

git add .
git commit -m "Update"
git push --force
