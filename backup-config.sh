#!/bin/bash

CUR_DIR="$(dirname "$0")"

sudo cp -r ~/.config/alacritty/alacritty.yml $CUR_DIR/files/.config/alacritty/.alacritty.yml
sudo cp -r ~/.config/awesome/rc.lua $CUR_DIR/files/.config/awesome/rc.lua
sudo cp -r ~/.config/awesome/themes/default $CUR_DIR/files/.config/awesome/themes/
sudo cp -r ~/.config/rofi/config.rasi $CUR_DIR/files/.config/rofi/config.rasi
sudo cp -r ~/.zshrc ./files/.zshrc
