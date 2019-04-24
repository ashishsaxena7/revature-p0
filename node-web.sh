#!/bin/bash
# Automate the process of starting and stopping a node application

command=$1
fileloc=$2

# Confirm node installation

if ! [ node ]; then
echo "Need to install nodejs"
exit 1
fi

# check if directory is of node format
cd $fileloc

if ! [ -e package.json]; then
echo "Not a node.js application"
exit 1
fi

# Functions

start(){

# Check if start script is implanted in package.json
test=$(cat package.json | grep -E "start")
if [-z $test ]; then
echo "Need start script active"
exit 1
fi

npm start
}

stop(){

# Check if stop script is implanted in package.json
test2=$(cat package.json | grep -E "stop")
if [-z $test2 ]; then
echo "Need stop script active"
exit 1
fi

npm stop
}

$command $fileloc

# case
# case $command
#     start ) start();
#     stop ) stop();
# esac

# create functions


