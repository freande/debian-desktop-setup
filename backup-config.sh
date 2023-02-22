#!/bin/bash

CUR_DIR="$(dirname "$0")"

cp -r ~/.config/alacritty/.alacritty.yml $CUR_DIR/files/.config/alacritty/.alacritty.yml
cp -r ~/.config/awesome/rc.lua $CUR_DIR/files/.config/awesome/rc.lua
cp -r ~/.config/awesome/themes/default $CUR_DIR/files/.config/awesome/themes/
cp -r ~/.config/rofi/config.rasi $CUR_DIR/files/.config/rofi/config.rasi
cp -r ~/.zshrc ./files/.zshrc
