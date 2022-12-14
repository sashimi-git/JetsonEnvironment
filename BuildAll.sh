#!/bin/bash
IMAGES=("ml"
        "tensorflow"
        "tensorflow"
        "pytorch")

# Please edit to match your version.
TAGS=("r35.1.0-py3"
      "r35.1.0-tf2.9-py3"
      "r35.1.0-tf1.15-py3"
      "r35.1.0-pth1.13-py3")

# Please edit.
USER=""

for ((i=0;i<${#IMAGES[@]};i++))
do
    bash Build.sh -i ${IMAGES[i]} -t ${TAGS[i]} -u ${USER}
done