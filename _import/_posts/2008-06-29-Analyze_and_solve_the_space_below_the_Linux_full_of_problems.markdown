---
layout: post
title: 分析解决linux下的空间满的问题
date: '2008-6-29'
comments: true
categories: Mac&*UNIX
tags: linux
link: true
---
家里用的本本上装ubuntu的时候是在win上格了一块硬盘装的，原来硬盘60G，分了20G给linux，这几天发现系统有些不正常，直接告诉我是空间不足了，赶紧看看：
iceskysl@IceskYsl:/opt/devroot$ df
文件系统           1K-块        已用     可用 已用% 挂载点
/dev/sda8             10309796   9547180    238900  98% /
varrun                  772952       228    772724   1% /var/run
varlock                 772952         0    772952   0% /var/lock
udev                    772952        72    772880   1% /dev
devshm                  772952         0    772952   0% /dev/shm
lrm                     772952     38176    734776   5% /lib/modules/2.6.24-18-generic/volatile
/dev/sda7                93307     92784         0 100% /boot
/dev/sda9              9614116   5557504   3568240  61% /home
/dev/sda1             14195576  12552736   1642840  89% /media/sda1
/dev/sda5             15366140  13757584   1608556  90% /media/sda5
（PS：这个是我清掉一部分日志后的，原来的/是100%的）

可以看到，空间实在是紧张，没办法，又不想格了重新装，只能看看有没有啥“软”办法来清理下空间了，找到两篇不错的文章，《<a href="http://bbs.chinaunix.net/viewthread.php?tid=422421">解决Linux磁盘空间满的“软”办法</a>》列举了10个软办法，相当不错;《<a href="http://blog.csdn.net/chinalinuxzend/archive/2007/10/20/1834728.aspx">空间满问题，请各位高手帮忙啊！</a>》这个帖子讨论了一般的思路和方法。另外还可以参考如下两个文档：
http://www-900.ibm.com/developerWorks/cn/linux/filesystem/ext2/index.shtml
http://www-900.ibm.com/developerWorks/cn/linux/filesystem/l-fs9/index.shtml
