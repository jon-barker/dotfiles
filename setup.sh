wget http://ethanschoonover.com/solarized/files/solarized.zip
unzip solarized.zip
mkdir ~/.vim/colors
mv solarized/vim-colors-solarized/colors/solarized.vim ~/.vim/colors
curl https://raw.github.com/seebi/dircolors-solarized/master/dircolors.256dark > ~/.dircolors
source ~/.bashrc
rm -r solarized
rm solarized.zip

rm -rf ~/.vim/bundle/Vundle.vim/

cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf
cp dircolors ~/.dircolors
eval `dircolors ~/.dircolors`

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

source ~/.bashrc
