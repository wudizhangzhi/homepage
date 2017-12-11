---
title: Upload Python Package
date: 2017-12-11 10:26:18
author: "月牙天冲"
tags:
  - 学习笔记
---


## Upload Python Package To PyPi or PyPiTest
~/.pypirc
```shell
[distutils]
index-servers=
    pypi
    testpypi

[testpypi]
repository: https://test.pypi.org/legacy/
username: your testpypi username
password: your testpypi password
```

```shell
twine upload --repository-url https://test.pypi.org/legacy/ dist/*
pip install --index-url https://test.pypi.org/simple/ your-package
pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple your-package

twine upload --repository testpypi dist/*

#python setup.py register -r pypitest
python setup.py sdist upload -r pypitest
#python setup.py register -r pypi
python setup.py sdist upload -r pypi
```
