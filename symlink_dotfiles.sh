#!/bin/bash

for file in $(ls *.dot); do
    ln -s ~/.dotfiles/$file ~/.${file%.dot}
done
mkdir -p ~/.config/nvim/
ln -s ~/.dotfiles/vimrc.dot ~/.config/nvim/init.vim
