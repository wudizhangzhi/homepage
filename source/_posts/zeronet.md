---
title: zeronet
date: 2017-06-15 23:13:57
author: "月牙天冲"
tags:
---


# 什么是ZeroNet?
ZeroNet是一个去中心化的类似于Internet的网络，由匈牙利的开发者使用Python制作，完全开源。网站由特殊的"ZeroNet URL"可以被使用一般的浏览器通过ZeroNet程序浏览，就像访问本地主机一样。ZeroNet默认并不匿名，但是用户可以通过内置的Tor功能进行匿名化。ZeroNet使用Bitcoin加密算法及BitTorrent网络。
防DMCA Take down
由于ZeroNet去中心化的原因,国外有人制作了一个ZeroNet版本的海盗湾，,这个网站可让版权所有者头疼啦...一般的网站服务器都有IP地址,不抗投诉的ISP收到了向IP WHOIS滥用信箱发送的DMCA投诉信的话,你就要和你的网站说再见了..(俗称 DMCA Take down),可用了ZeroNet后,并没有一台服务器是真实的服务器,任何访客都有可能成为服务器,还有些访客使用了Tor,更找不到真正的物理地址。
功能
实时站点更新
支持 Namecoin 的 .bit 域名
安装方便: 只需解压并运行
一键克隆存在的站点
无需密码、基于 BIP32 的认证：用与比特币钱包相同的加密方法用来保护你的账户 你的账户被使用和比特币钱包相同的加密方法
内建 SQL 服务器和 P2P 数据同步: 让开发更简单并提升加载速度
匿名性: 完整的 Tor 网络支持，支持通过 .onion 隐藏服务相互连接而不是通过IPv4地址连接
TLS 加密连接
自动打开 uPnP 端口
插件和多用户 (开放式代理) 支持
全平台兼容
原理
在你运行zeronet.py后你将可以通过http://127.0.0.1:43110/{zeronet_address} (比如.http://127.0.0.1:43110/1HeLLo4uzjaLetFx6NH3PMwFP3qbRbTf3D)。访问 zeronet 中的站点。
在你浏览 zeronet 站点时，客户端会尝试通过 BitTorrent 网络来寻找可用的节点，从而下载需要的文件 (html, css, js...)
你将会储存每一个浏览过的站点
每个站点都包含一个名为 content.json ，它储存了其他所有文件的 sha512 hash 值 和一个通过站点私钥建立的签名
如果站点的所有者 (拥有私钥的那个人) 修改了站点, 并且他/她签名了新的 content.json 然后推送至其他节点， 那么所有节点将会在验证 content.json 的真实性 (使用签名)后, 下载修改后的文件并推送至其他节点。
有关于 ZeroNet 加密, 站点更新, 多用户站点的幻灯片 »
常见问题 »
ZeroNet开发者文档 »


好了，说点有用的：
1.可以建自己的网站，你基本上不用做什么。
2.基于p2p原理，你只要建好并有人浏览过，即使你自己关机，你的网站依然在全球存在。别人想关你站，没门。
3.基于p2p原理，支付内网穿透，也就是说你在内网也没关系，手机也没问题。
4.基于比特币原理，账号很安全，谁也不知道你是谁，谁也盗不去。
5.不需要域名，任何人访问都使用http://127.0.0.1:43110/字符串 来访问。
6.不用gg fb和tt你就能浏览全世界
项目地址：该项目的官方网址为: https://github.com/hellozeronet/zeronet
下载地址：https://github.com/HelloZeroNet/ZeroBundle/raw/master/dist/ZeroBundle-win.zip
相关说明：http://www.wanbizu.com/news/201603086775.html
安装方法？其实很简单，到官网zeronet.io下载，解压，双击运行，等进度走完就会自动打开默认浏览器，你就可以访问了。一般新系统都能正常运行，老系统有两种情况：如果自动打开浏览器后发现页面显示不正常，说明你的IE不支持，用chrome或者firefox浏览器来打开127.0.0.1:43110就行了。XP用户如果运行不了，那就需要下载安装微软的VC2008 Redistributable Package运行环境，才1MB多，搜一下就有了。
安装：解压后运行zeronet.cmd


安装后你唯一要做的，是注册一个id。
http://127.0.0.1:43110/zeroid.bit

