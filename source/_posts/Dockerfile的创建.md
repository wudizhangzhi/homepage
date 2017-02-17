---
title: Dockerfile的创建
date: 2017-02-17 16:52:27
author: "月牙天冲"
header-img: "http://images2015.cnblogs.com/blog/1003956/201609/1003956-20160929094610156-2054520507.png"
cdn: 'header-off'
tags:
  - docker
---


* FROM <image name>

指定容器基于哪个基础镜像创建


* MAINTAINER <author name>

设置镜像的作者


* RUN <commend>

在容器中运行的命令


* ADD <src> <destination>

复制文件指令, destination是容器内的路径。source可以是URL或者是启动配置上下文中的一个文件


* CMD

提供了容器默认的执行命令。 Dockerfile只允许使用一次CMD指令。 使用多个CMD会抵消之前所有的指令，只有最后一个指令生效,CMD有三种形式：
```
CMD ["executable","param1","param2"]
CMD ["param1","param2"]
CMD command param1 param2
```


* EXPOSE <port>

指定容器运行在监听的端口


* ENTRYPOINT

配置给容器一个可执行的命令，这意味着在每次使用镜像创建容器时一个特定的应用程序可以被设置为默认程序。同时也意味着该镜像每次被调用时仅能运行指定的应用。类似于CMD，Docker只允许一个ENTRYPOINT，多个ENTRYPOINT会抵消之前所有的指令，只执行最后的ENTRYPOINT指令。语法如下：
```
ENTRYPOINT ["executable", "param1","param2"]
ENTRYPOINT command param1 param2
```


* WORKDIR

指定RUN、CMD与ENTRYPOINT命令的工作目录。语法如下：

```
WORKDIR /path/to/workdir
```


* ENV

设置环境变量。它们使用键值对，增加运行程序的灵活性。语法如下：

```
ENV <key> <value>
```


* USER
镜像正在运行时设置一个UID。语法如下：

```
USER <uid>
```


* VOLUME

授权访问从容器内到主机上的目录。语法如下：

```
VOLUME ["/data"]
```

例子:
```
FROM localhost:5000/ubuntu:14.4
MAINTAINER wudizhangzhi
ADD localfile.txt /home/targetfile.txt
WORKDIR /home/
RUN pip install -r targetfile.txt
EXPOSE 7777
```
```bash
docker build -t wudizhangzhi/ubuntu:latest .
```
