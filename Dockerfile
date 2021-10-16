FROM ubuntu:20.04

RUN apt-get update
RUN apt-get -y install openssh-client maven docker.io
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

# Confugure ssh client
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa