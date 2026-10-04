FROM node:lts-bookworm

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ffmpeg \
        webp \
        git && \
    rm -rf /var/lib/apt/lists/*

USER node

RUN git clone https://github.com/khan-tech-1/YUMI-MD.git /home/node/DJ

WORKDIR /home/node/DJ

RUN chmod -R 777 /home/node/DJ/

RUN yarn install --network-concurrency 1

EXPOSE 7860

ENV NODE_ENV=production

CMD ["npm", "start"]
