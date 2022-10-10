ARG TAG
FROM nvcr.io/nvidia/l4t-ml:${TAG}

RUN apt-get update && \
    apt-get install --no-install-recommends -y git ffmpeg

RUN pip3 install -U pip && \
    pip3 install matplotlib pillow

RUN rm ~/.jupyter/jupyter_lab_config.py && \
    jupyter lab --generate-config

COPY ./JupyterLib/jupyter_lab_config.py /root/.jupyter/

COPY ./JupyterLib/dist/JetsonPatches-1.0.0-py3-none-any.whl /temp/JetsonPatches-1.0.0-py3-none-any.whl
RUN pip3 install /temp/JetsonPatches-1.0.0-py3-none-any.whl && \
    rm -rf /temp

WORKDIR /workspace
CMD /bin/bash