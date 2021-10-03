FROM alpine:latest
RUN apk update
RUN apk add --no-cache openjdk8-jre-base curl git && \
mkdir /usr/local/tomcat && \
curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.53/bin/apache-tomcat-9.0.53.tar.gz && \
tar xvzf apache-tomcat-9.0.53.tar.gz --strip-components 1 --directory /usr/local/tomcat && \
rm apache-tomcat-9.0.53.tar.gz && \
/usr/local/tomcat/bin/catalina.sh version
RUN git clone https://github.com/Misterro/s.git
RUN find -type f -name "" | ls -t | tail -n 1
RUN cp $(find -type f -name "" | ls -t | tail -n 1) /usr/local/tomcat/webapps/
RUN apk del curl git
RUN ls -la /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]