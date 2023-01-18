
FROM  debian:buster

RUN apt-get update && apt-get -y install nginx \ 
	openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048\
	-keyout /etc/nginx/ssl/houazzan.key \
	-out /etc/nginx/ssl/houazzan.crt \
	-subj "/C=MO/ST=KHORIBGA/L=KHORIBGA/O=1337 School/OU=houazzan/CN=houazzan/"

COPY ./conf/default /etc/nginx/conf.d/nginx.conf

RUN rm -rf /var/www/html

#EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
