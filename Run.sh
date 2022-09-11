#!/bin/bash

function showHelp() {
    echo "<Help>"
    echo "-i <IMAGENAME> - Specifies the name of the image to run."
    echo "-c - Use the camera."
    echo "-h - Show help."
}

USE_CAMERA=false

while getops i:ch option
do
    case $option in
        i)
            IMAGE_NAME=${OPTAGE};;
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
    sudo docker run -it --rm --net host --device /dev/video0:/dev/video0 -v ~/Documents/workspace:/workspace ${IMAGE_NAME}
else
    sudo docker run -it --rm --net host -v ~/Documents/workspace:/workspace ${IMAGE_NAME}
fi