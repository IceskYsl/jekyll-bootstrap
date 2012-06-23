---
layout: post
title: CSS控制整个框架居中显示
date: '2007-5-20'
comments: true
categories: Tips
link: true
---
在整个ROR开发过程中,需要把整个框架居中,于是设置如下:body { margin:0 auto; font-family:arial; color:#000; width:900px; font-size:12pt;}按理论上这样就可以达到CSS居中控制DIV，但确不行，经过一上午的研究，终于搞定。添加3W的一段定义，应该是告诉IE按这种格式解析HTML。其实主要是因为我是手动写的代码，如果我用VS2005，这段是会自动添加的。&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;&gt;&lt;html xmlns=&quot;http://www.w3.org/1999/xhtml&quot;&gt;
