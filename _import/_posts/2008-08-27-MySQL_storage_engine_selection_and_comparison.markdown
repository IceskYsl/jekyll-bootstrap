---
layout: post
title: MySQL存储引擎选择和比较
date: '2008-8-27'
comments: true
categories: Database
link: true
---
大家都知道MYSQL有很多的存储引擎机制，有人曾说过“多个引擎说明这是MYSQL的软肋，它不能像oracle那样搞出一个通用的”，这句话的具体意思自己揣摩，我就不瞎解读了。

今天看到一篇文章，是关于其存储引擎的，虽然不长，但是写的很不错，里面有些tips值得学习，不再翻译，其原文地址为《<a href="http://www.softwareprojects.com/resources/programming/t-mysql-storage-engines-1470.html">MySQL Storage Engines</a>》。

<img src="http://www.softwareprojects.com/blogimages/4w8SqRsqldiagram.png" alt="" />

<span class="TextMedium">Tip: <em>A well designed MySQL-powered application will use different storage engines for different tables. If you're still stuck with all MyISAM tables, now may be a good time to revisit.</em></span>
