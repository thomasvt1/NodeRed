# Set the base image
FROM nodered/node-red-docker:slim-v8

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

# Become root to make changes to the Docker container.
USER root

RUN apk add --no-cache git bash paxctl 

# Lose root again
USER node-red
