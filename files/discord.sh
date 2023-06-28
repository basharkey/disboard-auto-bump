#!/usr/bin/env bash
flatpak run com.discordapp.Discord &
while ! ss -xal | grep /run/user/$(id -u)/discord-ipc; do
    echo Waiting for Discord IPC socket
    sleep 1
done

bump () {
    xdotool key ctrl+k
    sleep 10
    xdotool type "$BUMP_CHANNEL"
    sleep 1
    xdotool key Return
    sleep 10
    xdotool type "/bump"
    sleep 1
    xdotool key Return
    sleep 1
    xdotool key Return
}

while :; do
    bump
    echo "Bumped $BUMP_CHANNEL"
    # 124 minutes
    sleep 7440
done

# for debugging runs vnc server (security warning no password and listening on 0.0.0.0)
#x11vnc -display $DISPLAY -bg -forever -nopw -quiet -listen 0.0.0.0 -xkb
#sleep infinity
