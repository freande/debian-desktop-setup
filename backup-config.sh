#!/bin/bash

CUR_DIR="$(dirname "$0")"

sudo cp -r $HOME/dotconfig/alacritty/alacritty.yml $CUR_DIR/files/.config/alacritty/alacritty.yml
sudo cp -r $HOME/dotconfig/awesome/rc.lua $CUR_DIR/files/.config/awesome/rc.lua
sudo cp -r $HOME/dotconfig/rofi/. $CUR_DIR/files/.config/rofi/
sudo cp -r $HOME/.zshrc ./files/.zshrc
