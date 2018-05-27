---
title: Loss Function
date: 2018-05-25 11:27:51
author: "月牙天冲"
mathjax: true
tags:
  - 机器学习
---

http://yeephycho.github.io/2017/09/16/Loss-Functions-In-Deep-Learning/
http://www.csuldw.com/2016/03/26/2016-03-26-loss-function/

# Loss Function
顾名思义，误差损失函数, 用于计算预测和实际值得误差的函数.

## 前期知识
### 似然函数[WiKi](https://zh.wikipedia.org/wiki/%E4%BC%BC%E7%84%B6%E5%87%BD%E6%95%B0)
似然函数是一种对于统计模型中参数的估计
#### 似然性 和 概率
概率是指在已知一些条件的情况下预估结果
似然性则是用于在已知某些观测所得到的结果时，对有关事物的性质的参数进行估计

在这种意义上，似然函数可以理解为条件概率的逆反。在已知某个参数B时，事件A会发生的概率写作：
$$
P(A|B) = \dfrac{P(A, B)}{P(B)}
$$
根据[贝叶斯定理](https://zh.wikipedia.org/wiki/%E8%B4%9D%E5%8F%B6%E6%96%AF%E5%AE%9A%E7%90%86)
$$
P(B|A) = \dfrac{P(A|B) \cdot P(B)}{P(A)}
$$

例子：
  假设投掷硬币2次得到正面,记 H为得到正面的事件, pH为得到正面的概率
  则
  $$
  P(HH|pH) = pH^2 = 0.5^2
  $$
  因此2次正面的结果的似然函数为:
  $$
  L(pH|HH) = P(HH|pH) = pH^2
  $$
  所以，当 * pH = 0.5 * 时，似然函数的值是0.25(注意这里的0.25并不是pH取值0.5的概率),这个大小并不重要
  当 * pH = 0.6 * 时， L(pH|HH) = 0.36, 0.36 > 0.25.
  注意到这里似然函数的值变大了。
  所以根据观测的结果，2次正面朝上，pH=0.6比pH=0.5的概率更大，似然函数值更大，更为合理.
  **似然函数的重要性不是它的具体取值，而是当参数变化时函数到底变小还是变大** 对同一个似然函数，如果存在一个参数值，使得它的函数值达到最大的话，那么这个值就是最为“合理”的参数值。


## Mean Sequared Error(L2 Loss)

$$
MSG = \dfrac{1}{n} \sum{e^2}
$$

## Cross Entropy Loss

$$
Loss = - \dfrac{1}{m} \sum_{i=0}^m[y_i \cdot log(p_i) + (1-y_i) \cdot log(1 - p_i)]
$$
$Sigmod = (1 + e^{-x})^{-1}$


## L1 Loss
