FROM alpine
RUN apk --no-cache add nss-tools bash lego
RUN mkdir /lego
COPY usr/bin/entrypoint /usr/bin/entrypoint
COPY usr/bin/obtain_cert /usr/bin/obtain_cert

ENTRYPOINT [ "/usr/bin/entrypoint" ]
VOLUME [ "/lego" ]
