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
    echo "base - [r35.1.0]"
    echo "tensorflow - [r35.1.0-tf2.9-py3]"
    echo "             [r35.1.0-tf1.15-py3]"
    echo "pytorch - [r35.1.0-pth1.13-py3]"
    echo "jetpack - [r35.1.0]"
}

function wrongParam() {
    echo "Wrong parameter."
    showHelp
    exit 1
}

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
            elif [ "${OPTARG}" = "base" ]; then
                FILE=base
            else
                wrongParam
            fi
            IMAGE_NAME=${OPTARG}
            ENTERED_I="t";;
        u)
            if [ "${OPTARG}" = "" ]; then
                wrongParam
            fi
            USER_NAME=${OPTARG}
            ENTERED_U="t";;
        t)
            if [ "${OPTARG}" = "" ]; then
                wrongParam
            fi
            TAG=${OPTARG}
            ENTERED_T="t";;
        h)
            showHelp
            exit 0;;
        \?)
            echo "Wrong parameter."
            showHelp
            exit 0;;
    esac
done

[ "${ENTERED_I}" != "t" ] && wrongParam
[ "${ENTERED_U}" != "t" ] && wrongParam
[ "${ENTERED_T}" != "t" ] && wrongParam

docker build -t ${USER_NAME}/${IMAGE_NAME}:${TAG} -f ./Dockerfiles/Dockerfile.${FILE} --build-arg TAG=${TAG} .