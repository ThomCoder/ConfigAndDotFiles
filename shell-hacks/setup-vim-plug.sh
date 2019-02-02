#!/bin/bash

# This script sets up the
# the Vim-Plug plugin manager.
# For more information see:
#	https://github.com/VundleVim/Vundle.vim

cd $HOME
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

