---
title: Word2Vec阅读(一)
date: 2018-02-05 15:07:17
tags:
  - 学习笔记
categories: 机器学习
---

原文地址[Word2Vec Tutorial - The Skip-Gram Model](http://mccormickml.com/2016/04/19/word2vec-tutorial-the-skip-gram-model/)


## Word2Vec Tutorial - The Skip-Gram Model
>This tutorial covers the skip gram neural network architecture for Word2Vec. My intention with this tutorial was to skip over the usual introductory and abstract insights about Word2Vec, and get into more of the details. Specifically here I’m diving into the skip gram neural network model.

这个教程涵盖了Skip gram nenural network 的 Word2Vec 的结构,
我做这个教程的想法是跳过Word2Vec常见的介绍和抽象的概念，直接获取更多的细节。这里我开始潜入Skip gram neural network 模型.

## The Model
>The skip-gram neural network model is actually surprisingly simple in its most basic form; I think it’s the all the little tweaks and enhancements that start to clutter the explanation.

skip-gram neural network 模型的基本形式惊人的简单。我认为所有的苦恼都源于杂糅解释。

>Let’s start with a high-level insight about where we’re going. Word2Vec uses a trick you may have seen elsewhere in machine learning. We’re going to train a simple neural network with a single hidden layer to perform a certain task, but then we’re not actually going to use that neural network for the task we trained it on! Instead, the goal is actually just to learn the weights of the hidden layer–we’ll see that these weights are actually the “word vectors” that we’re trying to learn.

让我们从高阶的视角开始。Word2Vec使用了一个你可能会在其他机器学习里面见过的技巧。我们将会训练一个简单的只有一层隐藏层的神经网络，用来代表一个任务，但是我们不会真的使用那个神经网络在我们的训练的任务上。取而代之的是，我们的目标实际是学习得到隐藏层的权重，我们将会见到这些权重其实才是“word vectors”我们想要学习得到的。

# The Fake Task
> So now we need to talk about this “fake” task that we’re going to build the neural network to perform, and then we’ll come back later to how this indirectly gives us those word vectors that we are really after.

> We’re going to train the neural network to do the following. Given a specific word in the middle of a sentence (the input word), look at the words nearby and pick one at random. The network is going to tell us the probability for every word in our vocabulary of being the “nearby word” that we chose.

所以现在我们需要讨论一下这个将会建立神经网络模型模拟的“假”的任务。

我们将会训练神经网络做以下的事情。给定一个句子中间的字，在这个字的旁边随机取一个另一个字。神经网络将要告诉我们每一个在字典中的字，成为这个旁边的字的可能性。


> The output probabilities are going to relate to how likely it is find each vocabulary word nearby our input word. For example, if you gave the trained network the input word “Soviet”, the output probabilities are going to be much higher for words like “Union” and “Russia” than for unrelated words like “watermelon” and “kangaroo”.

输出的可能性需要与每一个字典中发 有关联。
例如，如果你训练网络的输入字“soviet”, “Union” 和 “Russia”的可能性就要远大于“watermelon” and “kangaroo”。

> We’ll train the neural network to do this by feeding it word pairs found in our training documents. The below example shows some of the training samples (word pairs) we would take from the sentence “The quick brown fox jumps over the lazy dog.” I’ve used a small window size of 2 just for the example. The word highlighted in blue is the input word.

我们将会训练这个神经网络完成这些通过给他一对在训练文档中找到的字。
下面的例子展示了一些训练的示例，我们将会从句子“The quick brown fox jumps over the lazy dog.”中取字。我用了一个小的窗口大小-2，仅仅用于示范。蓝色高亮的部分是输入的字。

![training_data](training_data.png)

![training_data](skip_gram_net_arch.png)

![training_data](output_weights_function.png)
