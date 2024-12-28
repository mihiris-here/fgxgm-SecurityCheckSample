FROM node:18.17.1

RUN apt-get update && apt-get install -y \
    libwebp-dev=1.2.4-0.2+deb12u1 \
    libwebp7=1.2.4-0.2+deb12u1 \
    libwebpdemux2=1.2.4-0.2+deb12u1 \
    libwebpmux3=1.2.4-0.2+deb12u1 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN npm install -g npm@9.1.3

ADD package.json .
ADD index.js .
ADD build .
COPY . .
RUN npm install

EXPOSE 8080

CMD [ "node", "index.js" ]
