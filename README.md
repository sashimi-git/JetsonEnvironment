# JetsonXavierNX ML Environment
Running these Dockerfiles will install the following packages(Except l4t-base and l4t-jetpack container):
- Machine learning library (one of the following)
    - Tensorflow v1.15.5
    - Tensorflow v2.9.1
    - Pytorch v1.13.0
        - torchvision v0.13.0
        - torchaudio v0.12.0
- opencv v4.x.x
- numpy
- matplotlib
- pandas
- jupyter lab
- pillow

## Build
```
$ bash ./Build.sh -i <IMAGENAME> -u <USERNAME> -t <TAG>
```
For example:
```
$ cd JetsonEnvironment
$ bash ./Build.sh -i tensorflow -u sashimi -t r35.1.0-tf2.9-py3
```
If you don't know how to use:
```
$ bash ./Build.sh -h
```
If you want to build they all:
```
$ bash ./BuildAll.sh
```
## Run
If you use the camera:
```
$ bash ./Run.sh -i <IMAGENAME> -u <USERNAME> -t <TAG> -c
```
If you don't use the camera:
```
$ bash ./Run.sh -i <IMAGENAME> -u <USERNAME> -t <TAG>
```
For example:
```
$ cd JetsonEnvironment
$ bash ./Run.sh -i tensorflow -u sashimi -t r35.1.0-tf2.9-py3 -c
```
If you don't know how to use:
```
$ bash ./Run.sh -h
```

## Run Jupyter Lab
Specify the password in the command below.
```
$ jupyter lab password
```
Start Jupyter lab in the command below.
```
$ jupyter lab
```
Then go to http://localhost:8888 or http://JetsonIP:8888.