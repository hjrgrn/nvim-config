#!/usr/bin/env sh


dir=$HOME/.local/share/nvim
if [ -d $dir ]; then
    rm -fr $dir
fi

dir=$HOME/.local/state/nvim
if [ -d $dir ]; then
    rm -fr $dir
fi

dir=$HOME/.config/nvim
if [ -d $dir ]; then
    rm -fr $dir
fi

cp -r nvim $dir

echo 'Neovim has been configured.'
