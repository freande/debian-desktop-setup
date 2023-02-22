#!/bin/bash

CUR_DIR="$(dirname "$0")"

cp -r /usr/share/doc/alacritty/example/alacritty.yml  ~/.config/alacritty/.alacritty.yml
cp -r /etc/xdg/awesome/rc.lua ~/.config/awesome/rc.lua
cp -r /usr/share/awesome/themes/default/ ~/.config/awesome/themes/default/
rofi -dump-config > ~/.config/rofi/config.rasi
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

chmod +x backup-config
$CUR_DIR/backup-config
