#!/usr/bin/env bash

echo "++++++++++++++++++++++++++++++++"
echo "Before Update"
echo "++++++++++++++++++++++++++++++++"

sudo apt-get update

echo "++++++++++++++++++++++++++++++++"
echo "Update Completed Successfully"
echo "Now install curl and jqr"
echo "++++++++++++++++++++++++++++++++"

sudo apt-get install -y curl jq

echo "++++++++++++++++++++++++++++++++"
echo "Completed curl and jq Installation "
echo "+++++++++++++++++++++++++++++++++"
