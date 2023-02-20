# Debian Desktop Setup

((WIP!))

My attempt of a script to setup a Debian desktop from a bare install.

## Instructions
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

## Stuff used
 | Type | What |
 | --- | --- |
 | DM | [LightDM](https://github.com/canonical/lightdm), [LightDM GTK Greeter](https://github.com/Xubuntu/lightdm-gtk-greeter), [simple-lightdm-gtk-theme](https://github.com/freande/simple-lightdm-gtk-theme) |
 | Font | [Hack NF Complete Mono](https://github.com/ryanoasis/nerd-fonts.git) |
 | Shell | [Zsh](https://www.zsh.org/) |
 | Terminal | : [Alacritty](https://alacritty.org/), [Starship](https://starship.rs/), [Starship Powerline Config](https://github.com/freande/starship-powerline-config) |
 | Editors | : [Neovim](https://neovim.io/), [NvChad](https://github.com/NvChad/NvChad), [vscode](https://code.visualstudio.com/) |
 | Browser | : [Chrome](https://www.google.com/chrome/) |
 | Launcher | : [Rofi](https://github.com/davatorium/rofi) |
 | Firewall | : [UFW](https://manpages.ubuntu.com/manpages/bionic/en/man8/ufw.8.html) |
 | WM | : [Awesome](https://awesomewm.org/) |

### Awesome Widgets
| Type | What |
 |---|---|
 | Battery |  Widget: [awesome-power_widget](https://github.com/stefano-m/awesome-power_widget) |
 | Network |  Widget: [awesome-connman_widget](https://github.com/stefano-m/awesome-connman_widget) |
 | Volume |  Widget: [awesome-pulseaudio_widget](https://github.com/stefano-m/awesome-pulseaudio_widget) |
 
## Todo
### Style install script a bit ;p
### Configs to copy (and then update)
- cp -r /usr/share/doc/alacritty/example/alacritty.yml  ~/.config/alacritty/.alacritty.yml
- cp -r /etc/xdg/awesome/rc.lua ~/.config/awesome/rc.lua
- cp -r /usr/share/awesome/themes/default/ ~/.config/awesome/themes/default/
- rofi -dump-config > ~/.config/rofi/config.rasi
### Theme?
- read [this](http://epsi-rns.github.io/desktop/2019/06/15/awesome-overview.html)
- remove space between
- find gtk theme? how does that work?
- only use a few workspaces, 5? I II III IV V?
- hide topbar? only show widgets?
- remove menu button?
- set hack nf mono as default font everywhere
- set alacritty as default terminal
- bluetooth widget?
