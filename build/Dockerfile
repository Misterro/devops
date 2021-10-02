FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install git maven openssh-server -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR boxfuse-sample-java-war-hello/
RUN mvn package
ENV GIT_REPO=""
ENV GIT_BRANCH=""
ENV GIT_ORIGIN=""
ENV COMMIT_USER="Git Service"
ENV COMMIT_EMAIL="git@example.com"
ARG ssh_prv_key
ARG ssh_pub_key
RUN mkdir /war && cp target/hello-1.0.war /war
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan github.com > /root/.ssh/known_hosts

# Add the keys and set permissions
RUN echo "$ssh_prv_key" > /root/.ssh/id_rsa && \
    echo "$ssh_pub_key" > /root/.ssh/id_rsa.pub && \
    chmod 600 /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa.pub

RUN echo "$ssh_prv_key" && echo "$ssh_pub_key"

RUN ls /root/.ssh

WORKDIR /war

RUN git init
RUN git status
RUN git remote add origin https://github.com/Misterro/s.git
RUN git config user.name "docker"
RUN git config user.email "malyshev.s.a@ya.ru"
RUN git add hello-1.0.war
RUN git commit -m "push war"
RUN ssh -T git@github.com
RUN git remote set-url origin git@github.com:Misterro/s.git
RUN git push origin main