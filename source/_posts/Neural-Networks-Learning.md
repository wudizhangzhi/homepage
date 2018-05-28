---
title: Neural Networks Learning
date: 2017-07-16 22:53:29
author: "月牙天冲"
tags:
  - 机器学习
  - 学习笔记
categories: 机器学习
---
# 0. design model
设计模型: lay_in, lay_hidden, lay_out
![design model](0.png)

# 1. randomly  initalize theta
initalize each theta(l) to a random value [-e, e]
![randomly  initalize theta](1.jpg)

# 2. forward propagation
# 2.1. compute a(l)
  计算 layer l 上的 a(l)
  ![compute a(l)](2.1.jpg)

# 2.2. compute cost J(theta)
![compute cost J(theta)](2.2.jpg)
# 3. back propagation
# 3.1. compute delta
![compute delta](3.1.jpg)

# 3.2. compute Delta
![compute Delta](3.2.jpg)

# 3.3. compute partial derivatives
![compute partial derivatives](3.3.jpg)

![compute partial derivatives](3.3_2.jpg)

# 4. add regularizaton

# 5. gradient checking
利用一个小规模的模型，来验证代码的正确性
![gradient checking](5.jpg)

# 6. use gradient descent or advanced optimization method try to minimize J(theta)
使用梯度下降或者高级方式迭代(如:fmincg), 最小化代价 J(theta)

```
options = optimset('MaxIter', 50);
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);
```



# P.S.
```
写公式的方法
<img src="http://chart.googleapis.com/chart?cht=tx&chl= 在此插入Latex公式" style="border:none;">
例如:
<img src="http://chart.googleapis.com/chart?cht=tx&chl=\Large x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}" style="border:none;">
```
效果
<img src="http://chart.googleapis.com/chart?cht=tx&chl=\Large x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}" style="border:none;">
