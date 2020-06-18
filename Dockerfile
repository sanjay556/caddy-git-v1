FROM sdurrheimer/alpine-glibc:latest

RUN apk --update add git ca-certificates curl \
    && rm -rf /var/cache/apk/*

RUN echo "Installing Caddy..." \
    && curl -jksSL "https://caddyserver.com/download/build?os=linux&arch=amd64&features=git" | gunzip -c - | tar -xf - -C /tmp \
    && mv /tmp/caddy /usr/local/bin/caddy \
    && rm -f /tmp/*.txt

RUN adduser -D -u 500 www \
    && mkdir -p /var/www \
    && chown -R www /var/www

WORKDIR /var/www
EXPOSE  2015
USER    www
CMD [ "caddy" ]
