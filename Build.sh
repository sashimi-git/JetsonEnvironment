#!/bin/bash

function showHelp() {
    echo "<Help>"
    echo "* -i <IMAGENAME> - Specifies the image name."
    echo "* -u <USERNAME> - Specifies the user name."
    echo "* -t <TAG> - Specifies the tag of the image."
    echo "  -h - Show help."
    echo "* is a required option."
    echo ""
    echo "<Images>"
    echo "tensorflow - [r35.1.0-tf2.9-py3]"
    echo "             [r35.1.0-tf1.15-py3]"
    echo "pytorch - [r35.1.0-pth1.13-py3]"
    echo "jetpack - [r35.1.0]"
}

IMAGE_NAME=""
USER_NAME=""
TAG=""

while getopts i:u:t:h option
do
    case $option in
        i)
            if [ "${OPTARG}" = "tensorflow" ]; then
                FILE=tf
            elif [ "${OPTARG}" = "pytorch" ]; then
                FILE=pytorch;
            elif [ "${OPTARG}" = "jetpack" ]; then
                FILE=jetpack
            else
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
        h)
            showHelp
            exit 0;;
        \?)
            echo "Wrong parameter."
            showHelp
            exit 1;;
    esac
done

if [ "${IMAGE_NAME}" = ""] || [ "${USER_NAME}" = "" ] || [ "${TAG}" = "" ]; then
    echo "Wrong tag."
    showHelp
    exit 1
fi

docker build -t ${USER_NAME}/${IMAGE_NAME}:${TAG} -f ./Dockerfiles/Dockerfile.${FILE} --build-arg TAG=${TAG} .