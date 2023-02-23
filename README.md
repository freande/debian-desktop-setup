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
 | WM | [Awesome](https://awesomewm.org/) |
 | Theme | [Materia](https://github.com/nana-4/materia-theme) |
 | Icons | [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) |
 | Launcher | [Rofi](https://github.com/davatorium/rofi) <br/> [Addons](https://github.com/adi1090x/rofi) |
 | Terminal | [Alacritty](https://alacritty.org/) <br/> [Starship](https://starship.rs/) <br/> [Starship Powerline Config](https://github.com/freande/starship-powerline-config) |
 | Shell | [Zsh](https://www.zsh.org/) |
 | Font | [Hack NF Complete Mono](https://github.com/ryanoasis/nerd-fonts.git) |
 | Editors | [Neovim](https://neovim.io/) <br/> [NvChad](https://github.com/NvChad/NvChad) <br/> [vscode](https://code.visualstudio.com/) |
 | Browser | [Chrome](https://www.google.com/chrome/) |
 | Firewall | [UFW](https://manpages.ubuntu.com/manpages/bionic/en/man8/ufw.8.html) |
 |  |  |

### Awesome Components
|  |  |
 |---|---|
 | Battery Widget | [awesome-power_widget](https://github.com/stefano-m/awesome-power_widget) |
 | Network Widget | [awesome-connman_widget](https://github.com/stefano-m/awesome-connman_widget) |
 | Volume Widget | [awesome-pulseaudio_widget](https://github.com/stefano-m/awesome-pulseaudio_widget) |
 |  |  |
 
## 📝 Todo
### Rmove unnecessary calls to $home
### To test
- wifi
- bt keyboard/mouse
- bt sound
- nvim
### Add skip option
### Add launch args
- list steps
- choose steps to run
- auto?
### Theme?
- read [this](http://epsi-rns.github.io/desktop/2019/06/15/awesome-overview.html)
- can I find the GTK theme settings?
  - set theme and icons with lxapearance
  - look in some conf files (xresources?)
  - (hopefully) backup some file
  - (hopefully) remové lx apearance
- cleanup after awesome themes? (remove default theme?)
- remove murraine
  - sudo apt remove gtk2-engines-murrine
  - sudo rm -rf ~/.themes
- remove space between
- only use a few workspaces, 5? I II III IV V?
- hide topbar? only show widgets?
- remove menu button?
- set hack nf mono as default font everywhere
- set alacritty as default terminal
- bluetooth widget?
### Configure Rofi
- [Addons](https://github.com/adi1090x/rofi) only get files needed from git
- configure
- autorun?
- backup config
- keybinings?