#!/bin/bash
echo "please enter your dynudns details ..."
read -p 'Username: ' username
read -sp 'Password: ' password
echo

# save details in file
echo "$username:$password" > data.txt

# set cronjob
echo "setting cronjob ..."
#write out current crontab
crontab -l > usercron
# current dir address
addr="$(pwd)"
echo "$addr"
#echo new cronjob into cron file
echo "*/10 * * * * $addr/dynu.sh >/dev/null 2>&1" >> usercron
#install new cron file
crontab usercron
rm usercron

echo "done!"
