FROM docker:latest

RUN apk update && apk add maven
RUN groupadd -r myuser && useradd -r -g myuser myuser
USER myuser