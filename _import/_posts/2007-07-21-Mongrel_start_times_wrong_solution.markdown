---
layout: post
title: mongrel启动时报错的解决
date: '2007-7-21'
comments: true
categories: Ruby&Rails
link: true
---
记不得时候在本地机子上安装了mongrel，今天把1stlog用mongrel运行时，报告：-e:3:in `load': no such file to load -- mongrel_rails (LoadError)	from -e:3看错误提示貌似mongrel_rails 这个加载不到，那么应该就是配置的问题了，问题解决如下：找到RadRails的 preferences &gt; Rails &gt; configuration ，在这里指定mongrel_rails的路径就可以了（注意不是bat也不是cmd，而是那个没有后缀的）ok，解决了，如果有谁遇到这个问题，也算帮忙了。呵呵。。。
