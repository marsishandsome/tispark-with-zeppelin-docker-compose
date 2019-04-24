FROM mars/tispark:latest

ENV ZEPPELIN_VERSION 0.8.1

RUN wget -q http://download.pingcap.org/zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz \
    && tar zxf zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz -C /opt/ \
    && mv /opt/zeppelin-${ZEPPELIN_VERSION}-bin-all /opt/zeppelin \
    && rm zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz

ADD interpreter.json /opt/zeppelin/conf/interpreter.json

WORKDIR /opt/zeppelin

CMD ["/opt/zeppelin/bin/zeppelin.sh"]
