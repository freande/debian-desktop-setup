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
 - LightDM
 - LightDM GTK Greeter
 - AwesomeWM
 - Battery Widget: [awesome-power_widget](https://github.com/stefano-m/awesome-power_widget)
 - Network Widget: [awesome-connman_widget](https://github.com/stefano-m/awesome-connman_widget)
 - Volume Widget: [awesome-pulseaudio_widget](https://github.com/stefano-m/awesome-pulseaudio_widget)
 
## Todo
### Style install script a bit ;p
### Add browser install
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
