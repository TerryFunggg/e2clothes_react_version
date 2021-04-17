FROM node:15.14.0
MAINTAINER Terry Fung <terryyessfung@gmail.com>

#RUN npm install react-scripts -g

RUN mkdir -p /app/web
WORKDIR /app/web

ENV PATH /app/web/node_modules/.bin:$PATH

COPY package.json ./
COPY yarn.lock ./
RUN yarn install

COPY . ./

#CMD ["npm", "start"]

