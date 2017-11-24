sudo /usr/local/bin/mopidy --config /bot_settings/mopidy-config -vvv &
sudo /usr/bin/redis-server &
sleep 10
(while true; do 
    cd /SlackMusicBot
    git pull
    cd /
    python3 /SlackMusicBot/run.py /bot_settings/config.yml
done) &

wait %1 %2 %3