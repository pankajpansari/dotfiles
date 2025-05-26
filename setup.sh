#!/bin/bash


echo -e "Starting development environment setup..."

sudo apt update && sudo apt upgrade -y
sudo apt install -y vim zsh tmux wget build-essential cmake make curl git tldr

echo -e "Installing Oh My Zsh..."
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sudo chsh -s "$(which zsh)"

# Add symlinks
ln -sf dotfiles/vimrc ~/.vimrc
ln -sf dotfiles/zshrc ~/.zshrc
ln -sf dotfiles/gitconfig ~/.gitconfig

echo -e "Setup complete"


