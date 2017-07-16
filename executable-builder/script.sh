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

echo "#!/bin/bash" > $exec_command
echo "$file_path \$@" >> $exec_command # Run application with all user given argument
chmod +x $exec_command
mv $exec_command /usr/local/bin

echo "done!"
exit 0
