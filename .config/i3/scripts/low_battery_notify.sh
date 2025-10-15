#!/bin/bash

BATTERY="BAT0"  # Change if your battery is BAT1, etc.
LOW_THRESHOLD=20  # Notify at 20%
CHECK_INTERVAL=60  # Seconds between checks
STATE_FILE="$HOME/.battery_low_flag"  # Temp file to track if notified

# Function to get battery percentage
get_capacity() {
    cat /sys/class/power_supply/$BATTERY/capacity 2>/dev/null || echo "N/A"
}

# Function to check if discharging
is_discharging() {
    [ "$(cat /sys/class/power_supply/$BATTERY/status 2>/dev/null)" = "Discharging" ]
}

# Main loop
while true; do
    capacity=$(get_capacity)
    if [[ "$capacity" != "N/A" && "$capacity" =~ ^[0-9]+$ ]]; then
        if is_discharging && [ "$capacity" -le "$LOW_THRESHOLD" ]; then
            if [ ! -f "$STATE_FILE" ]; then
                # Send critical notification via dunstify
                dunstify -u critical -i battery-low \
                    "Low Battery!" \
                    "Battery at ${capacity}%. Plug in your charger soon!" \
                    -t 10000  # 10 seconds timeout
                touch "$STATE_FILE"  # Set flag to avoid repeats
            fi
        else
            # Reset flag if charging or above threshold
            rm -f "$STATE_FILE"
        fi
    fi
    sleep "$CHECK_INTERVAL"
done
