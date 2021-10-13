FROM docker:dind-rootless

RUN apk update && apk add openjdk8 && apk add maven