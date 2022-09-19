FROM node:14.17.1

WORKDIR /front
COPY ./front /front
COPY .env ../
COPY .env.local ../

RUN yarn install

EXPOSE 3000
