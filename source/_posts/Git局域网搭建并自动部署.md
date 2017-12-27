---
title: Git局域网搭建并自动部署
date: 2017-12-27 11:29:56
tags:
---


```
mkdir sampleproject.git
cd sampleproject.git
git init --bare


unset GIT_DIR
DeployPath="/home/taidii/document/document/"
echo "==============================================="
cd $DeployPath
echo "deploying the document web"
git pull origin master
echo "================================================"
```
