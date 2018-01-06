#!/bin/bash
while true; do  xdotool type "$(xclip -o -selection clipboard)"; xdotool key Return ; sleep 1; done
