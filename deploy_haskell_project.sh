#!/bin/bash

# $1 - the root folder of the repository
# eg. /var/repo/project.git
# - must have a server/ folder with a stack.yaml / <proj>.cabal
# - must have a client folder, with a build.sh script
# - client/build.sh must build all files to client/build directory

# $2 - the url root for the server
# eg. /hanabi

# store the return directory so we can come back to where we were
RET_DIR=`pwd`

# cd to the root folder
cd $1

# build the server
cd server
stack build
# copy the binaries to a location in the path
stack install

# build the client
cd ../client
./build.sh
deploy_folder $2 ./build

# cd back to the original directory
cd $RET_DIR
