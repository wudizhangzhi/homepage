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

## Automatic Script Creation
https://setuptools.readthedocs.io/en/latest/setuptools.html#automatic-script-creation
>Automatic Script Creation
>Packaging and installing scripts can be a bit awkward with the distutils. For one thing, there’s no easy way to have a script’s filename match local conventions on both Windows and POSIX platforms. For another, you often have to create a separate file just for the “main” script, when your actual “main” is a function in a module somewhere. And even in Python 2.4, using the -m option only works for actual .py files that aren’t installed in a package.
>setuptools fixes all of these problems by automatically generating scripts for you with the correct extension, and on Windows it will even create an .exe file so that users don’t have to change their PATHEXT settings. The way to use this feature is to define “entry points” in your setup script that indicate what function the generated script should import and run. For example, to create two console scripts called foo and bar, and a GUI script called baz, you might do something like this:


```python
setup(
    # other arguments here...
    entry_points={
        'console_scripts': [
            'foo = my_package.some_module:main_func',
            'bar = other_module:some_func',
        ],
        'gui_scripts': [
            'baz = my_package_gui:start_func',
        ]
    })
```
