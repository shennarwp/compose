FROM docker.elastic.co/beats/filebeat:7.9.3
COPY filebeat.yml /usr/share/filebeat/filebeat.yml
# must run as root to access /var/lib/docker and /var/run/docker.sock
USER root
RUN chown root /usr/share/filebeat/filebeat.yml
# dont run with -e, to disable output to stderr
CMD [""]
