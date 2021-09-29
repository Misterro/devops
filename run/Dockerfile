FROM alpine:latest
RUN apk update
RUN apk add --no-cache openjdk8-jre-base curl && \
mkdir /usr/local/tomcat && \
curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.53/bin/apache-tomcat-9.0.53.tar.gz && \
tar xvzf apache-tomcat-9.0.53.tar.gz --strip-components 1 --directory /usr/local/tomcat && \
rm apache-tomcat-9.0.53.tar.gz && \
/usr/local/tomcat/bin/catalina.sh version && \
apk del curl
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]