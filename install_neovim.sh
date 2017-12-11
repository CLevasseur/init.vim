#!/bin/bash

echo "Installing neovim package"
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim
echo "Installing python3"
sudo apt-get install -y python-dev python-pip python3-dev python3-pip
echo "Replacing vim by nvim"
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
echo "Cloning config file init.vim"
git clone https://github.com/CLevasseur/init.vim.git ~/.config/nvim
pip3 install neovim
echo "Installing vim plugin manager"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Installing plugins"
vim +PlugInstall +qall
echo "Installing solarized colorscheme"
sudo apt-get install -y dconf-cli

git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./install.sh

mkdir ~/.config/nvim/colors/
ln -s ~/.config/nvim/plugged/vim-colors-solarized/colors/solarized.vim ~/.config/nvim/colors/
echo "Done"
#wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
#wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
