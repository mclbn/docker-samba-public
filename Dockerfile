FROM alpine:latest

RUN apk add --no-cache --update \
    samba-common-tools \
    samba-client \
    samba-server \
    && rm -rf /tmp/*

RUN mkdir /shared

RUN adduser -S shareuser \
    && chown -R shareuser /shared

COPY smb.conf /etc/samba/smb.conf

CMD ["smbd", "--foreground", "--no-process-group"]
