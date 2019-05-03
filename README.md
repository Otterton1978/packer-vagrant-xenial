# Purpose

Packer template to create a vagrant base image with Ubuntu Xenial 16.04 LTS image.
It also has a Vagrant file to test the newly created image.

## Build Instructions for Base Image

Clone the repository and then use packer to build the image.  It is a pre-requirement to have Packer installed in the environment.  Please refer to https://www.packer.io/ for further information.

``` bash
$git clone https://github.com/sharabinth/packer-vagrant-xenial.git
$cd packer-vagrant-xenial
$packer validate template.json
$packer build template.json
```

The above should create an image named as ubuntu-1604-vbox.box in the current folder.

## Build Instructions for Base Image with Redis

Clone the repository and then use packer to build the image.  It is a pre-requirement to have Packer installed in the environment.  Please refer to https://www.packer.io/ for further information.

``` bash
$git clone https://github.com/sharabinth/packer-vagrant-xenial.git
$cd packer-vagrant-xenial
$packer validate redis-template.json
$packer build redis-template.json
```

The above should create an image named as redis64-xenial64-vbox.box in the current folder.

## Build Instructions for Base Image with MySQL

Clone the repository and then use packer to build the image.  It is a pre-requirement to have Packer installed in the environment.  Please refer to https://www.packer.io/ for further information.

``` bash
$git clone https://github.com/sharabinth/packer-vagrant-xenial.git
$cd packer-vagrant-xenial
$packer validate mysql-template.json
$packer build mysql-template.json
```

The above should create an image named as mysql-xenial64-vbox.box in the current folder.

## Test Base Image

There is a Vagrantfile to test the image produced by Packer.

``` bash
$vagrant up
```
The above should create a Virtual Box with the image.  Then use 

``` bash
$vagrant ssh
```
to SSH into the image.

## Test Redis Image

Makesure to use the redis64-xenial64-vbox.box in the Vagrantfile to test the redis image produced by Packer.

``` bash
$vagrant up
```
The above should create a Virtual Box with the image.  Then use 

``` bash
$vagrant ssh
```
to SSH into the image.

```
vagrant@vm-xenial64-base:~$ redis-cli
127.0.0.1:6379> ping
PONG
127.0.0.1:6379> quit
vagrant@vm-xenial64-base:~$ exit
```
## Test MySQL Image

Makesure to use the mysql-xenial64-vbox.box in the Vagrantfile to test the MySQL image produced by Packer.

``` bash
$vagrant up
```
The above should create a Virtual Box with the image.  Then use 

``` bash
$vagrant ssh
```
to SSH into the image.

```
vagrant@vm-xenial64-base:~$ /usr/bin/mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3
Server version: 5.7.26-0ubuntu0.16.04.1 (Ubuntu)

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SELECT User, Host, authentication_string FROM mysql.user;
+------------------+-----------+-------------------------------------------+
| User             | Host      | authentication_string                     |
+------------------+-----------+-------------------------------------------+
| root             | localhost | *1E97552497867D450D5C30F3441CD95BADF54751 |
| mysql.session    | localhost | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE |
| mysql.sys        | localhost | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE |
| debian-sys-maint | localhost | *F27D39C02B95FD13260007C3F38081DD7C0CB396 |
+------------------+-----------+-------------------------------------------+
4 rows in set (0.00 sec)

mysql> exit
Bye
vagrant@vm-xenial64-base:~$ exit
```

## Test Sync Folders

By default Vagrant shares the current folder in host to /vagrant in the guest.
The provided Vagrantfile syncs a custom host folder with the guest.
The custom host folder is defined one level up the current folder and named as shared-data.  The synced folder in the guest VM is located at /vagrant_data

The definition in the Vagrantfile is shown below.

``` bash
config.vm.synced_folder "../shared-data", "/vagrant_data"
```

To test this create a folder named as *shared-folder* in one level up from the current folder in host and create a file.  Then do ssh into the image and check whether folder */vagrant_data* exists in the VM and check the content of the folder to test the shared file. 

## CI Test

Travis CI is test is integrated with the repo.  When the repo is added in Travis for mnonitoring then it would test the packer template file for validation.

