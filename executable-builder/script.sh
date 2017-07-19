#!/bin/bash

have_permission=`id -u`
if [ ! "$have_permission" == "0" ];then
    echo "This program needs root permission!" >&2
    exit 1
fi

read -p "Enter exec command ex. subl for sublime: " exec_command
read -p "Enter executable file path: " file_path

if [ ! -f "$file_path" ];then
    echo "File does not exist!" >&2
    exit 2
fi

ln -s file_path /usr/bin/$exec_command

echo "done!"
exit 0
