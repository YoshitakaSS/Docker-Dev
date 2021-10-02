FROM nginx:1.20-alpine

RUN apk update && \
    apk add --update --no-cache --virtual=.build-dependencies g++ && \
    rm -r /var/cache/apk/*

COPY ./docker/nginx/conf.d/nginx.conf /etc/nginx/nginx.conf
COPY ./docker/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf