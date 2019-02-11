use this script in your cronjob e.g
```
cd Bash/randomwallpaper
mv randomwallpaper.sh /usr/local/bin/randomwallpaper
crontab -e
*/5 * * * * randomwallpaper # Every 5 min
```
