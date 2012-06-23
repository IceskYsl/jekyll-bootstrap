---
layout: post
title: 如何再虚拟主机上安装gem
date: '2007-5-24'
comments: true
categories: Mac&*UNIX Ruby&Rails
link: true
---
有的时候，虚拟主机提供商并不能按照每个用户的需求安装全部的gem,这个时候，我们就需要自己动手了，如下是我在一家虚拟主机上的安装builder的过程，主要就是先FTP把gem包放上去，然后本地安装的时候使用一个--install-dir来指定安装到的目录。&lt;code&gt;[1ster@1ster.cn@bee-00 gemdir]$ gem install  builder-2.1.1.gem --install-dir /var/***/***/1ster.cn/gemdirSuccessfully installed builder, version 2.1.1Installing ri documentation for builder-2.1.1...Installing RDoc documentation for builder-2.1.1...&lt;/code&gt;
