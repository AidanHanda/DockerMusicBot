FROM resin/rpi-raspbian:latest

ENTRYPOINT []

MAINTAINER aidanhanda akhanda@stu.naperville203.org

RUN apt-get update && apt-get install -y redis-server
RUN apt-get -y install python3-pip
RUN apt-get install git

#Mopidy
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --force-yes \
        build-essential \
        gettext \
        gir1.2-gstreamer-1.0 \
        gir1.2-gst-plugins-base-1.0 \
        git \
        gstreamer1.0-alsa \
        gstreamer1.0-libav \
        gstreamer1.0-plugins-good \
        gstreamer1.0-plugins-ugly \
        gstreamer1.0-tools \
        libasound2-dev \
        libssl-dev \
        libcurl4-gnutls-dev \
        libexpat1-dev \
        python-dev \
        python-pip \
        python-gst-1.0 \
        unzip \
        wget
RUN pip install -U  Mopidy
RUN apt-get remove python-pip
RUN easy_install pip


RUN pip install -U Mopidy-ALSAMixer
RUN pip install Mopidy-Yamaha

RUN wget -q -O - http://apt.mopidy.com/mopidy.gpg | apt-key add -
RUN echo "deb http://apt.mopidy.com/ stable main contrib non-free" > /etc/apt/sources.list.d/mopidy.list
RUN echo "deb-src http://apt.mopidy.com/ stable main contrib non-free" >> /etc/apt/sources.list.d/mopidy.list
RUN apt-get install -y --force-yes apt-transport-https
RUN pip install mopidy-youtube
RUN pip install Mopidy-Somafm
RUN cd root
RUN pip install Mopidy-Iris
RUN pip install youtube-dl
RUN apt-get install -y gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad
EXPOSE 6680 6600 6379
# End Mopidy : Dont need this right now... 

RUN git clone https://github.com/AidanHanda/SlackMusicBot /SlackMusicBot
RUN pip3 install -r SlackMusicBot/requirements.txt

RUN easy_install3 -U pip
RUN pip3 install redis

COPY settings /bot_settings
CMD ["sh", "/bot_settings/init.sh"]

