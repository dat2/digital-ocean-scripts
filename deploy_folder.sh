#!/bin/bash

# first argument is url name in output directory
# second argument is the folder to copy to it

mkdir -p /var/www/html/$1
cp -r $2 /var/www/html/
