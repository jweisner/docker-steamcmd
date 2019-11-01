FROM bcit/centos:8-supervisord-latest

LABEL maintainer="jesse@weisner.ca"

ENV HOME /home/steam

RUN useradd steam \
 && yum -y --setopt tsflags=nodocs --setopt timeout=5 install \
        file \
        glibc.i686 \
        libstdc++.i686 \
        rsync \
        unzip \
        zip \
 && mkdir /steamlibrary /home/steam/steamcmd \
 && chown steam:steam /steamlibrary /home/steam/steamcmd

COPY 20-install_steamcmd.sh /docker-entrypoint.d/
COPY ld-steamcmd.conf /etc/ld.so.conf.d/steamcmd.conf

RUN ldconfig

USER steam

VOLUME /steamlibrary
VOLUME /home/steam/steamcmd

WORKDIR /home/steam
