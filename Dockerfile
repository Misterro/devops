FROM docker:latest

RUN apk update && apk add maven
RUN adduser -S appuser -G docker
USER appuser