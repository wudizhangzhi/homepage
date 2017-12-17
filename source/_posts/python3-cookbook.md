---
title: python3 cookbook
date: 2017-12-16 20:52:58
author: "月牙天冲"
header-img: "python.png"
cdn: 'header-off'
tags:
  - 学习笔记
---


# 第二章: 字符串和文本

## 2.15 字符串中插入变量

### 问题


  想要创建一个内嵌变量的字符串，变量被用他的值所表示的字符串替换


### 解决方案
```python
s = '{name} has {n} apples'
# 使用参数
s.format(name='link', n=10)

# 使用mapping
s.format_map({'name': 'link', 'n': 10})

# vars()
name = 'link'
n = 10
s.format_map(vars())
```


**vars()** 还有一个有意思的特性就是它也适用于对象实例

```python
class Info:
  def __init__(self, name=None, n=None):
      self.name = your
      self.n =n

info = Info(name='link', n=10)
s.format_map(vars(info))
```

但是这样还不能很好的处理参数的却是,所以我们还可以定义一个新的dict类
```python
class SafeSub(dict):
  def __missing__(self, key):
    return '{' + key + '}'

s.format_map(SafeSub(vars()))


import sys

def sub(text):
    return text.format_map(safesub(sys._getframe(1).f_locals))
```


### 讨论
