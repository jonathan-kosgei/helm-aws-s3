FROM debian:jessie

RUN apt-get update &&\
    apt-get install awscli \
    supervisord \
    cron

ADD entry /entry.sh

ADD supervisord /supervisord.conf

ADD sync.sh /etc/cron.hourly

RUN chmod +x /entry.sh

ENTRYPOINT /entry.sh
