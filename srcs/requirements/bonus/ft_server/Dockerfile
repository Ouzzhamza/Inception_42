FROM debain:buster

RUN apt-get update && apt-get upgrade && apt-get -y install vsftpd

COPY ./tools/vsftpd.sh ./


ENTRYPOINT ["/vsftpd.SH"]
