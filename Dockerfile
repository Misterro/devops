FROM openjdk:8u151-stretch

RUN apt-get update
RUN apt-get -y install openssh-client maven docker.io
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

# Install pacakges
RUN apt-get update

# Install ssh
RUN apt-get -y install openssh-client

# Confugure ssh client
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa