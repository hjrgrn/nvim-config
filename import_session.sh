#!/usr/bin/env sh

dir=$HOME/.config/nvim/session
if [ -d $dir ]; then
    rm -r ./nvim/session
    cp -r $dir ./nvim/ &&
    echo "Startify session has been imported."
fi
