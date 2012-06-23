---
layout: post
title: RatProxy:Google提供的开源web应用安全工具
date: '2008-7-7'
comments: true
categories: Security
link: true
---
网络安全永远都是一个值得深究的领域，随着技术的不断发展，越来越多的技术手段被利用在网络安全中；而这其中，web安全越来越被人重视，攻击方式不断革新，技术手法层数不穷，但是目前的状况是，攻击和利用越来越自动化，但是防护和检查都还是偏向人工审核的方式，效率实在一般，但是基于web攻击手段的多样性和复杂性，一直没有一款比较不错的安全检查工具诞生。
<a href="http://code.google.com/p/ratproxy/"><strong>RatProxy</strong></a>是Google信息安全技术团队所研发的程序安全侦测工具，一向为Google 内部所使用。用于<a href="http://computerworld.com/action/article.do?command=viewArticleBasic&amp;articleId=9106758">评估基于Web的应用程序的安全性</a>。<a href="http://www.webappsec.org/">Web Application Security Consortium</a>在2006年的调查发现，31,373个被调查网站中有85.57%容易遭受跨站点脚本攻击，26.38%面临SQL注入攻击，15.70%有一些其它问题，可能导致数据丢失。
Google信息安全工程师Michal Zalewski表示，Google决定将该工具免费开放是因为他们认为这将对信息安全社群有价值，强化社群理解与Web技术有关的安全问题。RatProxy能够分析诸如跨站威胁、防御伪装的跨站请求，以及侦测到快取问题或是潜在的信息泄露问题等。
<img src="http://ratproxy.googlecode.com/files/ratproxy-screen.png" alt="" />
Google在文件中表示，RatProxy为一半自动、多数是被动的网络应用程序安全侦测工具，它同时补足了传统主动爬寻及手动侦测的缺点，而且特别针对潜在的问题及安全相关设计的精确侦测与自动批注进行优化。

至于比起传统安全侦测工具，Google亦列出几项 RatProxy 的优势，包括在默认的操作模式中不会引起仿真攻击所带来的庞大流量，可避免正在使用的系统的瓦解，而且它提供直觉式的操作，并降低时间及带宽的使用，并能找出产品的问题与潜在的漏洞等。

Ratproxy采用Apache 2.0软件许可证，可以查找Web应用程序中的多种代码问题，支持Linux、FreeBSD、Mac OS X、Windows(Cygwin)等操作系统，特别适用于用户为先的Web 2.0环境。
如果你感兴趣，请参考“<a href="http://code.google.com/p/ratproxy/wiki/RatproxyDoc">RatproxyDoc</a> ”
