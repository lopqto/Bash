#!/bin/bash

WALLPAPER_FOLDER='/home/user/Pictures/'
WALLPAPER=$(find "$WALLPAPER_FOLDER" | grep jpg | shuf -n1)
feh --bg-scale "$WALLPAPER"