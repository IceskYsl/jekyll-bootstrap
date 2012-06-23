---
layout: post
title: 解决ubuntu下的rails开发时mysql的问题！
date: '2007-7-31'
comments: true
categories: Ruby&Rails
link: true
---
今天开电脑的时候没有注意选择，直接重启到前几天装的ubuntu下，于是懒得重新启动了，于是就在 ubuntu下继续开发好了，rails环境前几天就搭建好了,也测试过了，于是把源代码copy过来，重启后，初始化数据库，页面显示乱码，进数据库看看也是乱码，看来是有点问题。于是google了一把，抓住关键点，很快就解决了，以前在win下出现过乱码都解决了，所以这里针对ubuntu上的问题：1、配置sock地址另外还可能会出现一个错误No such file or directory - /tmp/mysql.sock这个是因为在ubuntu下默认的mysql是如上位置，于是在database.ym里面需要重新设置一下就ok了，如下：SQL代码   1. development:     2.   adapter: mysql     3.   database: sdroad_development     4.   username: root     5.   password:     6.   host: localhost     7.   socket: /var/run/mysqld/mysqld.sock 2、改变mysql编码，如下：1.） 修改mysql的配置文件 sudo gedit /etc/mysql/my.cnf在[client]下面增加 default-character=utf82. ）在mysql shell下建立数据库.create database 1ster default character set utf8;*同时发表：*http://weblog.1ster.cn/?action=show&amp;id=153
