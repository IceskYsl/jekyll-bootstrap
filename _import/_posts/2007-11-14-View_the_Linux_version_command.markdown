---
layout: post
title: 查看Linux版本命令
date: '2007-11-14'
comments: true
categories: Ruby&Rails
link: true
---
<p>时间久了以后，想找出Linux 版本信息来看看，有2个文件里面有保存。<br />
<br />
<strong>cat /etc/redhat-release</strong><br />
Fedora Core release 5 (Bordeaux)<br />
<br />
<strong>cat /etc/issue</strong><br />
Fedora Core release 5 (Bordeaux)<br />
Kernel \r on an \m<br />
<br />
还有内核的版本信息在这里：<br />
<strong>cat /proc/version</strong><br />
<br />
Linux version 2.6.17-1.2145_FC5smp (<a href="mailto:brewbuilder@hs20-bc2-2.build.redhat.com">brewbuilder@hs20-bc2-2.build.redhat.com</a>) (gcc version 4.1.1 20060525 (Red Hat 4.1.1-1)) #1 SMP Sat Jul 1 13:19:14 EDT 2006</p>
