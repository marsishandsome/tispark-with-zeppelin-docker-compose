FROM mars/tispark:latest

ENV ZEPPELIN_VERSION 0.8.1

RUN wget -q http://mirrors.tuna.tsinghua.edu.cn/apache/zeppelin/zeppelin-${ZEPPELIN_VERSION}/zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz \
    && tar zxf zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz -C /opt/ \
    && mv /opt/zeppelin-${ZEPPELIN_VERSION}-bin-all /opt/zeppelin \
    && rm zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz

WORKDIR /opt/zeppelin

CMD ["/opt/zeppelin/bin/zeppelin.sh"]
