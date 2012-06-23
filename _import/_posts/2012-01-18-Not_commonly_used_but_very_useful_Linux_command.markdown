---
layout: post
title: 不常用但很有用的linux命令
date: '2012-1-18'
comments: true
categories: Mac&*UNIX
link: true
---
这里纪录一些不常用但很有用的linux命令

#通过端口号找到进程(13543这个就是进程号)
[root@ lab]# netstat -lnp | grep 9000
tcp        0      0 0.0.0.0:9000                0.0.0.0:*                   LISTEN      13543/unicorn.rb -D 
