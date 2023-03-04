#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
LGREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

CUR_DIR="$(dirname "$0")"

function main {
  if [ "$EUID" -eq 0 ]; then
    echo "Please don't run as root"
    exit
  fi

  sudo mkdir -p $HOME/temp

  step "Switch source to Debian Bookworm" switch_source
  step "Install Nala, cURL, wget" install_fetch_pkgs
  step "Install NIX package manager" install_nix
  step "Install desktop packages" install_desktop_pkgs
  step "Configure Simple LightDM GTK theme" setup_lightdm_theme
  step "Remove Grub timeout" remove_grubtimeout
  step "Configure Connman-GTK" setup_connman_gtk
  step "Install Hack NF font" install_hack_font
  step "Setup Zsh with Starship" setup_zsh
  step "Remove .local/share/nvim for NvChad" remove_localnvimshare_nvchad
  step "Install Visual Studio Code" install_vscode
  step "Install Google Chrome (Should really switch to a better browser...)" install_chrome
  step "Setup UFW" setup_ufw
  step "Copy config" copy_config
  
  neofetch
}

function step {
  echo -e "${GREEN}-------------${NC}"
  echo -e "${LGREEN}Next step: ${YELLOW}$1${NC}"
  echo -e "${GREEN}-------------${NC}"
  echo "<Press enter to continue> (s to skip this step)"
  read
  if [ "$REPLY" != "s" ] && [ "$REPLY" != "S" ]; then
    $2
  else
    echo -e "${RED}Skipping...${NC}"
  fi
}

function switch_source {
  sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
  sudo cp $CUR_DIR/files/sources.list /etc/apt/sources.list
  sudo apt update
  sudo apt upgrade
}

function install_fetch_pkgs {
  sudo apt install nala wget curl
}

function install_nix {
  if ! command -v nix-env &>/dev/null; then
    sh <(curl -L https://nixos.org/nix/install) --daemon
    echo "NIX installed, please restart your shell and run the script again."
    exit
  fi
}

function install_desktop_pkgs {
  sudo nala install xorg x11-xserver-utils lightdm lightdm-gtk-greeter \
  awesome yaru-theme-gtk papirus-icon-theme rofi i3lock kitty zsh zplug \
  thunar neovim ripgrep lxpolkit pulseaudio pavucontrol connman connman-gtk \
  libglib2.0-bin ufw neofetch fonts-noto-color-emoji htop
  ## maybe pulseaudio-module-bluetooth instead of pulseaudio?
}

function setup_lightdm_theme {
  sudo mkdir -p /etc/lightdm/lightdm.conf.d/
  sudo rm /etc/lightdm/lightdm.conf.d/01_my.conf
  echo "[Seat:*]" | sudo tee -a /etc/lightdm/lightdm.conf.d/01_my.conf
  echo "greeter-hide-users=false" | sudo tee -a /etc/lightdm/lightdm.conf.d/01_my.conf
  sudo rm -rf $HOME/temp/simple-lightdm-gtk-theme
  git clone https://github.com/freande/simple-lightdm-gtk-theme.git $HOME/temp/simple-lightdm-gtk-theme
  sudo chmod +x $HOME/temp/simple-lightdm-gtk-theme/install.sh
  sudo $HOME/temp/simple-lightdm-gtk-theme/install.sh
}

function remove_grubtimeout {
  sudo sed -i 's/^GRUB_TIMEOUT=[[:digit:]]*$/GRUB_TIMEOUT=0/g' /etc/default/grub
  sudo update-grub
}

function setup_connman_gtk {
  gsettings set net.connman.gtk launch-to-tray false
  gsettings set net.connman.gtk openconnect-use-fsid-by-default false
  gsettings set net.connman.gtk status-icon-enabled false
}

function install_hack_font {
  sudo rm -f $HOME/temp/Hack.zip
  wget -P $HOME/temp/ https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip
  sudo unzip $HOME/temp/Hack.zip -d /usr/share/fonts/
  sudo fc-cache -fv
}

function setup_zsh {
  chsh -s $(which zsh)
  nix-env -iA nixpkgs.starship
  sudo rm -rf $HOME/temp/starship-powerline-config
  git clone https://github.com/freande/starship-powerline-config.git $HOME/temp/starship-powerline-config
  cp $HOME/temp/starship-powerline-config/starship.toml $HOME/.config/starship.toml
}

function remove_localnvimshare_nvchad {
  rm -rf $HOME/.local/share/nvim
}

function install_vscode {
  sudo rm -f $HOME/temp/vscode.deb
  curl -o $HOME/temp/vscode.deb -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
  sudo nala install $HOME/temp/vscode.deb
}

function install_chrome {
  sudo rm -f $HOME/temp/chrome.deb
  curl -o $HOME/temp/chrome.deb -L "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
  sudo nala install $HOME/temp/chrome.deb
}

function setup_ufw {
  sudo ufw default deny incoming
  sudo ufw default allow outgoing
  sudo ufw enable
}

function copy_config {
  sudo chmod +x copy-config.sh
  sudo $CUR_DIR/copy-config.sh
}

main
