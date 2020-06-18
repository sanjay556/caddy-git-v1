from alpine:3.8

RUN apk --update add git ca-certificates curl \
    && rm -rf /var/cache/apk/*

RUN curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://caddyserver.com/download/linux/amd64?plugins=http.git,http.expires,http.realip&license=personal" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy \
    && chmod 0755 /usr/bin/caddy \
    && /usr/bin/caddy -version



COPY ./Caddyfile /etc/Caddyfile
RUN adduser -D -u 500 www \
    && mkdir -p /var/www \
    && chown -R www /var/www

WORKDIR /var/www
EXPOSE  2015
USER    www

CMD ["/usr/bin/caddy", "--conf", "/etc/Caddyfile", "--log", "stdout"]

