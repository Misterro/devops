FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install git maven -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR boxfuse-sample-java-war-hello/
RUN mvn package
ENV GIT_REPO=""
ENV GIT_BRANCH=""
ENV GIT_ORIGIN=""
ENV COMMIT_USER="Git Service"
ENV COMMIT_EMAIL="git@example.com"
ENV SSH_KEY=""
ENV SSH_KEY_PUB=""
WORKDIR target
RUN pwd && ls
ADD git.sh /boxfuse-sample-java-war-hello/target
RUN ls
RUN chmod +x /boxfuse-sample-java-war-hello/target/git.sh

CMD ["/boxfuse-sample-java-war-hello/target/git.sh"]