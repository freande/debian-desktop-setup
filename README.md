# Debian Desktop Setup

((WIP!))

My attempt of a script to setup a Debian desktop from a bare install.

# Todo
## Configs to copy (and then update)
- cp -r /usr/share/doc/alacritty/example/alacritty.yml  ~/.config/alacritty/.alacritty.yml
- cp -r /etc/xdg/awesome/rc.lua ~/.config/awesome/rc.lua
- cp -r /usr/share/awesome/themes/default/ ~/.config/awesome/themes/default/
- rofi -dump-config > ~/.config/rofi/config.rasi

## Awesome Widgets
 - Battery : [awesome-power_widget](https://github.com/stefano-m/awesome-power_widget)
 - Network : [awesome-connman_widget](https://github.com/stefano-m/awesome-connman_widget)
 - Volume : [awesome-pulseaudio_widget](https://github.com/stefano-m/awesome-pulseaudio_widget)