ARG NODE_VERSION=16

# FROM --platform=linux/amd64 node:${NODE_VERSION}
FROM ghcr.io/georgestech/puppeteer
WORKDIR /app

COPY ./package*.json ./

RUN PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true npm ci
