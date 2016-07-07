# Pick your mongo version from the hub: https://hub.docker.com/r/_/mongo/
FROM mongo:latest

# Set your node version here
ENV NODE_VERSION 5.12.0

# Build only
ENV NPM_CONFIG_LOGLEVEL info

RUN buildDeps='xz-utils'
RUN apt-get update && apt-get install -y $buildDeps --no-install-recommends && apt-get install -y curl
RUN curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz"
RUN tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local --strip-components=1
RUN ln -s /usr/local/node-v$NODE_VERSION-linux-x64/bin/node /usr/bin/node

