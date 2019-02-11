use this script in your cronjob e.g
```
cd Bash/randomwallpaper
cp randomwallpaper.sh /usr/local/bin/randomwallpaper
crontab -e
*/5 * * * * randomwallpaper # Every 5 min
```
