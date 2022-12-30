# JetsonXavierNX ML Environment
## Package versions
- L4T-TensorFlow (2.9)
    - TensorFlow
    - OpenCV with CUDA
    - pillow
    - numpy
    - matplotlib
    - pandas
    - scipy
    - JupyterLab
- L4T-TensorFlow (1.15.5)
    - TensorFlow
    - OpenCV with CUDA
    - pillow
    - numpy
    - matplotlib
    - pandas
    - scipy
    - JupyterLab
- L4T-PyTorch
    - PyTorch
    - torchvision
    - torchaudio
    - OpenCV with CUDA
    - pillow
    - numpy
    - matplotlib
    - pandas
    - scipy
    - JupyterLab
- L4T-ML
    - Tensorflow (1.15.5)
    - PyTorch
    - torchvision
    - torchaudio
    - onnx
    - CuPy
    - numpy
    - numba
    - PyCUDA
    - OpenCV with CUDA
    - pandas
    - scipy
    - scikit-learn
    - JupyterLab

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
Note: Please specify version and user name in advance.

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
Then go to http://localhost:8888 or http://{Jetson IP Address}:8888.