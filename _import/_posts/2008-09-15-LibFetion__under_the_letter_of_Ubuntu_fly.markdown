---
layout: post
title: ! 'LibFetion: Ubuntu下的飞信'
date: '2008-9-15'
comments: true
categories: Mac&*UNIX
link: true
---
自从用了一段时间的blackberry后，其他都用的不习惯了，更不习惯在上面发短信，于是需要经常开下fetion一些短信，Ubuntu下没有正式的fetion的客户端，今天看到一个叫做LibFetion，试了下，很不错。
<blockquote>LibFetion是由<a href="http://www.libfetion.cn/author.html"><strong>邓东东</strong></a>主持开发的飞信应用程序开发库，其大部分代码使用C编写，支持所有POSIX兼容的操作系统。

LibFetion封装飞信通信协议和功能处理逻辑，给开发者提供简洁、丰富的API接口。使用LibFetion的开发者只需专注于GUI(图形用户界面)的设计开发，就能轻易开发出飞信客户端，能大大提高飞信客户端的开发速度和降低开发难度。 凭借LibFetion的跨平台性，使得飞信在多个操作系统平台上运行，达到“fetion anywhere“。

LibFetion是针对嵌入式设备系统设计的，它只使用了C库，提供平台线程库接口（缺省使用posix线程库)和网络接口（缺省使用socket）因此具有较强的可移植性。目前 LibFetion已在Linux，Mac OS X，Windows，ucLinux，Ecos操作系统上成功运行。

如今基于LibFetion开发的PC客户端程序LibFx已经发布 V0.8.1版了，<a href="http://www.libfetion.cn/demoapp_download.html">点击下载</a>。<a href="http://www.libfetion.cn/bbs/forumdisplay.php?fid=27"><strong>点击这里更换客户端皮肤资源</strong></a>。</blockquote>
安装记录如下：
iceskysl@IceskYsl:/home/source$ sudo dpkg -i linux_fetion_v0.8.1_8.04_i386.deb
[sudo] password for iceskysl:
选中了曾被取消选择的软件包 linuxfetion。
(正在读取数据库 ... 系统当前总共安装有 207059 个文件和目录。)
正在解压缩 linuxfetion (从 linux_fetion_v0.8.1_8.04_i386.deb) ...
正在设置 linuxfetion (0.8.1) ...
iceskysl@IceskYsl:/home/source$
