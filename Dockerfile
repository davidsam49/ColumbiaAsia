# Stage 1

FROM node:16.14.0-alpine as build-step

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build

 

# Stage 2

FROM nginx:1.17.1-alpine

COPY --from=build-step /app/dist/mcare21 /usr/share/nginx/html
