# JetsonXavierNX ML Environment
Package versions
- L4T-tensorflow 2.9
    - Tensorflow 2.9.1
    - OpenCV 4.x.x (with CUDA)
    - pillow latest
    - numpy latest
    - matplotlib latest
    - pandas latest
    - scipy latest
    - JupyterLab latest
- L4T-tensorflow 1.15
    - Tensorflow 1.15.5
    - OpenCV 4.x.x (with CUDA)
    - pillow latest
    - numpy latest
    - matplotlib latest
    - pandas latest
    - scipy latest
    - JupyterLab latest
- L4T-pytorch 1.13
    - PyTorch 1.13.0
    - torchvision 0.13.0
    - torchaudio 0.12.0
    - OpenCV 4.x.x (with CUDA)
    - pillow latest
    - numpy latest
    - matplotlib latest
    - pandas latest
    - scipy latest
    - JupyterLab latest
- L4T-ML
    - Tensorflow 1.15.5
    - PyTorch 1.12.0
    - torchvision 0.13.0
    - torchaudio 0.12.0
    - onnx 1.12.0
    - CuPy 10.2.0
    - numpy 1.22.4
    - numba 0.56.0
    - PyCUDA 2022.1
    - OpenCV 4.5.0 (with CUDA)
    - pandas 1.4.3
    - scipy 1.9.0
    - scikit-learn 1.1.1
    - JupyterLab 3.4.4

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