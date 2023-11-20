#!/bin/bash
#Author: Hemanth Kumar A R
#Date of creation: 
#Date of modified:

#Description:
 #automation script for instalation of several DevOps tools in to the server 


#usage
# this script is for  aws_linx server

# Exit immediately if a command exits with a non-zero status
set -e  

 # Exit if any command in a pipeline fails
set -o pipefail 

# to clear all the dependencies and to update the package repos
sudo yum update -y 

#Git instalation 
sudo yum install git -y
git --version

#Docker instalation
sudo amazon-linux-extras install docker -y
sudo systemctl enable docker 
sudo systemctl status docker 
sudo systemctl restart docker 
sudo usermod -a -G docker ec2-user
newgrp docker
docker --version
ech0 " Docker installed suucesfully "

#Docker-compose instalation
sudo yum install python3-pip

pip3 install --user docker-compose #to install compose without root access

ech0 " Docker-compose installed suucesfully"

# with root access
#sudo pip3 install docker-compose 


#terraform instalation
#to manage your repositories.
sudo yum install -y yum-utils

#add the official HashiCorp Linux repository.
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

#to Install Terraform from the new repository.
sudo yum -y install terraform

ech0 "terracform installed suucesfully"
sudo systemctl enable terraform 
sudo systemctl status terraform

#Ansible instalation
sudo yum update -y
sudo amazon-linux-extras install ansible2 -y
ansible --version

echo " ansible installed succesfully "

