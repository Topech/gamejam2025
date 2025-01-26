#!/bin/sh
echo -ne '\033c\033]0;GameJam2025\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/BubbloonTycoon2_Linux.x86_64" "$@"
