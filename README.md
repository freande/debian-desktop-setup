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
To run full install:
```
install.sh
```
To just copy new config:
```
copy-config.sh
```
To add current config to repo:
```
backup-config.sh
```

## ⚙️ Components
 |  |  |
 | --- | --- |
 | DM | [LightDM](https://github.com/canonical/lightdm) <br/> [LightDM GTK Greeter](https://github.com/Xubuntu/lightdm-gtk-greeter) <br/>[simple-lightdm-gtk-theme](https://github.com/freande/simple-lightdm-gtk-theme) |
 | WM | [Awesome](https://awesomewm.org/) |
 | Launcher | [Rofi](https://github.com/davatorium/rofi) |
 | Terminal | [Alacritty](https://alacritty.org/) <br/> [Starship](https://starship.rs/) <br/> [Starship Powerline Config](https://github.com/freande/starship-powerline-config) |
 | Shell | [Zsh](https://www.zsh.org/) |
 | Font | [Hack NF Complete Mono](https://github.com/ryanoasis/nerd-fonts.git) |
 | Editors | [Neovim](https://neovim.io/) <br/> [NvChad](https://github.com/NvChad/NvChad) <br/> [vscode](https://code.visualstudio.com/) |
 | Browser | [Chrome](https://www.google.com/chrome/) |
 | Firewall | [UFW](https://manpages.ubuntu.com/manpages/bionic/en/man8/ufw.8.html) |
 |  |  |

### Awesome Parts
|  |  |
 |---|---|
 | Battery Widget | [awesome-power_widget](https://github.com/stefano-m/awesome-power_widget) |
 | Network Widget | [awesome-connman_widget](https://github.com/stefano-m/awesome-connman_widget) |
 | Volume Widget | [awesome-pulseaudio_widget](https://github.com/stefano-m/awesome-pulseaudio_widget) |
 |  |  |
 
## 📝 Todo
### Test it!
### Configs to copy (and then update)
- cp -r /usr/share/doc/alacritty/example/alacritty.yml  ~/.config/alacritty/.alacritty.yml
- cp -r /etc/xdg/awesome/rc.lua ~/.config/awesome/rc.lua
- cp -r /usr/share/awesome/themes/default/ ~/.config/awesome/themes/default/
- rofi -dump-config > ~/.config/rofi/config.rasi
### Theme?
- read [this](http://epsi-rns.github.io/desktop/2019/06/15/awesome-overview.html)
- remove space between
- only use a few workspaces, 5? I II III IV V?
- hide topbar? only show widgets?
- remove menu button?
- set hack nf mono as default font everywhere
- set alacritty as default terminal
- bluetooth widget?
