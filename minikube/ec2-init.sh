#!/bin/bash
set -e

sudo yum update -y

# install docker
sudo yum install docker -y
# Add current user to `docker` group.
sudo usermod -a -G docker ec2-user

# Start and enable `docker` service.
sudo systemctl start docker
sudo systemctl enable docker


# install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
sudo rpm -ivh minikube-latest.x86_64.rpm
minikube start
