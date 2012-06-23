---
layout: post
title: 晒shell历史，看看哪个使用率最高！
date: '2008-10-20'
comments: true
categories: Mac&*UNIX
tags: shell
link: true
---
晒历史的脚本：
[ice@bj-web12]$ history | awk {'print $2'} | sort | uniq -c | sort -k1 -rn | head
330 ll
214 cd
72 cat
38 exit
29 more
27 tail
20 vi
17 cp
16 ps
15 down
记录下而已～
