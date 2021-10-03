FROM tomcat:8.5.71-jre11-temurin-focal
RUN apt update
RUN apt install git -y
RUN git clone https://github.com/Misterro/s.git
RUN pwd
RUN find /s -maxdepth 1 -type f -name "*.war" | sort -n
RUN cp $(find /s -maxdepth 1 -type f -name "*.war" | sort -n | tail -n 1) /usr/local/tomcat/webapps/
RUN ls -la /usr/local/tomcat/webapps/