FROM docker:latest

RUN apk update && apk add maven
USER root