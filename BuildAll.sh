#!/bin/bash
BuildImages=("jetpack|r35.1.0|tomoya"
             "base|r35.1.0|tomoya"
             "tensorflow|r35.1.0-tf2.9-py3|tomoya"
             "tensorflow|r35.1.0-tf1.15-py3|tomoya"
             "pytorch|r35.1.0-pth1.13-py3|tomoya")

for s in "${BuildImages[@]}"
do
    IFS=, ARR=(${s})
    echo ${ARR[@]}
    bash Run.sh -i ${ARR[0]} -t ${ARR[1]} -u ${ARR[2]}
done