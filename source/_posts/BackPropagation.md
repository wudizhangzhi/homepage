---
title: 'Backpropagation(向后传播算法)'
date: 2018-06-13 11:51:49
author: "月牙天冲"
mathjax: true
tags:
  - 机器学习
---


# 希腊符号读音
```
希腊字母 汉字注音 汉语拼音
Αα   阿尔法   alfa
Ββ   贝塔     bita
Γγ   伽马     gama
Δδ   德耳塔   dêlta
Εε   艾普西龙 êpsilon
Ζζ   截塔     zita
Ηη   艾塔     yita
Θθ   西塔     sita
Ιι   约塔     yota
Κκ   卡帕     kapa
∧λ   兰布达  lamda
Μμ   米尤    miu
Νν   纽      niu
Ξξ   克西     ksai
Οο   奥密克戎 oumikelong
∏π   派  pai
Ρρ   若 rou
∑σ   西格马  sigma
Ττ   套  tao
Φφ   斐 fai
Χχ   喜 hai
Υυ   宇普西龙 yupsilon
Ψψ   普西  psai
Ωω   欧米伽 omiga
```
# Back Bropagation(向后传播)
![backpropagation](backpropagation2.png)

其中:
$$
net_i: 第i个神经元的输入 \\\\
o_i: 第i个神经元的输出  \\\\
\omega_{i, j}: 第i个神经元到下一层第j个神经元的权重 \\\\
$$

因此可得:
$$
o_i = \gamma(net_i) \\\\
E = \sum[t\cdot\log(y) + (1-t)\cdot\log(1-y)]
$$

其中:
 - $\gamma$ 是激活函数
 - **E** 是误差(这里使用Cross Entropy Loss), **y**是为输出神经元的实际输出， **t**为样本的预期输出

所以求误差对于权重的偏微分:
$$
\begin{align}
\dfrac{\sigma(E)}{\sigma(\omega_{i, j})} &= \dfrac{\sigma(E)}{\sigma(o_j)} \cdot \dfrac{\sigma(o_j)}{\sigma(net_j)} \cdot \dfrac{\sigma(net_j)}{\sigma(\omega_{i, j})} \\\\
\end{align}
$$

其中:
$$
\begin{align}
\dfrac{\sigma(o_j)}{\sigma(net_j)} &= \dfrac{\sigma(\gamma(net_j))}{\sigma(net_j)}  \\\\
&= \gamma(net_j) \cdot (1 - \gamma(net_j)) \\\\
&= o_j \cdot (1 - o_j)
\end{align}
$$


$$
\begin{align}
\dfrac{\sigma(net_j)}{\sigma(\omega_{i, j})} &= \dfrac{\sigma}{\sigma(\omega_{i, j})}(\omega_{i, j} \cdot o_i + b_i) \\\\
&= o_i
\end{align}
$$


## 输出层
因为当$o_j$是最后一层输出层时:
$$
\begin{align}
\dfrac{\sigma(E)}{\sigma(o_j)} &= \dfrac{\sigma}{\sigma(y)} \cdot [t \cdot \log(y) + (1-t)\cdot\log(1-y)] \\\\
&= \dfrac{t}{y} - \dfrac{1-t}{1-y} \\\\
&= \dfrac{t - y}{y\cdot(1 - y)}
\end{align}
$$



## 隐藏层
当$o_j$为任意一层隐藏层的时:
$$
\begin{align}
\dfrac{\sigma(E)}{\sigma(o_j)} &= \dfrac{\sum_{l \in L}E_l}{\sigma(o_j)} \\\\
&= \sum_{l \in L}\dfrac{E}{\sigma(o_j)} \\\\
&= \sum_{l \in L}\dfrac{E}{\sigma(o_l)} \cdot \dfrac{\sigma(o_l)}{\sigma(net_l)} \cdot \dfrac{\sigma(net_l)}{\sigma(o_j)} \\\\
&= \sum_{l \in L}\dfrac{E}{\sigma(o_l)} \cdot \dfrac{\sigma(o_l)}{\sigma(net_l)} \cdot \dfrac{(\omega_{j, l} \cdot o_j + b_j)}{\sigma(o_j)} \\\\
&= \sum_{l \in L}\dfrac{E}{\sigma(o_l)} \cdot \dfrac{\sigma(o_l)}{\sigma(net_l)} \cdot \omega_{j, l} \\\\
\end{align}
$$
其中:
  - $L$是下一层神经层, $l \in L$神经层的神经元

这里设:
$$
\begin{align}
\delta_j &= \dfrac{E}{\sigma(o_j)} \cdot \dfrac{\sigma(o_j)}{\sigma(net_j)}
\end{align}
$$

所以有:
$$
\begin{align}
\delta_j &=
\begin{cases}
\dfrac{t - y}{y\cdot(1 - y)} \cdot o_j \cdot (1 - o_j) , &当j是输出层的神经元时 \\\\
\sum_{l \in L}(\delta_l \cdot \omega_{j, l} ) \cdot o_j \cdot (1 - o_j), &当j是隐藏层的神经元时  \\\\
\end{cases}
\end{align}
$$


# 更新参数
$$
\begin{align}
\omega_{i, j} &= \omega_{i, j} - \eta \cdot \dfrac{\sigma(E)}{\sigma(\omega_{i, j})} \\\\
&= \omega_{i, j} - \eta \cdot \delta_j \cdot o_i
\end{align}
$$

其中:
  - $\eta$  是学习率，也就是步长

同理:
$$
\begin{align}
b_{i, j} &=  b_{i, j} - \eta \cdot \dfrac{\sigma(E)}{\sigma(b_{i, j})} \\\\
&= b_{i, j} - \eta \cdot \delta_j
\end{align}
$$
