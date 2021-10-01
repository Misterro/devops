FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install git maven -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR boxfuse-sample-java-war-hello/
RUN pwd
RUN mvn package
RUN git remote add origin https://github.com/Misterro/s.git
RUN git branch -M main
RUN git push -u origin main