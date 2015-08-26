#!/bin/bash

for file in $(ls *.dot); do
    ln -s ~/.dotfiles/$file ~/.${file%.dot}
done
ln -s ~/.dotfiles/vimrc.dot ~/.nvimrc
