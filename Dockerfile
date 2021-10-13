FROM ubuntu

RUN apt-get update

RUN apt-get install maven openssh-client curl -y

COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \
apt update && apt-cache policy docker-ce && \
apt install docker-ce -y

RUN apt-get clean
