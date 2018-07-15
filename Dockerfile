FROM node:10-alpine

# Home directory for Node-RED application source code.
# User data directory, contains flows, config and nodes.
RUN mkdir -p /usr/src/node-red && \
    mkdir /data

RUN apk add --no-cache git bash paxctl  && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

WORKDIR /usr/src/node-red

COPY package.json /usr/src/node-red/

# Add node-red user so we aren't running as root.
RUN adduser -h /usr/src/node-red -D -H node-red \
    && chown -R node-red:node-red /data \
    && chown -R node-red:node-red /usr/src/node-red

USER node-red

# Install Node-RED
# Install generic extension for Node-RED
RUN npm install node-red && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* && \
    npm cache clear --force

# User configuration directory volume
EXPOSE 1880

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json
ENV NODE_PATH=/usr/src/node-red/node_modules:/data/node_modules

CMD ["npm", "start", "--", "--userDir", "/data"]
