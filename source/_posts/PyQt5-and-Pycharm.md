---
title: PyQt5 and Pycharm
date: 2018-05-26 17:58:43
tags:
  - PyQt
---

参考:https://www.jianshu.com/p/8066e8d4f187

## PyQt5
### 常用工具
* Qt Designer
* PyUIC5


## pyqt5的工具链配置
### 配置Qt Designer(mac 环境下)

使用 brew 安装pyqt5之后， designer一般路径为: **/usr/local/Cellar/qt/5.11.0/libexec/Designer.app**,可以自行搜索**Designer.app**

```
Tools->External Tools-> +
Name: Qt Designer
Description: 生成.ui文件
Program: /usr/local/Cellar/qt/5.11.0/libexec/Designer.app
Parameters: $FilePath$
Working directory: $ProjectFileDir$
```
配置好以后, 在.ui文件右键"External Tools->Qt Designer", 可以在Qt Designer中编辑这个.ui文件

### 配置PyUIC5
```
Tools->External Tools-> +
Name: PyUIC5
Description: 将.ui文件转为.py文件
Program: pyuic5
Parameters: $FilePath$ -o $FileDir$/$FileNameWithoutExtension$.py
Working directory: $ProjectFileDir$
```
配置好以后, 在.ui文件右键"External Tools->PyUIC5", 可以调用命令转成.py文件


## 使用pyinstaller打包
```shell
pyinstaller -F main.py
```
