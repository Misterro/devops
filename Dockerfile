FROM ubuntu:20.04

RUN apt-get update
RUN apt-get -y install openssh-client maven
RUN apt-get install docker.io -y
RUN touch /root/.ssh/id_rsa
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
CMD ["/bin/bash"]