#!/bin/bash

GREEN='\033[0;32m'
LGREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

step () {
    echo -e "${GREEN}-------------${NC}"
    echo -e "${LGREEN}Next step: ${YELLOW}$1${NC}"
    echo -e "${GREEN}-------------${NC}"
    echo "<Press enter to continue>"
    read
    echo
}

if [ "$EUID" -e 0 ]
  then echo "Please don't run as root"
  exit
fi

sudo mkdir -p ~/temp

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
[ -d "~/temp/simple-lightdm-gtk-theme" ] && sudo rm -rf ~/temp/simple-lightdm-gtk-theme
git clone https://github.com/freande/simple-lightdm-gtk-theme.git ~/temp/simple-lightdm-gtk-theme
sudo chmod +x ~/temp/simple-lightdm-gtk-theme/install.sh
sudo ~/temp/simple-lightdm-gtk-theme/install.sh

step "Remove Grub timeout"
sudo sed -i 's/^GRUB_TIMEOUT=[[:digit:]]*$/GRUB_TIMEOUT=0/g' /etc/default/grub
sudo update-grub

step "Desktop packages"
sudo apt install awesome rofi zsh zplug picom thunar neovim lxpolkit yad pulseaudio pavucontrol upower connman
## maybe pulseaudio-module-bluetooth instead of pulseaudio?

step "Copy config"
sudo chmod +x copy-config.sh
sudo ./copy-config.sh

step "AwesomeWM deps"
sudo apt install luarocks
sudo luarocks install pulseaudio_dbus
## make sure load-module module-dbus-protocol is present in ~/.config/pulse/default.pa
sudo luarocks install pulseaudio_widget
sudo luarocks install connman_dbus
sudo luarocks install connman_widget
sudo luarocks install upower_dbus
sudo luarocks install power_widget

step "Hack NF font"
wget -P ~/temp/ https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip
unzip ~/temp/Hack.zip -d /usr/share/fonts/
sudo fc-cache -fv

step "Alacritty"
nix-env -iA nixpkgs.alacritty

step "Zsh setup"
chsh -s $(which zsh)
nix-env -iA nixpkgs.starship

step "Starship config"
git clone https://github.com/freande/starship-powerline-config.git ~/temp/starship-powerline-config
cp ~/temp/starship-powerline-config/starship.toml ~/.config/starship.toml

step "Neovim config (NvChad)"
nix-env -iA nixpkgs.ripgrep
rm -rf ~/.local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

step "vscode"
export NIXPKGS_ALLOW_UNFREE=1
nix-env -iA nixpkgs.vscode

step "Chrome (Should really switch to a better browser...)"
wget -P ~/temp/ https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ~/temp/google-chrome-stable_current_amd64.deb

step "UFW"
sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

step "Finish!"
sudo apt install neofetch
neofetch
