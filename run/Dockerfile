FROM alpine:latest
RUN apk update
RUN apk add --no-cache openjdk8 curl
RUN mkdir /usr/local/tomcat
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.53/bin/apache-tomcat-9.0.53.tar.gz
RUN tar xvzf apache-tomcat-9.0.53.tar.gz --strip-components 1 --directory /usr/local/tomcat
RUN /usr/local/tomcat/bin/catalina.sh version
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh catalina.sh", "run"]