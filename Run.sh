#!/bin/bash

function showHelp() {
    echo "<Help>"
    echo "* -i <IMAGENAME> - Specifies the image name."
    echo "* -u <USERNAME> - Specifies the user name."
    echo "* -t <TAG> - Specifies the tag of the image."
    echo "  -c <DEVICE> - Use the camera."
    echo "  -h - Show help."
    echo "* is a required option."
    echo ""
    echo "<Images>"
    echo "base - [r35.1.0]"
    echo "tensorflow - [r35.1.0-tf2.9-py3]"
    echo "             [r35.1.0-tf1.15-py3]"
    echo "pytorch - [r35.1.0-pth1.13-py3]"
    echo "jetpack - [r35.1.0]"
}

USE_CAMERA=false
IMAGE_NAME=false
USER_NAME=false
TAG=false

while getopts i:u:t:n:rc:h option
do
    case $option in
        i)
            if [ "${OPTARG}" = "" ]; then
                echo "Wrong image name."
                showHelp
                exit 1
            fi
            IMAGE_NAME=${OPTARG};;
        u)
            if [ "${OPTARG}" = "" ]; then
                echo "Wrong user name."
                showHelp
                exit 1
            fi
            USER_NAME=${OPTARG};;
        t)
            if [ "${OPTARG}" = "" ]; then
                echo "Wrong tag."
                showHelp
                exit 1
            fi
            TAG=${OPTARG};;
        c)
            USE_CAMERA=true
            DEVICE=${OPTARG};;
        h)
            showHelp
            exit 0;;
        \?)
            echo "Wrong parameter."
            showHelp
            exit 1;;
    esac
done

if ! "${IMAGE_NAME}" || ! "${USER_NAME}" || ! "${TAG}" ; then
    echo "Wrong tag."
    showHelp
    exit 1
fi

if "${USE_CAMERA}"; then
    docker run -it --rm -p 8888:8888 --runtime nvidia --device ${DEVICE}:${DEVICE} -v ~/Documents/workspace:/workspace -e OPENBLAS_CORETYPE=ARMV8 ${USER_NAME}/${IMAGE_NAME}:${TAG}
else
    docker run -it --rm -p 8888:8888 --runtime nvidia -v ~/Documents/workspace:/workspace -e OPENBLAS_CORETYPE=ARMV8 ${USER_NAME}/${IMAGE_NAME}:${TAG}
fi