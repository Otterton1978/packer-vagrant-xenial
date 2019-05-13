#!/usr/bin/env bash

echo "++++++++++++++++++++++++++++++++"
echo "Before Update"
echo "++++++++++++++++++++++++++++++++"

sudo apt-get update -y
#sudo apt-get upgrade -y


echo "++++++++++++++++++++++++++++++++"
echo "Update Completed Successfully"
echo "Now install Docker"
echo "++++++++++++++++++++++++++++++++"

# Add official GPG key 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Install packages to allow apt to use a repository over https
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

# Add Docker repositories to the apt resources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update package database with Docker packages from the newly added repo
sudo apt-get update -y

# Make sure Docker is installed from Docker Repo instead of the default Ubuntu 16.04 repo
sudo apt-cache policy docker-ce

# install Docker
sudo apt-get install -y docker-ce

# Add vagrant user to docker group to execute docker commands without sudo
# The group membership can be verified using $id -nG
sudo usermod -aG docker vagrant

# To test whether this is worked, relogin if required i.e., $su - vagrant and enter the password then $id -nG
# $docker info should work without access denied error message

# restart docker service
sudo systemctl restart docker

# to test get hello world container
# $docker run hello-world
# $docker container ls -a should list all containers including the hello world which was exited after printing hello

# enable docker to run after re-boot
sudo systemctl enable docker

echo "++++++++++++++++++++++++++++++++"
echo "Completed mysql Installation "
echo "+++++++++++++++++++++++++++++++++"
