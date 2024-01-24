# use this empty Dockerfile to build your assignment


# use the node official image, with t´he alpine 6.x branch

FROM node:6-alpine


# this app will listen on port 3000, but the container should luanch on port 80

EXPOSE 3000


# use the alpine package manager to install tini: apk add --no-cache tini.

RUN apk add --update tini


# create directory /usr/src/app for app files with mkdir -p /usr/src/app, or with the Dockerfile command WORKDIR /usr/src/app.

RUN mkdir -p /usr/src/app


# copy in all files from current directory into the image, and Node.js uses a "package manager", so it needs to copy in package.json file.

WORKDIR /usr/src/app
COPY package.json package.json


# run "npm install" to install the dependencies from that file, keep clean with running "npm cache clean --force"

RUN npm install && npm cache clean


# copy in all files from current directory

COPY . .


# start the container with command [ "tini", "--", "node", "./bin/www" ]

CMD [ "tini", "--", "node", "./bin/www" ]
