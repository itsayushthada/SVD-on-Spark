# -- Software Stack Version --#

SPARK_VERSION="3.1.2"
HADOOP_VERSION="3.2"
JUPYTERLAB_VERSION="3.0"

# -- Building the Images -- #

docker build \
  -f cluster-base.Dockerfile \
  -t itsayushthada/cluster-base:v1 .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg hadoop_version="${HADOOP_VERSION}" \
  -f spark-base.Dockerfile \
  -t itsayushthada/spark-base:v1 .

docker build \
  -f spark-master.Dockerfile \
  -t itsayushthada/spark-master:v1 .

docker build \
  -f spark-worker.Dockerfile \
  -t itsayushthada/spark-worker:v1 .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg jupyterlab_version="${JUPYTERLAB_VERSION}" \
  -f jupyter-lab.Dockerfile \
  -t itsayushthada/jupyter-lab:v1 .
  
# -- Pulling Prebuilt Images -- #
docker pull localstack/localstack:0.12.2
