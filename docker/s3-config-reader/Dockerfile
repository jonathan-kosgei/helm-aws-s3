FROM debian:jessie

# Install the awscli, supervisor for process management and cron

RUN apt-get update &&\
    apt-get install -y awscli \
    supervisor \
    cron

# Add files to the image

ADD entry.sh /entry.sh

ADD supervisord.conf /supervisord.conf

ADD sync.sh /etc/cron.hourly

# Make the entryscript executable

RUN chmod +x /entry.sh

# Run the entry script on startup

ENTRYPOINT /entry.sh
