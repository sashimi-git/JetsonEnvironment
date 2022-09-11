# JetsonXavierNX ML Environment
Running these Dockerfiles will install the following packages:
- Machine learning library (one of the following)
    - Tensorflow v1.15.5
    - Tensorflow v2.9.1
    - Pytorch v1.13.0
        - torchvision v0.13.0
        - torchaudio v0.12.0
- opencv v4.5.x
- numpy
- matplotlib
- pandas
- jupyter lab
- pillow

## Build
```
$ bash ./Build.sh -i <IMAGENAME> -u <USERNAME>
```
For example:
```
$ cd JetsonXavierNX-ML-Environment
$ bash ./Build.sh -i tensorflow1 -u sashimi
```
## Run
If you use the camera:
```
$ bash ./Run.sh -i <IMAGENAME> -u <USERNAME> -c
```
If you don't use the camera:
```
$ bash ./Run.sh -i <IMAGENAME> -u <USERNAME>
```
For example:
```
$ cd JetsonXavierNX-ML-Environment
$ bash ./Run.sh -i tensorflow1 -u sashimi -c
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
Then go to http://localhost:8888 or http://JetsonIPAddress:8888.