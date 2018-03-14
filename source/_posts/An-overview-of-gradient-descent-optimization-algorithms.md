---
title: An overview of gradient descent optimization algorithms
date: 2018-02-28 11:20:08
author: "月牙天冲"
mathjax: true
tags:
  - 机器学习
  - 学习笔记
---

# 梯度下降优化算法的概览
[原文链接](http://ruder.io/optimizing-gradient-descent/index.html)

# Gradient Descent Variants
主要有3种梯度下降，分别是Batch Gradient Descent, SGD, Mini-Batch Gradient Desceng

## Batch Gradient Descent

$$
\theta = \theta - \eta \cdot \nabla_\theta J( \theta)
$$

其中:
    $\theta$ :参数
    $\eta$ :学习率(步长)
    $J()$ :误差方程

参数 = 参数 - 学习率 * 参数变化率
```python
for i in range(num_epochs):
    params_grad = evaluate_gradient(loss_function, datas, params)
    params = params - learning_rate * params_grad

```

## SGD (Stochastic Gradient Descent)
每个样本训练时候都更新参数

```python
for i in range(num_epochs):
    np.random.shuffle(datas)
    for example in datas:
        params_grad = evaluate_gradient(loss_function, example, params)
        params = params - learning_rate * params_grad
```

## Mini-Batch Gradient Descent
每个小的训练集更新参数
```python
for i in range(num_epochs):
    np.random.shuffle(datas)
    for mini_batch in get_batches(datas, batch_size=50):
        params_grad = evaluate_gradient(loss_function, mini_batch, params)
        params = params - learning_rage * params_grad
```


# Algorithms
梯度下降的一些优化算法，就是更新梯度下降过程中更新参数的算法。

## Momentum
普通的算法的缺点是计算梯度和更新参数完全依靠当前batch的数据，这样容易使得梯度很不稳定，并且容易陷入局部最优(local optima)
于是Momentum引入物理中惯性的概念, 计算梯度时候一定程度上依赖之前的轨迹


$$
\begin{align}
\begin{split}
v_t &= \gamma v_{t-1} + \eta \nabla_\theta J( \theta) \\  
\theta &= \theta - v_t
\end{split}
\end{align}
$$

其中 $\gamma$ 一般被设置为0.9

## NAG(Nesterov Accelerated Gradient)
Momentum方法比喻为物理中的惯性，小球滚下坡。但是我们希望小球更加的聪明，能够预知什么地方该减速什么地方该加速，在上坡之前就开始减速。Momentum中我们对 $\theta$ 求导，这里我们对 $\theta - \eta v_{t-1}$ 求导

$$
\begin{align}
\begin{split}
v_t = \gamma v_{t-1} + \eta \nabla_\theta J(\theta - \gamma v_{t-1}) \\
\theta = \theta - v_t

\end{split}
\end{align}
$$

## Adagrad
前面的方法中，所有的参数都同时使用同一个学习率更新，这里我们每个参数在不同的时间使用不同的学习率更新,我们设新的梯度下降目标函数 $g_{t, i}$ 对于参数 $\theta_i$ ，时间 t 为：

$$
g_{t, i} = \nabla_\theta J(\theta_{t,i})
$$
所以
$$
\theta_{t+1, i} = \theta_{t, i} - \eta \cdot g_{t, i}
$$
最后：
$$
\theta_{t+1, i} = \theta_{t, i} - \dfrac{\eta}{\sqrt{G_{t, ii} + \epsilon}} \cdot g_{t, i}
$$

其中 $G_{t, ii} \in \mathbb{R}^{i \times i}$ 是一个对角矩阵(diagonal matrix),对角线上的值 i,i是步数, $\epsilon$ 是用于平滑曲线的，防止分母是0，一般取值为 *1e-8*



出现频繁的学习率小，不频繁的学习率大，因此适合应用在分散的数据。
但是因为分母计算每个参数的平方和，所以容易出现参数爆炸

## Adadelta


## RMSprop

## Adam

## AdaMax

## Nadam

## AMSGrad
