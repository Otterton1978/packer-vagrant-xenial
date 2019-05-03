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

