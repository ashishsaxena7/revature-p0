#!/bin/bash

command=$2
# starting a server; execute files
name=$3

if ![ node ]; then
echo "Need to install nodejs"
exit 1
fi

# case
case $command
    start ) start();
    stop ) stop();
esac

# create functions

start(){

    npm scripts

    if [ -e $name ]; then
    node $name
    else
    echo "File does not exist"
    fi
}

stop(){
    npm scripts
}

$command $name

exit 0