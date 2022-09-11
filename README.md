# JetsonXavierNX ML Environment
You can build an environment for artificial intelligence with JetsonXavierNX.
Running these Dockerfiles will install the following packages:
- Machine learning library (one of the following)
    - Tensorflow v1.15.5
    - Tensorflow v2.9.1
    - Pytorch v1.13.0
        - torchvision v0.13.0
        - torchaudio v0.12.0
- opencv v4.6.0
- numpy
- matplotlib
- pandas
- jupyter lab
- pillow

## Build
```
bash ./Build.sh -i <IMAGENAME> -u <USERNAME>
```
For example:
```
cd JetsonXavierNX-ML-Environment
bash ./Build.sh -i tensorflow1 -u sashimi
```
## Run
If you use the camera:
```
bash ./Run.sh -i <IMAGENAME> -u <USERNAME> -c
```
If you don't use the camera:
```
bash ./Run.sh -i <IMAGENAME> -u <USERNAME>
```
For example:
```
cd JetsonXavierNX-ML-Environment
bash ./Run.sh -i tensorflow1 -u sashimi -c
```

## Run Jupyter Lab
Jupyter lab is installed at build time. If you want to use it, execute the code below to get the password and then rewrite line 960 of "jupyter_lab_config.py".
```
$ ipython
from jupyter_server.auth import passwd
passwd()
```