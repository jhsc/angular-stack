FROM mhart/alpine-node:latest

EXPOSE 3000

# Update & install dependencies"
RUN apk update && apk upgrade && \
  apk add --no-cache bash git openssh && \
  apk add sudo && \
  apk add curl

# Install global deps
RUN npm i -g \
  nodemon

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

CMD ["npm", "run", "start"]