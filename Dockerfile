FROM ubuntu:14.04
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
ADD requirments.txt /opt/webapp/
ADD app.py /opt/webapp/
WORKDIR /opt/webapp/
RUN pip install -qr requirments.txt
EXPOSE 5000
