# 2023-02-06 test

## Local installation

It requires node and npm installed locally, it installs puppeteer locally

```bash
cd try-puppeteer
npm i
npm start
```

## Docker
The simplest example from [pptr.dev/guides/docker](https://pptr.dev/guides/docker)

```bash
docker pull ghcr.io/puppeteer/puppeteer:latest
docker run -i --init --cap-add=SYS_ADMIN --rm ghcr.io/puppeteer/puppeteer:latest -e "$(cat try-puppeteer/index.js)"
```