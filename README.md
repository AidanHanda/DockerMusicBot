# Docker Music Bot
> Dockerized Container of the Slack Music Bot.


This container holds all the software and code required for running the [Slack Music Bot](https://github.com/AidanHanda/SlackMusicBot) (Designed to be run on a Raspberry Pi)

## Installation

Raspberry Pi:

>**Install Docker**
    ```
    curl -sSL https://get.docker.com | sh
    ```
>**Create a systemd file such that the container runs at startup**
    ```
    sudo nano /etc/systemd/system/docker-musicbot.service
    ```
        **Paste in:**
            `[Unit]`
            `Description=Redis container`
            `Requires=docker.service`
            `After=docker.service`
            `[Service]`
            `Restart=always`
            `ExecStart=sudo /usr/bin/docker run -it -e SLACKAPIKEY=xoxb-229735203472-Eobv3Ou8k4mX2wiyv1NYuiP1 --device /dev/snd/ aidanhanda/music-bot`
            `ExecStop=/usr/bin/docker`
            `[Install]`
            `WantedBy=default.target`
>**Add the service to systemd:**
    ```sudo systemctl enable docker-musicbot.service```
    


## Meta

Aidan Handa – akhanda@stu.naperville203.org
