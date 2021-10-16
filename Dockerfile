FROM docker:latest

RUN apk update && apk add maven openssh-client
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa