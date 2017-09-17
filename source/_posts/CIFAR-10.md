---
title: CIFAR-10
date: 2017-09-17 21:12:51
author: "月牙天冲"
tags:
  - 机器学习
  - 学习笔记
  - Convolutional Neural Network
---


# CIFAR-10
## 1.about CIFAR-10
   用于训练分类的数据库，一共10种分类。
   地址：http://www.cs.toronto.edu/~kriz/cifar.html

## 2.模型
  ![CIFAR-10](CIFAR-10/graph.png)

  如图所示，当前使用的结构为<br>
  (C + MP) * 2 + F*3 <br>
  > (C: convolutional卷积层, MP: maxpooling, F: full connect)

## 3.结果
  * 2017-09-17 Accuracy : 62% 用时4h
  * To be continued
