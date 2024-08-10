#!/bin/bash

OUTPUT_FILE="$HOME/.wakatime_activity"
LOCK_FILE="$HOME/.wakatime_activity.lock"

toggle() {
    if [ -e "$LOCK_FILE" ]; then
        rm "$LOCK_FILE"
        echo "WakaTime CLI tracking disabled."
    else
        touch "$LOCK_FILE"
        echo "WakaTime CLI tracking enabled."
    fi
}

track_wakatime() {
    while [ -e "$LOCK_FILE" ]; do
        /Users/natan/.wakatime/wakatime-cli --today > "$OUTPUT_FILE"
        sleep 300
    done
}

status() {
    if [ -e "$LOCK_FILE" ]; then
        echo "WakaTime CLI tracking is currently enabled."
    else
        echo "WakaTime CLI tracking is currently disabled."
    fi
}

case "$1" in
    start)
        touch "$LOCK_FILE"
        track_wakatime &
        ;;
    stop)
        rm -f "$LOCK_FILE"
        echo "WakaTime CLI tracking stopped."
        ;;
    toggle)
        toggle
        ;;
    status)
        status
        ;;
    *)
        echo "Usage: $0 {start|stop|toggle|status}"
        ;;
esac
