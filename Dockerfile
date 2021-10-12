FROM openjdk:8u151-stretch

RUN apt-get update

RUN apt-get install maven openssh-client -y

COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

RUN apt-get install docker.io -y
