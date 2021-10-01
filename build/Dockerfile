FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install git maven -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR boxfuse-sample-java-war-hello/
RUN pwd
RUN mvn package
RUN mkdir /war && ls -la /boxfuse-sample-java-war-hello/target/
RUN cp /boxfuse-sample-java-war-hello/target/hello-1.0.war /war
WORKDIR /war
RUN git init
RUN git remote add origin https://github.com/Misterro/s.git
RUN git branch -M main
RUN git push -u origin main