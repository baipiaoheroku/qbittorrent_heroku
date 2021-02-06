#!/bin/bash

rsyslogd
cron
touch /var/log/cron.log
tail -F /var/log/syslog /var/log/cron.log

# 检查config配置文件，并创建
if [ ! -e "/config/qBittorrent/config/qBittorrent.conf" ] ;  then 
mkdir -p /config/qBittorrent/config/
cp /usr/local/qbittorrent/defaults/qBittorrent.conf  /config/qBittorrent/config/qBittorrent.conf
fi

# permissions
chown -R /config \
    /downloads


chmod 0777 /upload/ -R
python3 /upload/config.py
yes "" | qbittorrent-nox --webui-port=$PORT  --profile=/config