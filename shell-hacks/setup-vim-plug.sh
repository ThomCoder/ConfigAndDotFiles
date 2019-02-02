#!/bin/bash

# This script sets up the necessary folders for
# the Vundle vim plugin manager.
# For more information see:
#	https://github.com/VundleVim/Vundle.vim

cd $HOME
mkdir ~/.vim/tmp
mkdir ~/.vim/tmp/backup
mkdir ~/.vim/tmp/undo
mkdir ~/.vim/tmp/swap
mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

