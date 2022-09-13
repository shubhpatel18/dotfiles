if [ -z "$DISPLAY" ] ; then
	xrandr --output DP-1 --above eDP-1
	exec startx
fi
