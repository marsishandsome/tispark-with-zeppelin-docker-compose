#!/usr/bin/env bash

cd /opt/tispark-sample-data

mysql -h tidb -P 4000 -u root < dss.ddl
