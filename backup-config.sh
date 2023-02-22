#!/bin/bash

CUR_DIR="$(dirname "$0")"

sudo cp -r ~/.config/alacritty/alacritty.yml $CUR_DIR/files/.config/alacritty/alacritty.yml
sudo cp -r ~/.config/awesome/rc.lua $CUR_DIR/files/.config/awesome/rc.lua
sudo cp -r ~/.config/awesome/themes/. $CUR_DIR/files/.config/awesome/themes/
sudo cp -r ~/.config/rofi/. $CUR_DIR/files/.config/rofi/
sudo cp -r ~/.zshrc ./files/.zshrc
