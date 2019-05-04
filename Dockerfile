FROM cm2network/steamcmd:latest

LABEL maintainer="jesse@weisner.ca"

ENV INSTALL_DIR /data
ENV LD_LIBRARY_PATH /home/steam/steamcmd/linux32

USER root

RUN set -x \
 && mkdir /data \
 && chown steam:steam /data

# Add Tini
ADD https://github.com/krallin/tini/releases/download/v0.18.0/tini /tini
RUN chmod +x /tini

USER steam

# put steamcmd.sh in PATH
RUN set -x \
 && echo 'PATH=$PATH:/home/steam/steamcmd/linux32' >> /home/steam/.bashrc

VOLUME /data

ENTRYPOINT ["/tini", "--"]
