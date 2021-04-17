FROM node:15.14.0
MAINTAINER Terry Fung <terryyessfung@gmail.com>

#RUN npm install react-scripts -g

RUN mkdir -p /app/graphql
WORKDIR /app/graphql

ENV PATH /app/graphql/node_modules/.bin:$PATH

COPY package.json ./
COPY package-lock.json ./
RUN npm install

COPY . ./

#CMD ["npm", "start"]

