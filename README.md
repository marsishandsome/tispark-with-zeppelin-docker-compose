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
%md
# 导入tpch测试数据

%sh
bash /opt/tispark-tests/loaddata.sh

%md
# 获取TiSpark版本

%spark
sc.getConf.get("spark.sql.extensions")
spark.sql("select ti_version()").show(false)

%md
# Select数据

%spark
spark.sql("use tpch_test")
spark.sql("select count(*) from lineitem").show

%md
# 运行tpch01 sql

%sql
select
    l_returnflag,
    l_linestatus,
    sum(l_quantity) as sum_qty,
    sum(l_extendedprice) as sum_base_price,
    sum(l_extendedprice * (1 - l_discount)) as sum_disc_price,
    sum(l_extendedprice * (1 - l_discount) * (1 + l_tax)) as sum_charge,
    avg(l_quantity) as avg_qty,
    avg(l_extendedprice) as avg_price,
    avg(l_discount) as avg_disc,
    count(*) as count_order
from
    lineitem
where
    l_shipdate <= date'1998-12-01' - interval '90' day
group by
    l_returnflag,
    l_linestatus
order by
    l_returnflag,
    l_linestatus
```

## replace tispark jar
build from [source](https://github.com/pingcap/tispark) and replace the jar(jars/tispark-core-2.1-SNAPSHOT-jar-with-dependencies.jar).
