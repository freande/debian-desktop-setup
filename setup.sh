#!/bin/bash

step () {
    echo
    echo
    echo "Next step: $1"
    echo "<Press enter to continue>"
    read
}

sudo mkdir -p ~/temp
cd ~/temp

# Packages for fetching
sudo apt install wget curl

if ! command -v nix-env &> /dev/null
then
    step "NIX package manager"
    sh <(curl -L https://nixos.org/nix/install) --daemon
    echo "NIX installed, please restart your shell and run the script again."
    exit
fi

step "X display server"
sudo apt install xorg x11-xserver-utils

step "LightDM + GTK Greeter"
sudo apt install lightdm lightdm-gtk-greeter

step "Configure LightDM"
sudo mkdir -p /etc/lightdm/lightdm.conf.d/
sudo rm /etc/lightdm/lightdm.conf.d/01_my.conf  ## Make conditional instead
echo "[Seat:*]" | sudo tee -a /etc/lightdm/lightdm.conf.d/01_my.conf
echo "greeter-hide-users=false" | sudo tee -a /etc/lightdm/lightdm.conf.d/01_my.conf

step "Simple LightDM GTK theme"
[ -d "./simple-lightdm-gtk-theme" ] && sudo rm -rf ./simple-lightdm-gtk-theme
git clone https://github.com/freande/simple-lightdm-gtk-theme.git
cd simple-lightdm-gtk-theme
sudo chmod +x install.sh
sudo ./install.sh
cd ..

step "Remove Grub timeout"
sudo sed -i 's/^GRUB_TIMEOUT=[[:digit:]]*$/GRUB_TIMEOUT=0/g' /etc/default/grub
sudo update-grub

step "Desktop packages"
sudo apt install awesome rofi zsh zplug picom thunar neovim policykit-1 lxpolkit yad pulseaudio pavucontrol upower connman bluez
## maybe pulseaudio-module-bluetooth instead of pulseaudio?

step "Copy config"
sudo chmod +x copy-config.sh
sudo ./copy-config.sh

step "AwesomeWM deps"
sudo apt install luarocks
luarocks install pulseaudio_dbus
## make sure load-module module-dbus-protocol is present in ~/.config/pulse/default.pa
luarocks install pulseaudio_widget
luarocks install connman_dbus
luarocks install connman_widget
luarocks install upower_dbus
luarocks install power_widget

step "Hack NF font"
mkdir temp
cd temp
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
## Chmod?
./install.sh Hack
sudo fc-cache -fv ## Needed?
cd ..

step "Alacritty"
nix-env -iA nixpkgs.alacritty

step "Zsh setup"
chsh -s $(which zsh)
nix-env -iA nixpkgs.starship

step "Starship config"
git clone https://github.com/freande/starship-powerline-config.git
cd starship-powerline-config
cp ./starship.toml ~/.config/starship.toml
cd ..

step "Neovim config (NvChad)"
nix-env -iA nixpkgs.ripgrep
rm -rf ~/.local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

step "vscode"
export NIXPKGS_ALLOW_UNFREE=1
nix-env -iA nixpkgs.vscode

step "Chrome (Should really switch to a better browser...)"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

step "UFW"
sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

step "Finish!"
sudo apt install neofetch
neofetch
