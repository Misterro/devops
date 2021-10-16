FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install maven openssh-client -y
RUN apt-get install docker.io docker-compose -y
RUN mkdir /root/.ssh/ && touch /root/.ssh/known_hosts
COPY id_rsa /root/.ssh/id_rsa
RUN echo "" >> /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa