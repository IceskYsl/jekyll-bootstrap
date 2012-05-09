--- 
layout: post
comments: true
title: set limit-rate fot lftp upload&downlod
date: 2009-6-8
link: false
categories: life
---
<p>add this line into /etc/lftp.conf<br />
<font color="#0000ff"><em>set net:limit-rate 10240000,40960</em></font><br />
<br />
that's limit upload rate to 10M,and download to 40K<br />
<br />
some useful resource:</p>
<p><a href="http://plog.longwin.com.tw/my_note-app-setting/2006/04/02/lftp_limit_conf_2006">http://plog.longwin.com.tw/my_note-app-setting/2006/04/02/lftp_limit_conf_2006</a></p>
<p><a href="http://blog.chinaunix.net/u/24834/showart_520018.html">http://blog.chinaunix.net/u/24834/showart_520018.html</a></p>
<p>&nbsp;</p>
<p><span style="border-collapse: separate; color: rgb(0, 0, 0); font-family: Simsun; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span"><span style="font-family: -webkit-monospace; font-size: 10px; line-height: 22px; text-align: justify;" class="Apple-style-span"><br />
</span></span></p>
