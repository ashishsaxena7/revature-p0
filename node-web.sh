#!/bin/bash

command=$2
filename=$3

if ![ node ]; then
echo "Need to install nodejs"
exit 1

fi


start(){
    if [ -e $filename ]; then
    node $filename
    fi
    else
    echo "File does not exist"
}

stop(){

}

$command $filename

exit 0