---
layout: post
title: 安装QQ的linux版本
date: '2008-8-2'
comments: true
categories: Mac&*UNIX Tips
link: true
---
以前是ubuntu下的使用gaim和eva都不是很好用QQ，7.31号QQ发布了linux版本，一直没来得及试试，今天搞好宽带后终于可以试试了，还行，还讲的过去。

======安装过程===

iceskysl@IceskYsl:/home/software$ wget http://dl_dir.qq.com/linuxqq/linuxqq_1.0-Preview1_i386.deb
--11:07:14--  http://dl_dir.qq.com/linuxqq/linuxqq_1.0-Preview1_i386.deb
=&gt; `linuxqq_1.0-Preview1_i386.deb'
正在解析主机 dl_dir.qq.com... 121.11.68.3, 202.104.241.135, 202.104.241.136, ...
正在连接 dl_dir.qq.com|121.11.68.3|:80... 已连接。
已发出 HTTP 请求，正在等待回应... 200 OK
长度： 4,870,522 (4.6M) [application/octet-stream]

100%[====================================&gt;] 4,870,522    122.24K/s    ETA 00:00

11:08:05 (94.06 KB/s) - `linuxqq_1.0-Preview1_i386.deb' 已经保存 [4870522/4870522]

iceskysl@IceskYsl:/home/software$ dpkg -i linuxqq_1.0-Preview1_i386.deb
dpkg: 该操作需要超级用户权限
iceskysl@IceskYsl:/home/software$ sudo dpkg -i linuxqq_1.0-Preview1_i386.deb
选中了曾被取消选择的软件包 linuxqq。
(正在读取数据库 ... 系统当前总共安装有 225548 个文件和目录。)
正在解压缩 linuxqq (从 linuxqq_1.0-Preview1_i386.deb) ...
正在设置 linuxqq (1.0-Preview1) ...
iceskysl@IceskYsl:/home/software$

就不截图了，需要了解详细的去他官方了解吧：http://im.qq.com/qq/linux/
