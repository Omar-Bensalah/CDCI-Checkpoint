# Stage 1

FROM node:12-alpine as build

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build --prod


# Stage 2

FROM nginx:1.17.1-alpine as service

COPY --from=build /app/dist/hellotmoto /usr/share/nginx/html
