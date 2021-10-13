FROM ubuntu

RUN apt-get update

RUN apt-get install maven openssh-client curl -y

COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

RUN apt-cache policy docker-ce && \
apt install docker-ce -y

RUN apt-get clean
