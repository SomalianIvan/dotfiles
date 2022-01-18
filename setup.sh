#!/bin/zsh

sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update
sudo apt-get install neovim -y

if ! command -v rg &> /dev/null; then
  sudo apt-get install -y silversearcher-ag
fi

mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/config.vim ~/.config/nvim/init.vim

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
