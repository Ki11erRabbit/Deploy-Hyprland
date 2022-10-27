#!/bin/sh


if command -v dbus-launch >/dev/null && test -z "${DBUS_SESSION_BUS_ADDRESS}"; then
       #eval $(dbus-launch --sh-syntax --exit-with-session)
       eval export $(dbus-launch)
fi


#unset XDG_RUNTIME_DIR
#export XDG_RUNTIME_DIR=$(mktemp -d /tmp/$(id -u)-runtime-dir.XXX)

/usr/libexec/polkit-gnome-authentication-agent-1 &
/usr/bin/gentoo-pipewire-launcher &

wireplumber &


kdeconnect-indicator &
/usr/lib/pentablet/pentablet.sh &
dex -a -s /home/ki11errabbit/.config/autostart &

doas mullvad-daemon &
fnott &
copyq &
playerctld daemon &
eww daemon &
waybar &
#eww -c /home/ki11errabbit/.config/eww/bar open bar &
#eww -c /home/ki11errabbit/.config/eww/bar open bar2 &
wpaperd &

export WEATHER_OPTION=0 &
export SESSION=wayland &


swayidle -w \
    before-sleep 'hyprland-lock' & 
    #before-sleep 'swaylock -f -i "/home/ki11errabbit/Pictures/Wallpapers/dwm/Femboy/5e7c42772f8abdf56785c4c27a7471f80119f916.jpg"' &
