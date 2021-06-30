FROM itsayushthada/cluster-base:v1

# -- Layer: Apache Spark -- #

ARG spark_version=3.1.2
ARG hadoop_version=3.2
ARG hadoop_version_long=3.2.0

RUN apt-get update -y &&\
    apt-get install -y curl &&\
    apt-get install -y wget &&\
    apt-get install -y python3-numpy &&\
    apt-get install -y python3-matplotlib &&\
    curl https://archive.apache.org/dist/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop${hadoop_version}.tgz -o spark.tgz &&\
    tar -xf spark.tgz &&\
    mv spark-${spark_version}-bin-hadoop${hadoop_version} /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version_long} &&\
    mkdir /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version_long}/logs &&\
    rm spark.tgz &&\
    wget https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.888/aws-java-sdk-bundle-1.11.888.jar -P /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version_long}/jars/  &&\
    wget https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk/1.11.888/aws-java-sdk-1.11.888.jar -P /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version_long}/jars/  &&\
    wget https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/${hadoop_version_long}/hadoop-aws-${hadoop_version_long}.jar -P /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version_long}/jars/

# -- Environment Variables -- #

ENV SPARK_HOME /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version_long}
ENV SPARK_MASTER_HOST spark-master
ENV SPARK_MASTER_PORT 7077
ENV PYSPARK_PYTHON python3
ENV AWS_SECRET_ACCESS_KEY ayush
ENV AWS_ACCESS_KEY_ID ayush

# -- Runtime -- #

WORKDIR ${SPARK_HOME}
