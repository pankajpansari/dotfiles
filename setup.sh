#!/bin/bash

echo -e "Starting development environment setup..."

apt update && apt upgrade -y
apt install sudo
sudo apt install -y vim zsh tmux wget build-essential make curl git tldr pkg-config

# CMake latest
wget -qO- "https://cmake.org/files/v4.0/cmake-4.0.0-linux-x86_64.tar.gz" | tar --strip-components=1 -xz -C /usr/local

echo -e "Installing Oh My Zsh..."
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sudo chsh -s "$(which zsh)"

echo -e "Installing Oh My Zsh plugins + themes..."
mkdir -p ~/.oh-my-zsh/custom/plugins ~/.oh-my-zsh/custom/themes

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# Add symlinks
echo -e "Adding symlinks"
ln -sf dotfiles/vimrc ~/.vimrc
ln -sf dotfiles/zshrc ~/.zshrc
ln -sf dotfiles/gitconfig ~/.gitconfig

echo -e "Setup complete"


