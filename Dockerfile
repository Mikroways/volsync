FROM quay.io/backube/volsync:0.11.0

COPY /mover-rsync-tls/client.sh /mover-rsync-tls/
RUN chmod a+rx /mover-rsync-tls/*.sh

