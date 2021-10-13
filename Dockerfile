FROM docker:latest

RUN apk update && apk add maven
RUN addgroup -S docker && adduser -S appuser -G docker
USER appuser