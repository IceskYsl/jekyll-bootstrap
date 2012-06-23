---
layout: post
title: linux下抓出哪个进程造成的iowait很高的方法
date: '2010-1-30'
comments: true
categories: Mac&*UNIX
tags: iowait
link: true
---
抓哪个进程干坏事前要先停掉syslog
/etc/init.d/rsyslog stop
echo 1 > /proc/sys/vm/block_dump
dmesg | egrep “READ|WRITE|dirtied” | egrep -o ‘([a-zA-Z]*)’ | sort | uniq -c | sort -rn | head
1423 kjournald
1075 pdflush
209 indexer
3 cronolog
1 rnald
1 mysqld
不要忘记在抓完之后关掉block_dump和启动syslog
echo 0 > /proc/sys/vm/block_dump
/etc/init.d/rsyslog start
