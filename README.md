# Ubuntu Xenial 16.04 
Packer template to create a vagrant base image with Ubuntu Xenial 16.04 LTS image.
It also has a Vagrant file to test the newly created image.

## Build Instructions

Clone the repository and then use packer to build the image.  It is a pre-requirement to have Packer installed in the environment.  Please refer to https://www.packer.io/ for further information.

``` bash
$git clone https://github.com/sharabinth/packer-vagrant-xenial.git
$cd packer-vagrant-xenial
$packer build template.json
```

The above should create an image named as ubuntu-1604-vbox.box in the current folder.

## Test Image

There is a Vagrantfile to test the image produced by Packer.

``` bash
$vagrant up
```
The above should create a Virtual Box with the image.  Then use 

``` bash
$vagrant ssh
```
to SSH into the image.


