#!/bin/bash

function showHelp() {
    echo "<Help>"
    echo "-i <IMAGENAME> - Specifies the name of the image to run."
    echo "-t <TAG> - Specifies the tag of the image."
    echo "-c - Use the camera."
    echo "-h - Show help."
    echo ""
    echo "<Images>"
    echo "tensorflow - [r35.1.0-tf2.9-py3]"
    echo "             [r35.1.0-tf1.15-py3]"
    echo "pytorch - [r35.1.0-pth1.13-py3]"
    echo "jetpack - [r35.1.0]"
}

USE_CAMERA=false

while getopts i:t:ch option
do
    case $option in
        i)
            IMAGE_NAME=${OPTARG};;
        t)
            TAG=${OPTARG};;
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
    docker run -it --rm -p 8888:8888 --device /dev/video0:/dev/video0 -v ~/Documents/workspace:/workspace -e OPENBLAS_CORETYPE=ARMV8 ${IMAGE_NAME}:${TAG}
else
    docker run -it --rm -p 8888:8888 -v ~/Documents/workspace:/workspace -e OPENBLAS_CORETYPE=ARMV8 ${IMAGE_NAME}:${TAG}
fi