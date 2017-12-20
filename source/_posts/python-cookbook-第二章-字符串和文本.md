---
title: 'python-cookbook 第二章:字符串和文本'
date: 2017-12-20 20:57:47
author: "月牙天冲"
header-img: "python.png"
cdn: 'header-off'
tags:
  - 学习笔记
  - python3-cookbook
---



# 第二章: 字符串和文本

## 写在最前

  ### [format的语法](https://docs.python.org/3/library/string.html#format-string-syntax)

  ```
  replacement_field ::=  "{" [field_name] ["!" conversion] [":" format_spec] "}"
  field_name        ::=  arg_name ("." attribute_name | "[" element_index "]")*
  arg_name          ::=  [identifier | integer]
  attribute_name    ::=  identifier
  element_index     ::=  integer | index_string
  index_string      ::=  <any source character except "]"> +
  conversion        ::=  "r" | "s" | "a"
  format_spec       ::=  <described in the next section>

  format_spec     ::=  [[fill]align][sign][#][0][width][grouping_option][.precision][type]
  fill            ::=  <any character>
  align           ::=  "<" | ">" | "=" | "^"
  sign            ::=  "+" | "-" | " "
  width           ::=  integer
  grouping_option ::=  "_" | ","  # 千位数的分隔符
  precision       ::=  integer
  type            ::=  "b" | "c" | "d" | "e" | "E" | "f" | "F" | "g" | "G" | "n" | "o" | "s" | "x" | "X" | "%"
  ```

## 2.15 字符串中插入变量

### 问题


  想要创建一个内嵌变量的字符串，变量被用他的值所表示的字符串替换


### 解决方案
```python
s = '{name} has {n} apples'
# 使用参数
s.format(name='link', n=10)
#'link has 10 apples'

# 使用mapping
s.format_map({'name': 'link', 'n': 10})
#'link has 10 apples'

# vars()
name = 'link'
n = 10
s.format_map(vars())
#'link has 10 apples'
```


`vars()` 还有一个有意思的特性就是它也适用于对象实例

```python
class Info:
  def __init__(self, name=None, n=None):
      self.name = your
      self.n =n

info = Info(name='link', n=10)
s.format_map(vars(info))
#'link has 10 apples'
```

但是这样还不能很好的处理参数的却是,所以我们还可以定义一个新的dict类
```python
class SafeSub(dict):
  def __missing__(self, key):
    return '{' + key + '}'

info = Info(name='link')
s.format_map(SafeSub(vars()))
##'link has {n} apples'

import sys

def sub(text):
    return text.format_map(safesub(sys._getframe(1).f_locals))
# sub() 函数使用 sys._getframe(1) 返回调用者的栈帧。可以从中访问属性 f_locals
# 来获得局部变量。 毫无疑问绝大部分情况下在代码中去直接操作栈帧应该是不推荐的。
# 但是，对于像字符串替换工具函数而言它是非常有用的。 另外，值得注意的是 f_locals
# 是一个复制调用函数的本地变量的字典。 尽管你可以改变 f_locals 的内容，
# 但是这个修改对于后面的变量访问没有任何影响。 所以，虽说访问一个栈帧看上去很邪恶，
# 但是对它的任何操作不会覆盖和改变调用者本地变量的值。
```


### 讨论

python 中对于字符串替换有许多其他的解决方案。例如:
```python
name = 'Guido'
n = 37
'%(name)s  %(n)d messages.' % vars()

import string
s = string.Template('$name has $n messages.')
s.substitute(vars())
```

但是 format 和 format_map 比这些方法都要先进。所以应该优先使用。而且还可以对齐,填充,格式化等.

## 2.16 以指定列宽格式化字符串

### 问题

   你有一些长字符串，想以指定的列宽将它们重新格式化。

### 解决方案

使用 `textwrap` 模块来格式字符串输出,比如
```python
s = "Look into my eyes, look into my eyes, the eyes, the eyes, \
the eyes, not around the eyes, don't look around the eyes, \
look into my eyes, you're under."

import textwrap
textwrap.fill(s, width=20)
# Look into my eyes,
# look into my eyes,
# the eyes, the eyes,
# the eyes, not around
# the eyes, don't look
# around the eyes,
# look into my eyes,
# you're under.

textwrap.fill(s, 40, initial_indent='****')
# ****Look into my eyes, look into my
# eyes, the eyes, the eyes, the eyes, not
# around the eyes, don't look around the
# eyes, look into my eyes, you're under.

textwrap.fill(s, 40, subsequent_indent='****')
# Look into my eyes, look into my eyes,
# ****the eyes, the eyes, the eyes, not
# ****around the eyes, don't look around
# ****the eyes, look into my eyes, you're
# ****under.
```

### 讨论

 textwrap 对于字符串打印非常有用。特别是你想打印输出匹配终端大小的时候.你可以使用os.get_terminal_size()
 ```python
 import os
 os.get_terminal_size()
 # os.terminal_size(columns=76, lines=32)
 ```

## 2.17 在字符串中处理html和xml

### 问题

你想将HTML或者XML实体如 &entity; 或 &#code; 替换为对应的文本。 再者，你需要转换文本中特定的字符(比如<, >, 或 &)。

### 解决方案

如果你想替换文本字符串中的 ‘<’ 或者 ‘>’ ，使用 html.escape() 函数可以很容易的完成。比如：
```python
s = 'Elements are written as "<tag>text</tag>".'
from html import escape, unescape
es = escape(s)
# 'Elements are written as &quot;&lt;tag&gt;text&lt;/tag&gt;&quot;.'

escape(s, quote=False) # 不转化 " 和 '
# 'Elements are written as "&lt;tag&gt;text&lt;/tag&gt;".'

unescape(es)
# 'Elements are written as "<tag>text</tag>".'
```

### 讨论

## 2.18 字符串令牌解析



## 2.19 实现一个简单的递归下降分析器
## 2.20 字节字符串上的字符串操作
