FROM node:15-alpine

ENV WORKDIR /code

COPY ./docker-entrypoint /docker-entrypoint

RUN set -eux; \
    apk --update add \
    autoconf \
    automake \
    musl-dev \
    build-base \
    ; \
    rm -rf /var/cache/apk/*; \
    chmod +x /docker-entrypoint

ENTRYPOINT [ "/docker-entrypoint" ]

CMD [ "npm", "run", "watch" ]
