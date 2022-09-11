# JetsonXavierNX ML Environment
You can build an environment for artificial intelligence with JetsonXavierNX.
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