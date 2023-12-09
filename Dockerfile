# Stage 1

FROM nginx:alpine

COPY ./dist/hellotmoto /usr/share/nginx/html

EXPOSE 8200

CMD ["nginx", "-g", "daemon off;"]
