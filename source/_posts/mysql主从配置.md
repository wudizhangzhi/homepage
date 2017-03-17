---
title: mysql主从配置
date: 2017-03-17 16:05:11
author: "月牙天冲"
tags:
  - mysql
---



## 1.主服务器

### 1.1 设置好配置文件

> cnf配置文件一般会有四个，可以根据命令 # ll /usr/share/mysql/\*.cnf 查看；

> my-small.cnf    内存少于或等于64M，只提供很少的的数据库服务；

> my-medium.cnf   内存在32M--64M之间而且和其他服务一起使用，例如web；

> my-large.cnf    内存有512M主要提供数据库服务；

> my-huge.cnf     内存有1G到2G，主要提供数据库服务；

> my-innodb-heavy-4G.cnf 内存有4G，主要提供较大负载数据库服务（一般服务器都使用这个）；

> 可以根据服务器配置的不同选择不同的cnf配置文件。

my.cnf
```
[mysqld]
server-id       = 1 # 必须，id，一般取IP最后一段
log-bin = mysql-bin # 必须，二进制日志文件
expire_logs_days    = 10
max_binlog_size   = 100M
binlog_do_db       = include_database_name # 包括的库名称 多个可换行多次设置
binlog_ignore_db   = include_database_name # 不包括的库名称 多个可换行多次设置
```

### 1.2 配置好给从服务器登陆的账号,重启
  ```
  grant replication slave on *.* to `tom`@`192.168.1.196` identified by 'password';
  ```
### 1.3 查看主服务器状态
  ```bash
  mysql> show master status;
  ```
### 1.4 备份数据库(如果从服务器也为新建库，则不需要此操作)

> 备份数据库的方法有很多种：如果在同一局域网可以直接复制数据库，也可以用工具直接进行数据导入。

> 复制数据库用打包的方法：

> cd/data  转到存放Mysql数据库的路径下

> tarcvfz testcreate.tar.gz db/

> 再从数据库中进行复制解压

> cd/data

> scp 192.168.1.61:/data/testcreate.tar.gz

> tar xvfz testcreate.tar.gz

## 2 从服务器
### 2.1.    配置从库服务my.cnf文件

    # vi etc/my.cnf 对其进行如下修改：

    Server-id = 2 # 这里ID改为2 因为主库为1;

    log-bin = mysql-bin  # 必填项，用于数据同步;

    master-host = 192.168.1.60 # 主库IP;

    master-user = test # 同步用的账户;

    master-password = 123456 # 同步账户密码，主库时的设置;

    master-port = 3306 # 同步数据库的端口号。

### 2.2    重启从库服务器

    #service mysqld restart

    如果重启失败则配置文件有问题，需重新检查配置。

### 2.3   调整复制过来的数据库的权限（如果有从主库复制过来的数据库）

    主库复制过来的数据库权限都为root权限，需要修改为mysql权限

    #chown–R mysql:mysql /var/lib/mysql

    如果从库是新建的库就不需要进行此步骤

### 2.4    显示从服务器状态

    进行mysql服务器：

    mysql>showslave status\G;
    查看Slave_IO_Running和Slave_SQL_Running都是yes则成功
