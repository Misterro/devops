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
ARG date
RUN mv /boxfuse-sample-java-war-hello/target/hello-1.0.war /boxfuse-sample-java-war-hello/target/"$date"-hello-1.0.war
WORKDIR target
ADD git.sh /boxfuse-sample-java-war-hello/target
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan github.com > /root/.ssh/known_hosts

# Add the keys and set permissions
RUN echo "$ssh_prv_key" > /root/.ssh/id_rsa && \
    echo "$ssh_pub_key" > /root/.ssh/id_rsa.pub && \
    chmod 600 /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa.pub
RUN chmod +x /boxfuse-sample-java-war-hello/target/git.sh
RUN mkdir /war && cp /boxfuse-sample-java-war-hello/target/"$date"-hello-1.0.war /war
WORKDIR /war

CMD ["/boxfuse-sample-java-war-hello/target/git.sh"]