#!/bin/bash

cd ~
mkdir temp
cd temp

sudo apt install xorg lightdm

# Web Greeter
sudo apt install liblightdm-gobject-dev python3-gi python3-pyqt5 \
python3-pyqt5.qtwebengine python3-ruamel.yaml python3-pyinotify \
libqt5webengine5 gobject-introspection libxcb1-dev libx11-dev

wget https://github.com/JezerM/web-greeter/releases/download/3.5.2/web-greeter-3.5.2-ubuntu.deb
sudo apt install ./web-greeter-3.5.2-ubuntu.deb
# TODO: Change settings/theme in /etc/lightdm/web-greeter.yml

sudo mkdir -p /etc/lightdm/lightdm.conf.d/
echo "[Seat:*]" | sudo tee -a /etc/lightdm/lightdm.conf.d/01_my.conf
echo "greeter-hide-users=false" | sudo tee -a /etc/lightdm/lightdm.conf.d/01_my.conf
echo "greeter-session=nody-greeter" | sudo tee -a /etc/lightdm/lightdm.conf.d/01_my.conf

# Remove Grub timeout
sudo sed -i 's/^GRUB_TIMEOUT=[[:digit:]]*$/GRUB_TIMEOUT=0/g' /etc/default/grub
sudo update-grub

# Awesome with Yoru
sudo apt install awesome awesome-extra
mkdir -p ~/.config/awesome/

sudo apt-get install 'gtk2-engines*' --no-install-recommends
sudo apt install picom kitty rofi acpi acpid acpi_call upower lxappearance \
jq inotify-tools polkit-gnome xdotool xclip gpick ffmpeg blueman redshift \
pipewire pipewire-alsa pipewire-pulse alsa-utils brightnessctl feh maim \
mpv mpd mpc mpdris2 python3-mutagen ncmpcpp playerctl --needed

systemctl --user enable mpd.service
systemctl --user start mpd.service

git clone --depth 1 --recurse-submodules https://github.com/rxyhn/yoru.git
cd yoru && git submodule update --remote --merge

cp -r config/* ~/.config/
cp -r misc/fonts/* ~/.fonts/
fc-cache -fv
cd ..

# network networkmanager-wifi?
# sound?
# files Thunar
# arandr?

# Cleanup
cd ~
rm -rf temp

sudo apt install neofetch
neofetch
