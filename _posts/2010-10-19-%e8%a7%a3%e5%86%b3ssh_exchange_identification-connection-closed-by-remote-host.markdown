--- 
layout: post
comments: true
title: "\xE8\xA7\xA3\xE5\x86\xB3ssh_exchange_identification: Connection closed by remote host,"
date: "2010-10-19"
link: false
categories: life
---
用的好好的ssh突然链不上去了,查到说修改<span style="font-size: 15.6px;">/etc/hosts.deny 和 /etc/hosts.allow</span>

然后发现/etc/ssh下的文件不能设为777的权限，要将权限设为600。

于是偶chmod 600 /etc/ssh/*，然后再次重启了ssh。
<div id="_mcePaste">root@e:/home/iceskysl# /etc/init.d/ssh restart</div>
<div id="_mcePaste">/var/run/sshd must be owned by root and not group or world-writable.</div>
<div id="_mcePaste">root@e:/home/iceskysl#  chmod 600  /var/run/sshd</div>
root@e:/home/iceskysl# /etc/init.d/ssh restart/var/run/sshd must be owned by root and not group or world-writable.root@li84-64:/home/iceskysl#  chmod 600  /var/run/sshd
