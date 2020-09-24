FROM alpine:3.5

ENV UUID=$(cat /proc/sys/kernel/random/uuid)
ENV WSPATH=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16)

RUN apk add --no-cache --virtual .build-deps ca-certificates curl unzip

ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
CMD /configure.sh
