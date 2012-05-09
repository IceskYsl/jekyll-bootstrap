--- 
layout: post
comments: true
title: nginx+spawn-fcgi+php
date: 2010-1-13
link: false
categories: life
---
由于这个blog用的是wordpress，需要在VPS上搭一套PHP的环境，以前折腾过，倒也不费事，最后用spawn-fcgi来跑，记录一条如下
<blockquote>
/usr/bin/spawn-fcgi -a 127.0.0.1 -p 9100 -u www-data -g www-data -f /usr/bin/php-cgi -C 10</blockquote>

然后修改下php.ini的upload_max_filesize，就差不多OK了～
