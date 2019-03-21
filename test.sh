#!/usr/bin/env bash

out=$(packer validate template.json)

# we should check out == successful validate from Packer
if [ "${out}" == "Template validated successfully." ];then
  echo "GOOD: Packer CI test pass"
else
  echo "BAD: Packer CI test fail"
  exit 1
fi