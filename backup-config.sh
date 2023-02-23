#!/bin/bash

CUR_DIR="$(dirname "$0")"

sudo cp -r $HOME/.config/awesome/. $CUR_DIR/files/dotconfig/awesome/
sudo cp -r $HOME/.config/rofi/. $CUR_DIR/files/dotconfig/rofi/
sudo cp $HOME/.config/gtk-3.0/settings.ini $CUR_DIR/files/dotconfig/gtk-3.0/settings.ini
sudo cp $HOME/.gtkrc-2.0 $CUR_DIR/files/.gtkrc-2.0
sudo cp $HOME/.config/kitty/kitty.conf $CUR_DIR/dotconfig/kitty/kitty.conf
sudo cp $HOME/.zshrc $CUR_DIR/files/.zshrc
