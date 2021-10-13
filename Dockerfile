FROM docker

RUN apk update && apk add openjdk8 && apk add maven
RUN apk add --no-cache su-exec