---
layout: post
title: vsftpd下显示的时间与系统时间不一致问题
date: '2008-1-15'
comments: true
categories: Ruby&Rails
link: true
---
<p>最近老是遇到FTP上去看到的文件时间和实际登录上去查看得到的文件生成时间不一致的现象，找了下原因，是因为默认情况下，vsftpd&nbsp;是用<strong>gmt</strong>做为它的时间的，所以和系统的时间可能会不一致，修改也很简单：<br />
<br />
<strong>vi&nbsp;/etc/vsftpd/vsftpd.conf </strong></p>
<p>在最后加入一行：</p>
<p><u>use_localtime=yes </u></p>
<p>存盘后，重启vsftpd即可:</p>
<p><strong>service&nbsp;vsftpd&nbsp;restart </strong></p>
