---
layout: post
title: DNS缓存投毒以及其他相关安全问题
date: '2008-8-5'
comments: true
categories: Security
link: true
---
前些日子，<strong>DNS缓存投毒</strong>的漏洞可行性被讨论的沸沸扬扬的，就我订阅的几个安全相关的RSS上就看到不少篇相关的文章，虽然有些细节都遮遮掩掩的，但是可以肯定的是DNS缓存机制确实存在相关的漏洞可以利用。

关于DNS的工作机制和原理就不细说了，非三言两语可以说清楚的，大家还是google下好了，这里说的DNS投毒的基本思路是想办法构造和伪造一些域名对应的IP地址，设法修改DNS缓存，致使其他访问者到此DNS服务器查询的时候，将其带入你精心构造的页面，用来钓鱼或者其他用途。

“比如我们要攻击www.google.com.首先向目的DNS服务器查询根本不存在的二级域名，比如：aaa.google.com. DNS服务器在缓存中查找aaa.google.com,没有找到，则会向上级DNS或者权威DNS查询 。这时我们可以生成伪造的DNS Response数据包并发送这些的伪造DNS Response数据包给目的服务器。让目的DNS在上级DNS或者权威DNS服务器响应到达之前，接受到恶意的应答。”

关于该问题，绿盟科技发布了一篇公告“<a href="http://www.nsfocus.net/vulndb/12124">多家厂商DNS实现缓存中毒漏洞</a>”，也有人发布Ruby版本的EXP“<a href="http://www.milw0rm.com/exploits/6122">Kaminsky DNS Cache Poisoning Flaw Exploit for Domains</a>”,另外一些安全爱好者也发表了自己的看法，如“<a href="http://www.icylife.net/yunshu/show.php?id=586">DNS缓存中毒漏洞的一点推测</a>”，“<a href="http://www.neeao.com/blog/article-5299.html">DNS缓存投毒细节泄露</a>”等。

&nbsp;
