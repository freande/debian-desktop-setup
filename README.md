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
To add current config to repo:
```
./backup-config.sh
```

## ⚙️ Components
 |  |  |
 | --- | --- |
 | DM | [LightDM](https://github.com/canonical/lightdm) <br/> [LightDM GTK Greeter](https://github.com/Xubuntu/lightdm-gtk-greeter) <br/>[simple-lightdm-gtk-theme](https://github.com/freande/simple-lightdm-gtk-theme) |
 | WM | [Awesome](https://awesomewm.org/) <br/> [Widgets](https://github.com/streetturtle/awesome-wm-widgets)|
 | Theme | [Materia](https://github.com/nana-4/materia-theme) |
 | Icons | [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) |
 | Launcher | [Rofi](https://github.com/davatorium/rofi) <br/> [adi1090x Config](https://github.com/adi1090x/rofi) |
 | Terminal | [Kitty](https://github.com/kovidgoyal/kitty) <br/> [MaterialDark Theme](https://github.com/dexpota/kitty-themes) |
 | Shell | [Zsh](https://www.zsh.org/) <br/> [Starship](https://starship.rs/) <br/> [Starship Powerline Config](https://github.com/freande/starship-powerline-config) |
 | Dircolors | [Jellybeans](https://github.com/peterhellberg/dircolors-jellybeans/blob/master/dircolors.jellybeans)
 | Font | [Hack NF Complete Mono](https://github.com/ryanoasis/nerd-fonts.git) |
 | Editors | [Neovim](https://neovim.io/) <br/> [NvChad](https://github.com/NvChad/NvChad) <br/> [vscode](https://code.visualstudio.com/) |
 | Browser | [Chrome](https://www.google.com/chrome/) |
 | Firewall | [UFW](https://manpages.ubuntu.com/manpages/bionic/en/man8/ufw.8.html) |
 |  |  |

 
## 📝 Todo
### vscode keybinds
### To test
- bt keyboard/mouse
- bt sound
- nvim
- mic
- cam
### Theme
- read [this](http://epsi-rns.github.io/desktop/2019/06/15/awesome-overview.html)
- only use a few workspaces, 5? I II III IV V?
- menu button (mylauncher) -> power
- widgets
  - network?
  - bluetooth?
- keybindings?