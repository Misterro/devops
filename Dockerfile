FROM nirmata/tomcat9-alpine-jre12-openjdk
RUN apk add --no-cache git maven
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
RUN pwd
WORKDIR boxfuse-sample-java-war-hello/
RUN mvn package
RUN cp target/hello-1.0.war /usr/local/tomcat/webapps/
EXPOSE 8080