---
title: python中几个get
date: 2018-01-09 10:31:02
author: "月牙天冲"
tags:
  - 学习笔记
---


```python
class Dept(object):
    def __init__(self, x):
        self.x = x

    def __get__(self, instance, owner):
        print('__get__: instance:{} owner:{}'.format(instance, owner))
        # if not instance:
        #     return self
        # else:
        #     return instance
        super(Dept, self).__get__(instance, owner)

    def __getattr__(self, item):  #
        print('__getattr__: {}'.format(item))
        super(Dept, self).__getattr__(item)

    def __getitem__(self, item):  # “_ getitem_”只适用于所有的“[]”运算符；
        print('__getitem__: {}'.format(item))
        super(Dept, self).__getitem__(item)

    def __getattribute__(self, item):  # “_ getattribute_”只适用于所有的“.”运算符；
        print('__getattribute__: {}'.format(item))
        super(Dept, self).__getattribute__(item)


```

## `__get__`

`__get__`将对象作为数据描述符

```python
class Company:
    dept = Dept(20)

c = Company()
c.dept  # __get__: instance:<__main__.test2.<locals>.Company object at 0x1059b07f0> owner:<class '__main__.test2.<locals>.Company'>
```

## `__getattribute__`

适用 '.' 运算符

```python
d = Dept(15)
d.x  # __getattribute__: x
```
## `__getattr__`

当 `__getattribute__` 找不到触发

```python
d = Dept(15)
d.y  # __getattribute__: y   __getattr__: y
```



## `__getitem__`

适用 '[]' 运算符

```python
d = Dept(15)
d['x']  # __getitem__: x
```
