---
title: mysql增量备份和恢复
date: 2017-05-26 21:21:42
author: "月牙天冲"
tags:
  - mysql
---


## 1.设置文件my.conf中的mysqld添加配置
```shell
server_id       = 1
log_bin         = /var/log/mysql/mysql-bin.log # 二进制日志保存的路径
expire_logs_days    = 10
max_binlog_size   = 100M
binlog_ignore_db    = mysql # 不写入日志的数据库
binlog_ignore_db    = test # 多个需要重复设置
```

## 2.重启进入mysql查看
```
mysql> show binary logs;
+--------------+-----------+
| Log_name     | File_size |
+--------------+-----------+
| mysql.000001 |  20437849 |
| mysql.000002 |    102119 |
| mysql.000003 |    488825 |
| mysql.000004 |  18150699 |
| mysql.000005 |  36176222 |
+--------------+-----------+

```
```
mysql> show master status;
+--------------+----------+--------------+------------------+-------------------+
| File         | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set |
+--------------+----------+--------------+------------------+-------------------+
| mysql.000005 | 36205491 |              | mysql,test       |                   |
+--------------+----------+--------------+------------------+-------------------+
```

## 3. 全量备份
```
shell> mysqldump --single-transaction --flush-logs --master-data=2 \
         --all-databases > backup_sunday_1_PM.sql
```
--single-transaction 单独的事务
--flush-logs 刷新二进制日志
--master-data
