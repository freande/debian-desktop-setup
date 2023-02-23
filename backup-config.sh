#!/bin/bash

CUR_DIR="$(dirname "$0")"

sudo cp -r $HOME/.config/awesome/. $CUR_DIR/files/dotconfig/awesome/
sudo cp -r $HOME/.config/rofi/. $CUR_DIR/files/dotconfig/rofi/
sudo cp -r $HOME/.config/gtk-3.0/settings.ini $CUR_DIR/files/dotconfig/gtk-3.0/settings.ini
sudo cp -r $HOME/.zshrc $CUR_DIR/files/.zshrc
