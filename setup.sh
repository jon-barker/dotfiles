rm -rf ~/.vim/bundle/Vundle.vim/

cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
