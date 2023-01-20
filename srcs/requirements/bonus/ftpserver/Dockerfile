FROM	debian:buster


RUN apt-get  update \
    && apt-get install vsftpd  -y 

COPY ./tools/vsftpd.sh /

RUN chmod +x vsftpd.sh 

ENTRYPOINT [ "/vsftpd.sh" ]

CMD [ "/usr/sbin/vsftpd" ]
