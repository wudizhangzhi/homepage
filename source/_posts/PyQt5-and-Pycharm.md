---
title: PyQt5 and Pycharm
date: 2018-05-26 17:58:43
tags:
---

https://www.jianshu.com/p/8066e8d4f187


## pyqt5的工具链配置
###配置Qt Designer
Tools->External Tools-> +
Name: Qt Designer 
Description: 生成.ui文件 
Program: /Users/kirin/Qt5.8.0/5.8/clang_64/bin/Designer.app 
Parameters: $FilePath$ 
Working directory: $ProjectFileDir$ 
配置好以后, 在.ui文件右键"External Tools->Qt Designer", 可以在Qt Designer中编辑这个.ui文件
###配置PyUIC5
Tools->External Tools-> +
Name: PyUIC5 
Description: 将.ui文件转为.py文件 
Program: pyuic5 
Parameters: $FilePath$ -o $FileDir$/$FileNameWithoutExtension$.py 
Working directory: $ProjectFileDir$
配置好以后, 在.ui文件右键"External Tools->PyUIC5", 可以调用命令转成.py文件
