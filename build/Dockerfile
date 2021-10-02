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
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan github.com > /root/.ssh/known_hosts

# Add the keys and set permissions
RUN echo "$ssh_prv_key" > /root/.ssh/id_rsa && \
    echo "$ssh_pub_key" > /root/.ssh/id_rsa.pub && \
    chmod 600 /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa.pub

RUN git init && \
git remote add origin https://github.com/Misterro/s.git && \
git config user.name "docker" && \
git config user.email "malyshev.s.a@ya.ru" && \
git add hello-1.0.war && \
git commit -m "push war" && \
ssh -T git@github.com && \
git remote set-url origin git@github.com:Misterro/s.git && \
git push origin main