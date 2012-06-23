---
layout: post
title: cssh/DSH：ssh之cluster 管理工具
date: '2008-8-21'
comments: true
categories: Mac&*UNIX
link: true
---
由于系统用到了很多的服务器，大致分成下面几组：
<ul>
	<li>A组是做web服务器；</li>
	<li>B组是App服务器；</li>
	<li>C组是DB服务器；</li>
</ul>
每组服务器都有多台，APP服务器最多，有10多台，DB有5台，每次升级或者查询系统状况都是逐个的SSH登录，比较麻烦，一直在找一个可以按组管理多台服务器脚本或者客户端。
在linuxtoy上看到对<a href="http://www.netfort.gr.jp/~dancer/software/dsh.html.en">dsh</a>和<a href="http://cssh.sourceforge.net/">cssh</a>的介绍，正好满足我的需求，记录一下。
1、<a href="http://linuxtoy.org/archives/cssh.html">cssh：cluster 管理工具 (ssh)</a>
2、<a href="http://linuxtoy.org/archives/dsh.html">dsh：分布式 shell</a>
需要了解的，按照上面的链接了解。
