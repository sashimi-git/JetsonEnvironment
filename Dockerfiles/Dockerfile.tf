ARG TAG
FROM nvcr.io/nvidia/l4t-tensorflow:${TAG}

RUN apt-get update && \
    apt-get install --no-install-recommends -y python3-pip git wget ffmpeg

RUN pip3 install -U pip && \
    pip3 install matplotlib pillow pandas scipy ipywidgets

RUN pip3 install jupyterlab && \
    jupyter lab --generate-config && \
    rm ~/.jupyter/jupyter_lab_config.py

COPY ./JupyterLib/jupyter_lab_config.py /root/.jupyter/

COPY ./JupyterLib/dist/JetsonPatches-1.0.0-py3-none-any.whl /temp/JetsonPatches-1.0.0-py3-none-any.whl
RUN pip3 install /temp/JetsonPatches-1.0.0-py3-none-any.whl && \
    rm -rf /temp

WORKDIR /workspace
CMD /bin/bash