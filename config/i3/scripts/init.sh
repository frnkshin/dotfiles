#!/usr/bin/env sh

# POLYBAR Initialization
killall -q polybar

while pgrep -x polybar >/dev/null;
  do sleep 1;
done

# turn off screensaving
xset s off
xset -dpms
xset s noblank

num_init_monitors=$(xrandr --listmonitors | awk '{print $2}' | awk 'NR == 1')

echo $num_init_monitors > ~/.config/i3/log

if [ $num_init_monitors -eq 1 ]
then
    xrandr --output LVDS-1 --auto --primary
    cp ~/.config/i3/config_lvds ~/.config/i3/config
    echo 'Single monitor at 1600x900 to LVDS1' >> ~/.config/i3/log
    # sh ~/.config/i3/lemonbar/i3_lemonbar.sh
    echo '... & Restarting i3' >> ~/.config/i3/log
    i3-msg restart
elif [ $num_init_monitors -eq 2 ]
then
    echo 'Starting DP1' >> ~/.config/i3/log
    xrandr --output DP-1 --auto --primary >> ~/.config/i3/log
    echo 'Turning off LVDS1' >> ~/.config/i3/log
    xrandr --output LVDS-1 --off >> ~/.config/i3/log
    cp ~/.config/i3/config_lvds ~/.config/i3/config
    polybar DP1 &
    echo 'Starting polybar on DP1' >> ~/.config/i3/log
    echo '... & Restarting i3' >> ~/.config/i3/log
    i3-msg restart
else
   xrandr --output DP-1 --off
   xrandr --output VGA-1 --off
    cp ~/.config/i3/config_lvds ~/.config/i3/config
    polybar LVDS1 &
    echo 'Starting polybar on LVDS1' >> ~/.config/i3/log
    echo '... & Restarting i3' >> ~/.config/i3/log
    i3-msg restart
fi
