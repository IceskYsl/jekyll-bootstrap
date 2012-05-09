--- 
layout: post
comments: true
title: "Can\xE2\x80\x99t connect to local MySQL server through socket \xE8\xA7\xA3\xE5\x86\xB3\xE5\x8A\x9E\xE6\xB3\x95"
date: 2010-2-24
link: false
categories: life
---
Rails启动后报错，ERROR 2002 (HY000): Can’t connect to local MySQL server through socket ‘/temp/mysql.sock’ (2)

1、先查看 /etc/rc.d/init.d/mysqld status 看看m y s q l 是否已经启动.
另外看看是不是权限问题.

2、确定你的mysql.sock是不是在那个位置，
mysql -u 你的mysql用户名 -p -S /var/lib/mysql/mysql.sock

3、试试：service mysqld start

4、如果是权限问题，则先改变权限 #chown -R mysql:mysql /var/lib/mysql

[root@localhost ~]# /etc/init.d/mysqld start
启动 MySQL： [ 确定 ]
[root@localhost ~]# mysql -uroot -p
