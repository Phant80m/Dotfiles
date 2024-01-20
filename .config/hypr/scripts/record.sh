#!/bin/env bash

wf-recorder_check() {
	if pgrep -x "wf-recorder" > /dev/null; then
			pkill -INT -x wf-recorder
			notify-send "Stopping all instances of wf-recorder" "$(cat /tmp/recording.txt)"
			wl-copy < "$(cat /tmp/recording.txt)"
			exit 0
	fi
}

wf-recorder_check

SELECTION=$(echo -e "screenshot selection\nscreenshot DP-1\nscreenshot DP-2\nscreenshot both screens\nrecord selection\nrecord DP-1\nrecord DP-2" | fuzzel -d -p "󰄀 " -w 25 -l 6)

IMG="${HOME}/Media/Screenshots/$(date +%Y-%m-%d_%H-%m-%s).png"
VID="${HOME}/Media/Recordings/$(date +%Y-%m-%d_%H-%m-%s).mp4"


case "$SELECTION" in
	"screenshot selection")
		grim -g "$(slurp)" "$IMG"
		wl-copy < "$IMG"
		notify-send "Screenshot Taken" "${IMG}"
		;;
	"screenshot DP-1")
		grim -c -o DP-1 "$IMG"
		wl-copy < "$IMG"
		notify-send "Screenshot Taken" "${IMG}"
		;;
	"screenshot DP-2")
		grim -c -o DP-2 "$IMG"
		wl-copy < "$IMG"
		notify-send "Screenshot Taken" "${IMG}"
		;;
	"screenshot both screens")
		grim -c -o DP-1 "${IMG//.png/-DP-1.png}"
		grim -c -o DP-2 "${IMG//.png/-DP-2.png}"
		montage "${IMG//.png/-DP-1.png}" "${IMG//.png/-DP-2.png}" -tile 2x1 -geometry +0+0 "$IMG" 
		wl-copy < "$IMG"
		rm "${IMG//.png/-DP-1.png}" "${IMG/.png/-DP-2.png}"
		notify-send "Screenshot Taken" "${IMG}"
		;;
	"record selection")
		echo "$VID" > /tmp/recording.txt
		wf-recorder -a -g "$(slurp)" -f "$VID" &>/dev/null
		;;
	"record DP-1")
		echo "$VID" > /tmp/recording.txt
		wf-recorder -a -o DP-1 -f "$VID" &>/dev/null
		;;
	"record DP-2")
		echo "$VID" > /tmp/recording.txt
	wf-recorder -a -o DP-2 -f "$VID" &>/dev/null
	;;
"record both screens")
	notify-send "recording both screens is not functional"
	;;
*)
	;;
esac
