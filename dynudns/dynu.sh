#!/bin/bash
filename="data.txt"
if [ ! -f "$filename" ]; then
    echo -e "data.txt not found\nplease first run ./install.sh"
    exit 1
fi
username="$(cut -f 1 -d ':' $filename)"
password="$(cut -f 2 -d ':' $filename)"
curl "https://api.dynu.com/nic/update?username=$username&password=$password"
