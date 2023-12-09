# Stage 1

FROM nginx:1.17.1-alpine as service

COPY /app/dist/hellotmoto /usr/share/nginx/html

Expose 4200  
