--- 
layout: post
comments: true
title: MySQL CONCAT
date: 2010-3-20
link: false
categories: life
---
MySQL CONCAT function is used to concatenate two strings to form a single string. Try out following example:
mysql> SELECT CONCAT('FIRST ', 'SECOND');
+----------------------------+
| CONCAT('FIRST ', 'SECOND') |
+----------------------------+
| FIRST SECOND               |
+----------------------------+
1 row in set (0.00 sec)

ie.
mysql -u eoewallpapers -p123456123 wallpapers -e 'set names 'utf8'; select CONCAT(base_url,"400",title) from photos where state > 10 ' > photos_400.txt
