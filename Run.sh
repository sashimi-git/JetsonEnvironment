#!/bin/bash

function showHelp() {
    echo "<Help>"
    echo "-i <IMAGENAME> - Specifies the name of the image to run."
    echo "-u <USERNAME> - Specifies the name of the user."
    echo "-c - Use the camera."
    echo "-h - Show help."
}

USE_CAMERA=false

while getopts i:ch option
do
    case $option in
        i)
            IMAGE_NAME=${OPTARG};;
        u)
            USERNAME=${OPTARG};;
        c)
            USE_CAMERA=true;;
        h)
            showHelp
            exit 0;;
        \?)
            echo "Wrong parameter."
            showHelp
            exit 1;;
    esac
done

if "${USE_CAMERA}"; then
    sudo docker run -it --rm -p 8888:8888 --device /dev/video0:/dev/video0 -v ~/Documents/workspace:/workspace ${USERNAME}:${IMAGE_NAME}
else
    sudo docker run -it --rm -p8888:8888 -v ~/Documents/workspace:/workspace ${USERNAME}:${IMAGE_NAME}
fi