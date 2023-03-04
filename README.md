# Debian Desktop Setup

((WIP!))

My attempt of a script to setup a Debian desktop from a bare install.

> **Do I know what I'm doing?**<br/>
> *Not at all!*<br/>
> **Does it work?**<br/>
> *I hope so!*<br/>
> **Is it finished?**<br/>
> *Can it really be finished?*<br/>

## 🛠️ Setup
To run full setup:
```
./setup.sh
```
To just copy new config:
```
./copy-config.sh
```

## ⚙️ Components
 |  |  |
 | --- | --- |
 | DM | [LightDM](https://github.com/canonical/lightdm) <br/> [LightDM GTK Greeter](https://github.com/Xubuntu/lightdm-gtk-greeter) <br/>[simple-lightdm-gtk-theme](https://github.com/freande/simple-lightdm-gtk-theme) |
 | WM | [Awesome](https://awesomewm.org/) <br/> [Widgets](https://github.com/streetturtle/awesome-wm-widgets) (modified)|
 | Theme | [Yaru](https://github.com/ubuntu/yaru) |
 | Icons | [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) |
 | Launcher | [Rofi](https://github.com/davatorium/rofi) <br/> [adi1090x Config](https://github.com/adi1090x/rofi) |
 | Terminal | [Kitty](https://github.com/kovidgoyal/kitty) <br/> [MaterialDark Theme](https://github.com/dexpota/kitty-themes) |
 | Shell | [Zsh](https://www.zsh.org/) <br/> [Starship](https://starship.rs/) <br/> [Starship Powerline Config](https://github.com/freande/starship-powerline-config) |
 | Dircolors | [Solarized ansi-dark](https://github.com/seebi/dircolors-solarized)
 | Font | [Hack NF Complete Mono](https://github.com/ryanoasis/nerd-fonts.git) |
 | Editors | [Neovim](https://neovim.io/) <br/> [NvChad](https://github.com/NvChad/NvChad) <br/> [vscode](https://code.visualstudio.com/) |
 | Browser | [Chrome](https://www.google.com/chrome/) |
 | Firewall | [UFW](https://manpages.ubuntu.com/manpages/bionic/en/man8/ufw.8.html) |
 |  |  |

 
## 📝 Todo
### break steps into files?
### vscode keybinds
### connman
- prefer ethernet
```
[General]
PreferredTechnologies=ethernet,wifi
```
- bluetooth
  - enable experimental dbus
```
sed -i "s/#Experimental = false/Experimental = true/" /etc/bluetooth/main.conf
```
### To test
- bt keyboard/mouse
- bt sound
- nvim
### Remove nix
- check for debian starship [release](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=946187)
  - use nala instead
- use offical install for vscode
- remove all nix packages
- remove nix
### Update colors in spaceship conf
### Add tmux?