#
# Transmission Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV TRANSMISSION_VERSION 2.94

# Update & install packages for transmission
RUN apt-get update && \
    apt-get install -y transmission-cli transmission-common transmission-daemon

RUN useradd -ms /bin/bash transmission && \
    usermod -u 1000 transmission

USER transmission

COPY settings.json /home/transmission/.config/transmission-daemon/settings.json
EXPOSE 9091

CMD ["transmission-daemon", "-f", "-g", "/home/transmission/.config/transmission-daemon"]
