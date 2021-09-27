FROM ubuntu:14.04
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
RUN pip install --trusted-host --upgrade pip
ADD requirements.txt /opt/webapp/
ADD app.py /opt/webapp/
RUN pip install -qr /opt/webapp/requirements.txt
WORKDIR /opt/webapp/
EXPOSE 5000
CMD ["python", "app.py"]