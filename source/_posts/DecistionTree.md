---
title: DecisionTree
date: 2018-08-31 15:37:28
author: "月牙天冲"
mathjax: true
tags:
  - 学习笔记
  - 算法
  - 机器学习
---


# Decistion Tree(决策树)


假设有如下数据:

{% asset_img decision_tree.jpg decision_tree %}

## 信息熵(information entropy)

信息熵(Information entropy): 是度量样本集合纯度的一种指标
公式:
 假设当前样本集D中第k类样本所占的比利为 $p_k$ (k=1, 2, ..., |y|)
$$
Ent(D) = - \sum_{k=1}^{\vert y \vert}p_k\cdot log_2 p_k
$$

## 信息增益熵(Information gain)
信息增益熵(Information gain): 一定条件下，信息复杂度(不确定性)减少的程度
公式:
$$bdzhserver/account/rest/views.py
Gain(D, a) = Ent(D) - \sum_{v=1}^V \dfrac{|D^v|}{|D|}Ent(D^v)
$$

## 基尼指数(Gini index)

公式:
$$
Gini(D) = 1 - \sum_{k=1}^{|y|} p_k^2
$$

$$
Gini_index(D, a) = \sum_{v=1}^{V} \dfrac{|D^v|}{|D|}Gini(D^v)
$$


## 不同的算法

- ID3
  ```
  for node in nodes:
    pass
  ```
- C4.5
- CART(classification and regression tree)
