#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5

# Current Theme
dir="$HOME/.config/rofi/powermenu/type-3"
theme='style-1'

# CMDs
uptime="$(uptime -p | sed -e 's/up //g')"
host=$(hostname)

# Options
shutdown='\uf011'
reboot='\uf0e2'
lock='\uea75'
suspend='\uf186'
logout='\uf08b'
yes='\uf00c'
no='\uf00d'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Uptime: $uptime" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
"$(echo -e $shutdown)")
	systemctl poweroff
	;;
"$(echo -e $reboot)")
	systemctl reboot
	;;
"$(echo -e $lock)")
	i3lock -c 000000 -f
	;;
"$(echo -e $suspend)")
	systemctl suspend
	;;
"$(echo -e $logout)")
	echo -E "awesome.quit()" | awesome-client
	;;
esac
