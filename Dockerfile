FROM ubuntu:16.04

MAINTAINER Dylan R., <dylan@peepo.us>

RUN apt update \
    && apt upgrade -y \
    && apt install -y libgdiplus \
    && apt install -y lib32gcc1 lib32stdc++6 unzip curl iproute2 \
    && curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt install -y nodejs \
    && mkdir /node_modules \
    && npm install --prefix / ws \
    && useradd -d /home/container -m container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
COPY ./wrapper.js /wrapper.js

CMD ["/bin/bash", "/entrypoint.sh"]
