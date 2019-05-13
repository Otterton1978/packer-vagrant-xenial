#!/usr/bin/env bash

echo "++++++++++++++++++++++++++++++++"
echo "Before Update"
echo "++++++++++++++++++++++++++++++++"

sudo apt-get update

echo "++++++++++++++++++++++++++++++++"
echo "Update Completed Successfully"
echo "Now install curl, jq and git"
echo "++++++++++++++++++++++++++++++++"

sudo apt-get install -y curl jq git

echo "++++++++++++++++++++++++++++++++++++++++"
echo "Completed curl, jq and git Installation "
echo "++++++++++++++++++++++++++++++++++++++++"
