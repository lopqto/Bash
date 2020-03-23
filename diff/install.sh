#!/bin/bash

have_permission=`id -u`
if [ ! "$have_permission" == "0" ];then
    echo "This program needs root permission!" >&2
    exit 1
fi

apt install vim

ln -s $PWD/hexdiff.sh /usr/local/bin/hexdiff