FROM tomcat:9
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install maven -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
RUN cd boxfuse-sample-java-war-hello
RUN mvn package
RUN cp hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080

