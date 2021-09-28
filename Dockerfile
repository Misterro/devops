FROM ubuntu:14.04
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python3 python3-pip
RUN pip3 -V
ADD requirements.txt /opt/webapp/
ADD app.py /opt/webapp/
RUN pip3 install -qr /opt/webapp/requirements.txt
WORKDIR /opt/webapp/
EXPOSE 5000
CMD ["python", "app.py"]