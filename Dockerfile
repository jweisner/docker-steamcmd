FROM cm2network/steamcmd:latest

LABEL maintainer="jesse@weisner.ca"

ENV INSTALL_DIR /data
ENV LD_LIBRARY_PATH /home/steam/steamcmd/linux32

USER root

RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
        rsync \
 && mkdir /data \
 && chown steam:steam /data \
 && apt-get clean autoclean \
 && apt-get autoremove -y \
 && rm -rf /var/lib/{apt,dpkg,cache,log}/

# Add Tini
ADD https://github.com/krallin/tini/releases/download/v0.18.0/tini /tini
RUN chmod +x /tini

USER steam

# put steamcmd.sh in PATH
RUN set -x \
 && echo 'PATH=$PATH:/home/steam/steamcmd/linux32' >> /home/steam/.bashrc

VOLUME /data

ENTRYPOINT ["/tini", "--"]
