#!/bin/bash

function showHelp() {
    echo "<Help>"
    echo "-i <IMAGENAME> - Specifies the image name to build. "
    echo "-h - Show help."
}

while getopts i:h option
do
    case $option in
        i)
            IMAGE_NAME=${OPTAGE};;
        h)
            showHelp
            exit 0;;
        \?)
            echo "Wrong parameter."
            showHelp
            exit 1;;
    esac
done

sudo docker build -t ${IMAGE_NAME} -f ./Dockerfiles/Dockerfile.${IMAGE_NAME} ./Dockerfiles/