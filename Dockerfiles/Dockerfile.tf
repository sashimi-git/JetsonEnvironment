ARG TAG
FROM nvcr.io/nvidia/l4t-tensorflow:${TAG}

RUN apt-get update && \
    apt-get install --no-install-recommends -y python3-pip git wget

RUN pip3 install -U pip && \
    pip3 install matplotlib pillow pandas

RUN pip3 install jupyterlab && \
    jupyter lab --generate-config && \
    rm ~/.jupyter/jupyter_lab_config.py

COPY jupyter_lab_config.py /root/.jupyter/

WORKDIR /workspace
CMD /bin/bash -c pip3 install -U pip && /bin/bash