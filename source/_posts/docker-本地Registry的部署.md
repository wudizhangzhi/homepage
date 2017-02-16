---
title: docker 本地Registry的部署
date: 2017-02-17 00:41:36
author: "月牙天冲"
header-img: "docker.jpg"
cdn: 'header-off'
tags:
    - docker
---

# 1.本地Registry的部署
运行下面命令获取registry镜像

```bash
sudo docker pull registry:2.1.1 # tag版本号随意设置
```

然后启动一个容器
```bash
sudo docker run -d -v /opt/registry:/var/lib/registry -p 5000:5000 --restart=always --name registry registry:2.1.1
```

Registry服务默认会将上传的镜像保存在容器的/var/lib/registry，我们将主机的/opt/registry目录挂载到该目录，即可实现将镜像保存到主机的/opt/registry目录了。

运行docker ps 查看容易运行情况
```bash
docker ps
```

启动了registry服务，打开浏览器输入http://127.0.0.1:5000/v2 ，出现下面情况说明registry运行正常
```bash
curl localhost:5000/v2
```
返回{}

# 2.验证
我的机器上有个hello-world的镜像，我们要通过docker tag将该镜像标志为要推送到私有仓库，

```bash
sudo docker tag hello-world:1.0.0 127.0.0.1:5000/hello-world:1.0.0

sudo docker push 127.0.0.1:5000/hello-world:1.0.0
```
![logo](docker.jpg)
验证
```bash
curl http://127.0.0.1:5000/v2/_catalog
```
返回json
