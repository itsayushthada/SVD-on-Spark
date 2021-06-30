FROM itsayushthada/cluster-base:v1

# -- Layer: JupyterLab -- #

ARG spark_version=3.1.2
ARG jupyterlab_version=3.0

RUN apt-get update -y && \
    apt-get install -y python3-pip && \
    pip3 install wget pyspark==${spark_version} jupyterlab==${jupyterlab_version} numpy matplotlib

# -- Runtime -- #

EXPOSE 8888
WORKDIR ${SHARED_DIR}
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=
