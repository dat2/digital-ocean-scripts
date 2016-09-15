#!/bin/bash

# $1 - url name in output directory
# $2 - the folder to copy recursively into there

mkdir -p /var/www/html/$1
cp -r $2 /var/www/html/$1
