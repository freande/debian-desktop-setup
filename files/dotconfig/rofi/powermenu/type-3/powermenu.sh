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

# Execute Command
run_cmd() {
	if [[ $1 == '--shutdown' ]]; then
		systemctl poweroff
	elif [[ $1 == '--reboot' ]]; then
		systemctl reboot
	elif [[ $1 == '--suspend' ]]; then
		systemctl suspend
	elif [[ $1 == '--logout' ]]; then
		echo -E "awesome.quit()" | awesome-client
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
"$(echo -e $shutdown)")
	run_cmd --shutdown
	;;
"$(echo -e $reboot)")
	run_cmd --reboot
	;;
"$(echo -e $lock)")
	if [[ -x '/usr/bin/betterlockscreen' ]]; then
		betterlockscreen -l
	elif [[ -x '/usr/bin/i3lock' ]]; then
		i3lock
	fi
	;;
"$(echo -e $suspend)")
	run_cmd --suspend
	;;
"$(echo -e $logout)")
	run_cmd --logout
	;;
esac
