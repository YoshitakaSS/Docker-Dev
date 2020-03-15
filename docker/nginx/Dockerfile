FROM nginx:alpine

ADD ./conf.d/* /etc/nginx/conf.d/

CMD [ "chmod", "777", "/var/www/dev-web" ]

# ARG VIRTUAL_HOST=jp.php-dev2.jp

# EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]

# RUN sed -i -e "s/VIRTUAL_HOST/${VIRTUAL_HOST}/" /etc/nginx/conf.d/default.conf

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
