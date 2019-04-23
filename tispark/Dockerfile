FROM anapsix/alpine-java:8

ENV SPARK_VERSION=2.3.2 \
    HADOOP_VERSION=2.7 \
    SPARK_HOME=/opt/spark \
    SPARK_MASTER_PORT=7077 \
    SPARK_MASTER_HOST=0.0.0.0 \
    SPARK_MASTER_WEBUI_PORT=8080

RUN apk --no-cache add \
      coreutils \
      mysql-client \
      procps

ADD tispark-tests /opt/tispark-tests
ADD tispark-sample-data /opt/tispark-sample-data

RUN wget -q https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && tar zxf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C /opt/ \
	  && ln -s /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} ${SPARK_HOME} \
    && rm -rf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

WORKDIR ${SPARK_HOME}
