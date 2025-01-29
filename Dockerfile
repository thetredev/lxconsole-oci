ARG ALPINE_VERSION=3.21


FROM alpine:${ALPINE_VERSION}
RUN apk add --no-cache bind-tools python3 py3-pip sqlite \
    && addgroup -g 1000 lxconsole \
    && adduser -s /bin/sh -G lxconsole -u 1000 -D -h /app lxconsole

COPY --link=true --chown=lxconsole:lxconsole lxconsole/requirements.txt /app/requirements.txt
COPY --link=true --chown=lxconsole:lxconsole lxconsole/run.py /app/run.py
COPY --link=true --chown=lxconsole:lxconsole lxconsole/lxconsole /app/lxconsole

USER lxconsole
WORKDIR /app

COPY entrypoint.sh /entrypoint.sh
RUN /entrypoint.sh init_venv upgrade

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "run" ]
