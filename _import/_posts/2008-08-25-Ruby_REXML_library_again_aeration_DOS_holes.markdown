---
layout: post
title: Ruby再曝REXML库的DOS漏洞
date: '2008-8-25'
comments: true
categories: Ruby&Rails Security
link: true
---
大家应该都还记得，前不久《<a href="http://iceskysl.1sters.com/?action=show&amp;id=319">Ruby暴出大量严重漏洞!</a>》，当时我说“ruby走向成熟，离不开这样的检验。”,时间过去不久，又发现其REXML库存在漏洞，被利用的话可以导致DOS攻击。

详细介绍在“<a href="http://www.ruby-lang.org/en/news/2008/08/23/dos-vulnerability-in-rexml/">DoS vulnerability in REXML</a>”，中文翻译在“<a href="http://www.javaeye.com/news/3310">Ruby的REXML库缺陷将导致DOS攻击</a>”。

值得注意的是，Ruby的所有版本都存在这个问题，需要修复的安全前面文章中的方法啊修复；凡是在Rails中解析到XML用到REXML的都存在这个问题，但是个人认为使用REXML来解析XML的并不算很多，其速度不够快。很多人用的是<a href="http://iceskysl.1sters.com/?action=tags&amp;item=hpricot">hpricot</a>。

漏洞并不可怕，可怕的是被藏着掖着，期待Ruby的日趋成熟和完善。
