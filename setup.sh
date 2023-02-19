#!/bin/bash

sudo mkdir -p ~/temp
cd ~/temp

# Nix
if ! command -v nix-env &> /dev/null
then
    sh <(curl -L https://nixos.org/nix/install) --daemon
    echo "NIX installed, please restart your shell and run the script again."
    exit
fi

sudo apt install xorg lightdm lightdm-gtk-greeter curl

# Configure LightDM
sudo mkdir -p /etc/lightdm/lightdm.conf.d/
echo "[Seat:*]" | sudo tee -a /etc/lightdm/lightdm.conf.d/01_my.conf
echo "greeter-hide-users=false" | sudo tee -a /etc/lightdm/lightdm.conf.d/01_my.conf

# Simple LightDM GTK theme
[ -d "./simple-lightdm-gtk-theme" ] && sudo rm -rf ./simple-lightdm-gtk-theme
git clone https://github.com/freande/simple-lightdm-gtk-theme.git
cd simple-lightdm-gtk-theme
sudo chmod +x install.sh
sudo ./install.sh
cd ..

# Remove Grub timeout
sudo sed -i 's/^GRUB_TIMEOUT=[[:digit:]]*$/GRUB_TIMEOUT=0/g' /etc/default/grub
sudo update-grub

# Neovim
sudo apt install neovim
nix-env -iA nixpkgs.ripgrep
rm -rf ~/.local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

# Awesome with Yoru
sudo apt install awesome awesome-extra
sudo mkdir -p ~/.config/awesome/

nix-env -iA nixpkgs.wezterm
nix-env -iA nixpkgs.polkit_gnome

sudo apt install picom rofi acpi acpid acpi-call upower lxappearance \
jq inotify-tools xdotool xclip gpick ffmpeg blueman redshift \
pipewire alsa-utils brightnessctl feh maim mpv mpd mpc mpdris2 python3-mutagen ncmpcpp playerctl

sudo systemctl --user enable mpd.service
sudo systemctl --user start mpd.service

[ -d "./yoru" ] && sudo rm -rf ./yoru
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

# vscode
nix-env -iA nixpkgs.vscode

# UFW
sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

sudo apt install neofetch
neofetch
