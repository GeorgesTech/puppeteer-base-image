FROM ghcr.io/georgestech/puppeteer as puppeteer
FROM --platform=linux/amd64 node:16.14-bullseye-slim

COPY --from=puppeteer / /

WORKDIR /app

COPY ./package*.json ./

RUN PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true npm ci
