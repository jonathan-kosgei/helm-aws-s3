FROM debian:jessie

RUN apt-get update &&\
    apt-get install -y awscli \
    supervisor \
    cron

ADD entry /entry.sh

ADD supervisord /supervisord.conf

ADD sync.sh /etc/cron.hourly

RUN chmod +x /entry.sh

ENTRYPOINT /entry.sh
