FROM debian:buster

RUN apt-get update && apt-get upgrade && apt-get install -y nginx

COPY ./website /var/www/html


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
