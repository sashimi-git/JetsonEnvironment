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
    echo "tensorflow"
    echo "pytorch"
    echo "ml"
}

function wrongParam() {
    echo "Wrong parameter."
    showHelp
    exit 1
}

while getopts i:u:t:n:rc:h option
do
case ${option} in
        i)
            if [ "${OPTARG}" = "" ]; then
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
        c)
            if [ "${OPTARG}" = "" ]; then
                echo "E:Parameter value not set."
                wrongParam
            fi
            USE_CAMERA="true"
            DEVICE=${OPTARG};;
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
    if [ "${USE_CAMERA}" = "true" ]; then
        docker run -it --rm -p 8888:8888 --runtime nvidia --device ${DEVICE}:${DEVICE} -v ~/Documents/workspace:/workspace -e OPENBLAS_CORETYPE=ARMV8 ${USER_NAME}/${IMAGE_NAME}:${TAG}
    else
        docker run -it --rm -p 8888:8888 --runtime nvidia -v ~/Documents/workspace:/workspace -e OPENBLAS_CORETYPE=ARMV8 ${USER_NAME}/${IMAGE_NAME}:${TAG}
    fi

else
    echo "E:required parameters has not been set."
    showHelp
    exit 1
fi

