#!/bin/bash

CUR_DIR="$(dirname "$0")"

mkdir -p $HOME/.config
sudo cp -r $CUR_DIR/files/dotconfig/. $HOME/.config/
sudo cp $CUR_DIR/files/.gtkrc-2.0 $HOME/.gtkrc-2.0 
sudo cp $CUR_DIR/files/.zshrc $HOME/.zshrc
