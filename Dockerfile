FROM alpine:3.3

COPY run.sh /usr/local/bin/run

CMD ["/usr/local/bin/run"]

# https://bugs.alpinelinux.org/issues/5376
RUN apk upgrade libssl1.0 --update-cache \
  && apk add --update curl wget bash ca-certificates \
  && update-ca-certificates \
  && rm -rf /var/cache/apk/* \
  && curl -L https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz | tar -xz -C /tmp/ \
  && mv /tmp/docker/docker /usr/bin/docker \
  && rm -Rf /tmp/* \
  && chmod +x /usr/bin/docker \
  && chmod +x /usr/local/bin/run
