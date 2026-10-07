FROM alpine
RUN apk --no-cache add nss-tools bash lego && mkdir /lego && chmod 755 /lego
COPY usr/bin/entrypoint /usr/bin/entrypoint
COPY usr/bin/obtain_cert /usr/bin/obtain_cert

ENTRYPOINT [ "bin/bash", "/usr/bin/entrypoint" ]
VOLUME [ "/lego" ]
