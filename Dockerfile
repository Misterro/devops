FROM ubuntu:20.04

RUN apt-get update
RUN apt-get -y install openssh-client maven
RUN apt-get docker.io -y
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa