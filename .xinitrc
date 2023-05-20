# Audio
pulseaudio &

# set monitor positions
xrandr --output DisplayPort-0 --mode 1920x1080 --rate 144 --output HDMI-A-0 --mode 1920x1080 --rate 60 --left-of DisplayPort-0

# block pastes with middle mouse button
xmousepasteblock &

# background
feh --bg-scale ~/Pictures/wallpapers/gruvbox_pixel.png &

# keybindings
sxhkd &

# transparency
picom &

# hide cursor
unclutter &

# sync files
syncthing serve --no-browser &

# suckless
# slstatus &
# dwm

# wm
bspwm
