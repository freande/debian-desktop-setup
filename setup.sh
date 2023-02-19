#!/bin/bash

mkdir ~/temp
cd ~/temp

sudo apt install xorg lightdm

# Configure LightDM
sudo mkdir -p /etc/lightdm/lightdm.conf.d/
echo "[Seat:*]" | sudo tee -a /etc/lightdm/lightdm.conf.d/01_my.conf
echo "greeter-hide-users=false" | sudo tee -a /etc/lightdm/lightdm.conf.d/01_my.conf
echo "greeter-session=nody-greeter" | sudo tee -a /etc/lightdm/lightdm.conf.d/01_my.conf

# Simple LightDM GTK theme
git clone https://github.com/freande/simple-lightdm-gtk-theme.git
cd simple-lightdm-gtk-theme
sudo install.sh
cd ..

# Remove Grub timeout
sudo sed -i 's/^GRUB_TIMEOUT=[[:digit:]]*$/GRUB_TIMEOUT=0/g' /etc/default/grub
sudo update-grub

# Awesome with Yoru
sudo apt install awesome awesome-extra
sudo mkdir -p ~/.config/awesome/

sudo apt-get install 'gtk2-engines*' --no-install-recommends
sudo apt install picom kitty rofi acpi acpid acpi_call upower lxappearance \
jq inotify-tools polkit-gnome xdotool xclip gpick ffmpeg blueman redshift \
pipewire pipewire-alsa pipewire-pulse alsa-utils brightnessctl feh maim \
mpv mpd mpc mpdris2 python3-mutagen ncmpcpp playerctl --needed

sudo systemctl --user enable mpd.service
sudo systemctl --user start mpd.service

git clone --depth 1 --recurse-submodules https://github.com/rxyhn/yoru.git
cd yoru && git submodule update --remote --merge

sudo cp -r config/* ~/.config/
sudo cp -r misc/fonts/* ~/.fonts/
sudo fc-cache -fv
cd ..

# network networkmanager-wifi?
# sound?
# files Thunar
# arandr?

# Cleanup
cd ~
sudo rm -rf temp

sudo apt install neofetch
neofetch
