# FROM nginx:latest
FROM openresty/openresty:1.21.4.1-0-alpine
COPY ./index.html /usr/share/nginx/html/index.html

# COPY ./index.html /usr/local/openresty/nginx/html/index.html
