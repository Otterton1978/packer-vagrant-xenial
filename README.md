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

## Test Sync Folders

The provided Vagrantfile syncs a host folder with the guest.
The host folder is defined one level up the current folder and named as shared-data.  The synced folder in the guest VM is located at /vagrant_data

The definition in the Vagrantfile is shown below.

``` bash
config.vm.synced_folder "../shared-data", "/vagrant_data"
```

To test this create a folder named as shared-folder in one level up from the current folder in host then create a file.  Then do ssh into the image and check whether /vagrant_data exists in the VM and check the content of the folder to test the shared file. 



