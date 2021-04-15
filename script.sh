cp ~/.vimrc vimrc
cp ~/.zshrc zshrc
cp ~/.tmux.conf tmux.conf
cp ~/.hyper.js hyper.js
cp ~/.config/nvim/init.vim init.vim

git add .
git commit -m "Update"
git push
