FROM node:18-slim
# vue-cli reqires 8.10.0+ 

RUN apt-get -y update \
    && apt-get install -y git

RUN npm install -g @vue/cli

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH
COPY  package*.json ./
COPY yarn.lock ./
RUN yarn install 
COPY  . .

EXPOSE 8080


CMD ["yarn", "serve"]