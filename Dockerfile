# Set the base image
FROM nodered/node-red-docker:slim-v8

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

RUN apk add --no-cache git bash

