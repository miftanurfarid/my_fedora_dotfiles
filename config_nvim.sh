#!/bin/bash

dnf install global-ctags ack
mkdir -p ~/.config/nvim
wget https://raw.githubusercontent.com/fisadev/fisa-vim-config/v12.0.1/config.vim -O ~/.config/nvim/init.vim
nvim

