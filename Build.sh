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
    echo "tensorflow"
    echo "pytorch"
    echo "ml"
}

function wrongParam() {
    echo "Wrong parameter."
    showHelp
    exit 1
}

while getopts i:u:t:h option
do
    case ${option} in
        i)
            if [ "${OPTARG}" = "tensorflow" ]; then
                FILE=tf
            elif [ "${OPTARG}" = "pytorch" ]; then
                FILE=pytorch
            elif [ "${OPTARG}" = "ml" ]; then
                FILE=ml
            else
                echo "E:Parameter value not set."
                wrongParam
            fi
            IMAGE_NAME=${OPTARG}
            ENABLED_I="true";;
        u)
            if [ "${OPTARG}" = "" ]; then
                echo "E:Parameter value not set."
                wrongParam
            fi
            USER_NAME=${OPTARG}
            ENABLED_U="true";;
        t)
            if [ "${OPTARG}" = "" ]; then
                echo "E:Parameter value not set."
                wrongParam
            fi
            TAG=${OPTARG}
            ENABLED_T="true";;
        h)
            showHelp
            exit 0;;
        \?)
            echo "E:required parameters has not been set."
            showHelp
            exit 1;;
    esac
done

if [ "${ENABLED_I}" = "true" ] && [ "${ENABLED_U}" = "true" ] && [ "${ENABLED_T}" = "true" ]; then
    docker build -t ${USER_NAME}/${IMAGE_NAME}:${TAG} -f ./Dockerfiles/Dockerfile.${FILE} --build-arg TAG=${TAG} .
else
    echo "E:required parameters has not been set."
    showHelp
    exit 1
fi