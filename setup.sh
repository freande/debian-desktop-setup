#!/bin/bash

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

  # Packages for fetching
  sudo apt install wget curl

  step "Switch source to Debian Bookworm" switch_source
  step "NIX package manager" install_nix
  step "X display server" install_x
  step "LightDM + GTK Greeter" setup_lightdm_theme
  step "Configure Simple LightDM GTK theme" setup_lightdm_theme
  step "Remove Grub timeout" remove_grubtimeout
  step "Desktop packages" install_desktop_pkgs
  step "AwesomeWM deps" install_awesome_deps
  step "Hack NF font" install_font
  step "Alacritty" install_alacritty
  step "Zsh setup with Starship" setup_zsh
  step "NvChad requirements" install_nvchad_deps
  step "vscode" install_vscode
  step "Chrome (Should really switch to a better browser...)" install_chrome
  step "UFW" install_setup_ufw
  step "Copy config" copy_config
  step "Finish!" wrapup
}

function step {
  echo -e "${GREEN}-------------${NC}"
  echo -e "${LGREEN}Next step: ${YELLOW}$1${NC}"
  echo -e "${GREEN}-------------${NC}"
  echo "<Press enter to continue>"
  read
  $2
}

function switch_source {
  sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
  sudo cp $CUR_DIR/files/sources.list /etc/apt/sources.list
  sudo apt update
  sudo apt upgrade
}

function install_nix {
  if ! command -v nix-env &>/dev/null; then
    sh <(curl -L https://nixos.org/nix/install) --daemon
    echo "NIX installed, please restart your shell and run the script again."
    exit
  fi
}

function install_x {
  sudo apt install xorg x11-xserver-utils
}

function install_lightdm {
  sudo apt install lightdm lightdm-gtk-greeter
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

function install_desktop_pkgs {
  sudo apt install awesome lxappearance materia-gtk-theme papirus-icon-theme rofi zsh zplug picom thunar neovim lxpolkit yad pulseaudio pavucontrol upower connman
  ## maybe pulseaudio-module-bluetooth instead of pulseaudio?
}

function install_awesome_deps {
  sudo apt install luarocks make libgirepository1.0-dev
  ## make sure load-module module-dbus-protocol is present in ~/.config/pulse/default.pa
  sudo luarocks install pulseaudio_widget
  sudo luarocks install connman_widget
  sudo luarocks install power_widget
}

function install_font {
  sudo rm -f $HOME/temp/Hack.zip
  wget -P $HOME/temp/ https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip
  sudo unzip $HOME/temp/Hack.zip -d /usr/share/fonts/
  sudo fc-cache -fv
}

function install_alacritty {
  sudo apt install cargo cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
  cargo install alacritty
}

function setup_zsh {
  chsh -s $(which zsh)
  nix-env -iA nixpkgs.starship
  sudo rm -rf $HOME/temp/starship-powerline-config
  git clone https://github.com/freande/starship-powerline-config.git $HOME/temp/starship-powerline-config
  cp $HOME/temp/starship-powerline-config/starship.toml $HOME/.config/starship.toml
}

function install_nvchad_deps {
  nix-env -iA nixpkgs.ripgrep
  rm -rf $HOME/.local/share/nvim
}

function install_vscode {
  export NIXPKGS_ALLOW_UNFREE=1
  nix-env -iA nixpkgs.vscode
}

function install_chrome {
  sudo rm -f $HOME/temp/google-chrome-stable_current_amd64.deb
  wget -P $HOME/temp/ https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install $HOME/temp/google-chrome-stable_current_amd64.deb
}

function install_setup_ufw {
  sudo apt install ufw
  sudo ufw default deny incoming
  sudo ufw default allow outgoing
  sudo ufw enable
}

function copy_config {
  sudo chmod +x copy-config.sh
  sudo $CUR_DIR/copy-config.sh
}

function wrapup {
  sudo apt install neofetch
  neofetch
}

main
