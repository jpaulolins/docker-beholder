############################################################
# Dockerfile to build Python Behold Application Containers
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER João Paulo Lins

# Add the application resources URL
RUN echo "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -sc) main universe" >> /etc/apt/sources.list

# Update the sources list
RUN apt-get update

# Install basic applications
RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential

# Install Python and Basic Python Tools
RUN apt-get install -y python python-dev python-distribute python-pip python3-pip

# Clone from Original Git Repository
RUN git clone https://github.com/pasknel/beholder.git

# Get pip to download and install requirements:
RUN pip3 install -r /beholder/requirements.txt

# Expose ports
EXPOSE 8000

# Set the default directory where CMD will execute
WORKDIR /beholder

# Set the default command to execute when creating a new container
CMD python3.4 server.py migrate
CMD python3.4 server.py runserver 0.0.0.0:8000


