FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client  systemd

RUN rm -rf /var/run/mysqld && mkdir /var/run/mysqld && chown mysql /var/run/mysqld/


EXPOSE 3306

COPY ./tools/mariadb.sh /

RUN chmod +x /mariadb.sh

ENTRYPOINT [ "/mariadb.sh" ]

CMD ["mysqld_safe"]
