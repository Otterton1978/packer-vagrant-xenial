#!/usr/bin/env bash

echo "++++++++++++++++++++++++++++++++"
echo "Before Update"
echo "++++++++++++++++++++++++++++++++"

sudo apt-get update
#sudo apt-get upgrade


echo "++++++++++++++++++++++++++++++++"
echo "Update Completed Successfully"
echo "Now install mysql"
echo "++++++++++++++++++++++++++++++++"

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password welcome1'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password welcome1'
sudo apt-get -y install mysql-server

# enable remote access
sudo ufw allow mysql

# start mysql
sudo systemctl start mysql

# enable mysql after a reboot
sudo systemctl enable mysql

# Testing
# Login as a root user and enter the password
# /usr/bin/mysql -u root -p

# This should take to the mysql prompt. Type \h for help
# Update the root password as shown below
# UPDATE mysql.user SET authentication_string = PASSWORD('new-password') WHERE User = 'root';
# To make the above change to take effect reload the stored user info by typing the below
# FLUSH PRIVILEGES;

# To view user information
# SELECT User, Host, authentication_string FROM mysql.user;

# To create a DB known as demodb
# CREATE DATABASE demodb;

# To view all DBs
# SHOW DATABASES;

# To add a DB user
# INSERT INTO mysql.user (User,Host,authentication_string,ssl_cipher,x509_issuer,x509_subject)
# VALUES('demouser','localhost',PASSWORD('demopassword'),'','','');
# FLUSH PRIVILEGES;
# SELECT User, Host, authentication_string FROM mysql.user;

# Grant privileges
# GRANT ALL PRIVILEGES ON demodb.* to demouser@localhost;
# FLUSH PRIVILEGES;
# SHOW GRANTS FOR 'demouser'@'localhost';


echo "++++++++++++++++++++++++++++++++"
echo "Completed mysql Installation "
echo "+++++++++++++++++++++++++++++++++"
