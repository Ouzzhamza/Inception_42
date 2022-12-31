FROM	debian:buster


RUN apt-get  update \
    && apt-get upgrade -y \
    && apt-get install vsftpd ftp -y 

COPY ./tools/vsftpd.sh /

RUN chmod +x vsftpd.sh 

# EXPOSE 21

ENTRYPOINT [ "/vsftpd.sh" ]

CMD [ "/usr/sbin/vsftpd" ]
