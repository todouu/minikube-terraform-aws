#!/bin/bash
set -e

sudo yum update -y
sudo yum install -y vim \
              wget \
              python3 \
              curl\
              unzip \
              bind-utils \
              telnet \
              git

pip install ansible
pip install supervisor
pip install docker

###############################
# Install Docker CE on RHEL 7 #
###############################

# Update system.
sudo yum update -y

# Install required packages.
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

# Install container-selinux.
# Check for latest version: http://mirror.centos.org/centos/7/extras/x86_64/Packages/.
sudo yum install -y \
  http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.107-3.el7.noarch.rpm

# Set up Docker repository.
sudo yum-config-manager \
  --add-repo \
  https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker CE and tools.
sudo yum install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io

# Add current user to `docker` group.
sudo usermod -a -G docker $USER

# Start and enable `docker` service.
sudo systemctl start docker
sudo systemctl enable docker