# 如何加入 ？
下载 ZeroBundle 文件包:
Microsoft Windows
Apple OS X
Linux 64bit
Linux 32bit
解压缩
运行 ZeroNet.cmd (win), ZeroNet(.app) (osx), ZeroNet.sh (linux)
如果你在 OS X 上遇到了 "classic environment no longer supported" 错误，请打开一个终端然后把 ZeroNet.app 拖进去
在你打开时他将会自动下载最新版本的 ZeroNet 。
## Linux 命令行
wget https://github.com/HelloZeroNet/ZeroBundle/raw/master/dist/ZeroBundle-linux64.tar.gz
tar xvpfz ZeroBundle-linux64.tar.gz
cd ZeroBundle
执行 ./ZeroNet.sh 来启动
在你打开时他将会自动下载最新版本的 ZeroNet 。
在 Debian Linux 中手动安装
sudo apt-get update
sudo apt-get install msgpack-python python-gevent
wget https://github.com/HelloZeroNet/ZeroNet/archive/master.tar.gz
tar xvpfz master.tar.gz
cd ZeroNet-master
执行 python zeronet.py 来启动
在你的浏览器中打开 http://127.0.0.1:43110/
## Vagrant
vagrant up
通过 vagrant ssh 连接到 VM
cd /vagrant
运行 python zeronet.py --ui_ip 0.0.0.0
在你的浏览器中打开 http://127.0.0.1:43110/
## Docker
```
docker run -d -v <local_data_folder>:/root/data -p 15441:15441 -p 43110:43110 nofish/zeronet
# 这个 Docker 镜像包含了 Tor ，但默认是禁用的，因为一些托管商不允许你在他们的服务器上运行 Tor。如果你希望启用它， 设置 ENABLE_TOR 环境变量为 true (默认: false). E.g.:
Docker run -d -e "ENABLE_TOR=true" -v <local_data_folder>:/root/data -p 15441:15441 -p 43110:43110 nofish/zeronet
```
在你的浏览器中打开 http://127.0.0.1:43110/
## Virtualenv
```
virtualenv env
source env/bin/activate
pip install msgpack-python gevent
python zeronet.py
```
在你的浏览器中打开 http://127.0.0.1:43110/
现有限制
没有类似于 BitTorrent 的文件拆分来支持大文件
没有比 BitTorrent 更好的匿名性 (已添加内置的完整 Tor 支持)
传输文件时没有压缩和加密 (已添加 TLS 支持)
不支持私有站点
# 如何创建一个 ZeroNet 站点?
如果 zeronet 在运行，把它关掉 执行：
$ zeronet.py siteCreate
...
- Site private key: 23DKQpzxhbVBrAtvLEc2uvk7DZweh4qL3fn3jpM3LgHDczMK2TtYUq
- Site address: 13DNDkMUExRf9Xa9ogwPKqp7zyHFEqbhC2
...
- Site created!
$ zeronet.py
...
你已经完成了！ 现在任何人都可以通过 http://localhost:43110/13DNDkMUExRf9Xa9ogwPKqp7zyHFEqbhC2 来访问你的站点
下一步: ZeroNet 开发者文档
我要如何修改 ZeroNet 站点?
修改位于 data/13DNDkMUExRf9Xa9ogwPKqp7zyHFEqbhC2 的目录. 在你改好之后:
$ zeronet.py siteSign 13DNDkMUExRf9Xa9ogwPKqp7zyHFEqbhC2
- Signing site: 13DNDkMUExRf9Xa9ogwPKqp7zyHFEqbhC2...
Private key (input hidden):
输入你在创建站点时获得的私钥
$ zeronet.py sitePublish 13DNDkMUExRf9Xa9ogwPKqp7zyHFEqbhC2
...
Site:13DNDk..bhC2 Publishing to 3/10 peers...
Site:13DNDk..bhC2 Successfuly published to 3 peers
- Serving files....
就是这样! 你现在已经成功的签名并推送了你的更改。
帮助这个项目
Bitcoin: 1QDhxQ6PraUZa21ET5fYUCPgdrwBomnFgX
Paypal: https://zeronet.readthedocs.org/en/latest/help_zeronet/donate/
Gratipay: https://gratipay.com/zeronet/
赞助商
在 OSX/Safari 下 BrowserStack.com 带来更好的兼容性
感谢!
更多信息, 帮助, 变更记录和 zeronet 站点: https://www.reddit.com/r/zeronet/
在: #zeronet @ FreeNode 和我们聊天，或者使用 gitter
这里是一个 gitter 上的中文聊天室
Email: hello@noloop.me
# 福利
海盗湾全球种子站：http://127.0.0.1:43110/1PLAYgDQboKojowD3kwdb3CtWmWaokXvfp/
MSDN资源区：http://127.0.0.1:43110/1AJB5rtjfB9imjDGVk5vtRtZp3zgYizbpG/
Kindle电子书：http://127.0.0.1:43110/1KHCBG6dmbKXTZNenfwhWZ5x3oDyYyHSD4
导航：http://127.0.0.1:43110/1NzWeweqJ32aRVdM5UzFnYCszuvG5xV3vS

ZeroNet站点集合 & 搜索引擎
站点集合
http://127.0.0.1:43110/138R53t3ZW7KDfSfxVpWUsMXgwUnsDNXLP/?Page:list-of-zites
( 中文翻译在这里 )
http://127.0.0.1:43110/zaphods.bit/RM.html
http://127.0.0.1:43110/0list.bit/
http://127.0.0.1:43110/1Dt7FR5aNLkqAjmosWh8cMWzJu633GYN6u/
搜索引擎
http://127.0.0.1:43110/kaffiene.bit
http://127.0.0.1:43110/zerosearch.bit/
http://127.0.0.1:43110/zerofind.bit
公用开放ZeroNet代{过}{滤}理集合（注意，这些代{过}{滤}理不能确保你的帐号安全）
http://127.0.0.1:43110/ZeroProxies.bit
聊天室集合
http://127.0.0.1:43110/zerochatrooms.bit
博客集合
http://127.0.0.1:43110/zeroblogs.bit
ZeroNet官方帮助集合
http://127.0.0.1:43110/ZeroSupport.bit
