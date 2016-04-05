# Perspective Docker Containers
This repository contains Perspective [Docker](http://docker.com/) containers build files.

## Openstack container
1. Build image: ```$ docker build -t perspective-openstack openstack/``` or pull it from Docker hub ```$ docker pull meridor/perspective-openstack:latest```
2. Start container from image: ```$ docker run -it -e ENDPOINT=https://identity.example.com/v2.0 -e PROJECT_NAME=my_openstack_project -e LOGIN=username -e PASSWORD=password meridor/perspective-openstack:latest```
