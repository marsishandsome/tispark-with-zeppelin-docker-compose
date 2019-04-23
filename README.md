# TiSpark with zeppelin docker compose

## edit /etc/hosts
```
127.0.0.1       pd0
127.0.0.1       tikv0
```

## build docker file
```
docker rmi mars/tispark:latest
docker build -t mars/tispark:latest tispark/

docker rmi mars/zeppelin:latest
docker build -t mars/zeppelin:latest zeppelin/
```

## start docker
```
docker-compose up -d
```

## stop docker
```
docker-compose down
```

## visit spark web & zeppelin
http://127.0.0.1:8080/

http://127.0.0.1/#/


## connect TiDB with mysql client
```
mysql -u root -h 127.0.0.1 -P 4000
```

## run command in zeppelin
```
%sh
bash /opt/tispark-tests/loaddata.sh

%spark
sc.getConf.get("spark.sql.extensions")
spark.sql("select ti_version()").show(false)
spark.sql("use tpch_test")
spark.sql("select count(*) from lineitem").show
```

## replace tispark jar
build from [source](https://github.com/pingcap/tispark) and replace the jar(jars/tispark-core-2.1-SNAPSHOT-jar-with-dependencies.jar).
