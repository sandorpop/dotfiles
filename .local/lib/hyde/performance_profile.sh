#!/usr/bin/env bash

# Get the profile line and convert to lowercase
profile=$(asusctl profile -p 2>/dev/null | grep -i 'active profile' | awk '{print tolower($NF)}')

case "$profile" in
  performance)
    icon=" ⚡ "
    tooltip="NVIDIA GPU Performance Profile"
    ;;
  balanced)
    icon="   "
    tooltip="NVIDIA GPU Balanced Profile"
    ;;
  quiet)
    icon="   "
    tooltip="NVIDIA GPU Quiet Profile"
    ;;
  *)
    icon=" ❓ "
    tooltip="Unknown Profile"
    ;;
esac

echo "{\"text\":\"$icon\", \"tooltip\":\"$tooltip\"}"

