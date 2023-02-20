#!/bin/bash

sudo mkdir -p ~/temp
cd ~/temp

# Packages for fetching
sudo apt install wget curl

# NIX package manager
if ! command -v nix-env &> /dev/null
then
    sh <(curl -L https://nixos.org/nix/install) --daemon
    echo "NIX installed, please restart your shell and run the script again."
    exit
fi

# X display server
sudo apt install xorg x11-xserver-utils

# LightDM + GTK Greeter
sudo apt install lightdm lightdm-gtk-greeter

# Configure LightDM
sudo mkdir -p /etc/lightdm/lightdm.conf.d/
sudo rm /etc/lightdm/lightdm.conf.d/01_my.conf  ## Make conditional instead
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

# Required packages
sudo apt install awesome rofi zsh zplug picom thunar neovim policykit-1 lxpolkit yad pulseaudio pavucontrol upower connman bluez
## maybe pulseaudio-module-bluetooth instead of pulseaudio?

# Copy config
## Uncomment later
# sudo chmod +x copy-config.sh
# sudo ./copy-config.sh

# AwesomeWM config?
sudo apt install luarocks
luarocks install pulseaudio_dbus
## make sure load-module module-dbus-protocol is present in ~/.config/pulse/default.pa
luarocks install pulseaudio_widget
luarocks install connman_dbus
luarocks install connman_widget
luarocks install upower_dbus
luarocks install power_widget

# Rofi config?

# Hack NF font
mkdir temp
cd temp
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
## Chmod?
./install.sh Hack
sudo fc-cache -fv ## Needed?
cd ..

# Alacritty terminal
nix-env -iA nixpkgs.alacritty

# Alacritty config?

# Set Zsh as default shell
chsh -s $(which zsh)

# Starship
nix-env -iA nixpkgs.starship
cat "starship init fish | source" | sudo tee -a ~/.config/fish/config.fish ## Make conditional

# Starship config
git clone https://github.com/freande/starship-powerline-config.git
cd starship-powerline-config
cp ./starship.toml ~/.config/starship.toml
cd ..

# Neovim config (NvChad)
nix-env -iA nixpkgs.ripgrep
rm -rf ~/.local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# vscode
export NIXPKGS_ALLOW_UNFREE=1
nix-env -iA nixpkgs.vscode

# UFW
sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

sudo apt install neofetch
neofetch
