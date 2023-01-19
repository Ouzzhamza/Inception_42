FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

EXPOSE 3306

COPY ./tools/mariadb.sh /

RUN chmod +x /mariadb.sh

ENTRYPOINT [ "/mariadb.sh" ]

CMD ["mysqld_safe"]
