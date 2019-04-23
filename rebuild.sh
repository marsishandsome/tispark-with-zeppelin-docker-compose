# /bin/bash

docker rmi mars/tispark:latest
docker build -t mars/tispark:latest tispark/

docker rmi mars/zeppelin:latest
docker build -t mars/zeppelin:latest zeppelin/
