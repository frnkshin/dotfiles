#!/usr/bin/env sh

killall -q polybar

while pgrep -x polybar >/dev/null;
  do sleep 1;
done

# turn off screensaving
xset s off
xset -dpms
xset s noblank

# number of active monitors
# num_active=$(xrandr | grep "*+" | wc -l)

# number of connected monitors
# num_connected=$(xrandr | grep "+" | wc -l)

num_listmonitors=$(xrandr --listmonitors)
num_listactivemonitors=$(xrandr --listactivemonitors)

echo $num_listmonitors > monitors
echo $num_listactivemonitors >> monitors

'if [ $num_active -eq 1 ]
  then
    xrandr --output LVDS1 --auto --primary
    cp ~/.config/i3/config_lvds ~/.config/i3/config
    polybar LVDS1 &

    echo "Bars launched"
    i3-msg restart
fi

if [ $num_active -eq 2 ]
  then
    xrandr --output DP1 --auto --primary
    xrandr --output LVDS1 --off
    cp ~/.config/i3/config_apple ~/.config/i3/config
    polybar DP1 &

    echo "Bars launched"
    i3-msg restart
fi

if [ $num_active -eq 3 ]
  then
    echo "success"
    xrandr --output DP1 --auto --primary
    xrandr --output LVDS1 --off
    xrandr --output VGA1 --auto --above DP1
    cp ~/.config/i3/config_dual_home ~/.config/i3/config
    polybar DP1 &

    i3-msg restart
fi'
