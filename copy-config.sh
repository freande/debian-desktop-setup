#!/bin/bash

CUR_DIR="$(dirname "$0")"

mkdir -p $HOME/.config
sudo cp -r $CUR_DIR/files/dotconfig/. $HOME/.config/
sudo cp $CUR_DIR/files/.gtkrc-2.0 $HOME/.gtkrc-2.0 
sudo cp $CUR_DIR/files/.zshrc $HOME/.zshrc
mkdir -p $HOME/.dircolors
sudo cp $CUR_DIR/files/dircolors.theme $HOME/.dircolors/dircolors.theme
sudo cp $CUR_DIR/files/.fonts.conf $HOME/.fonts.conf

sudo chown -R $USERNAME:$USERNAME /home/$USERNAME
chmod -R +x $HOME/.config/rofi/scripts
chmod +x $HOME/.config/rofi/powermenu/type-3/powermenu.sh
chmod +x $HOME/.config/rofi/launchers/type-3/launcher.sh