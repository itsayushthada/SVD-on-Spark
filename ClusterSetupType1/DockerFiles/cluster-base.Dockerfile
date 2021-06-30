ARG debian_img_tag=8-jre-slim
FROM openjdk:${debian_img_tag}

# -- Layer: Debian OS with Python 3.7 -- #

ARG shared_dir=/opt/notebook

RUN mkdir -p ${shared_dir} && \
    apt-get update -y && \
    apt-get install -y python3 && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*

ENV SHARED_DIR=${shared_dir}

# -- Runtime -- #

VOLUME ${shared_dir}
CMD ["bash"]
