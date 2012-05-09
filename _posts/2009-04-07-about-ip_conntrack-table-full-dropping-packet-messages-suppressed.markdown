--- 
layout: post
comments: true
title: "About ip_conntrack: table full, dropping packet messages suppressed"
date: 2009-4-7
link: false
categories: life
---
<p>Here is a mp3 files server,<br />
<span style="border-collapse: separate; color: rgb(0, 0, 0); font-family: Simsun; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span"><span style="font-family: SimSun; font-size: 13px;" class="Apple-style-span">
<div style="margin-top: 0px; margin-bottom: 0px;">restart it ,and got some messages in /var/log/message ,like this:</div>
<div style="margin-top: 0px; margin-bottom: 0px;">
<div style="margin-top: 0px; margin-bottom: 0px;">Mar 31 12:34:24 garden kernel: ip_conntrack: table full, dropping packet.</div>
<div style="margin-top: 0px; margin-bottom: 0px;">Mar 31 12:40:11 garden<span class="Apple-converted-space">&nbsp;</span><strong><font color="#ff0000" class="Apple-style-span">kernel: ip_conntrack: table full, dropping packet.</font></strong></div>
<div style="margin-top: 0px; margin-bottom: 0px;">Mar 31 12:58:52 garden last message repeated 3 times</div>
<div style="margin-top: 0px; margin-bottom: 0px;">Mar 31 13:11:36 garden last message repeated 2 times</div>
<div style="margin-top: 0px; margin-bottom: 0px;">Mar 31 13:15:44 garden last message repeated 3 times</div>
<div style="margin-top: 0px; margin-bottom: 0px;">&nbsp;</div>
<div style="margin-top: 0px; margin-bottom: 0px;">--and restart here ------</div>
<div style="margin-top: 0px; margin-bottom: 0px;">Apr &nbsp;1 01:47:49 garden syslogd 1.4.1: restart.</div>
<div style="margin-top: 0px; margin-bottom: 0px;">Apr &nbsp;1 01:47:49 garden kernel: klogd 1.4.1, log source = /proc/kmsg started.</div>
<div style="margin-top: 0px; margin-bottom: 0px;">Apr &nbsp;1 01:47:49 garden kernel: Linux version 2.6.18-92.1.17.el5 (mockbuild@builder10.centos.org) (gcc version 4.1.2 20071124 (Red Hat 4.1.2-42)) #1 SMP Tue Nov 4 13:43:30 EST 2008</div>
</div>
</span></span><br />
looks like something wrong about &quot;<span style="border-collapse: separate; color: rgb(0, 0, 0); font-family: Simsun; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span"><span style="font-family: SimSun; font-size: 13px;" class="Apple-style-span">ip_conntrack&quot;,and i do some check like this:<br />
</span></span><span style="border-collapse: separate; color: rgb(0, 0, 0); font-family: Simsun; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span"><span style="font-family: SimSun; font-size: 13px;" class="Apple-style-span">
<div style="margin-top: 0px; margin-bottom: 0px;">[root@garden log]# cat /proc/sys/net/ipv4/ip_conntrack_max</div>
<div style="margin-top: 0px; margin-bottom: 0px;">65536</div>
<div style="margin-top: 0px; margin-bottom: 0px;">&nbsp;</div>
<div style="margin-top: 0px; margin-bottom: 0px;">got ip_conntrack timeout setting：</div>
<div style="margin-top: 0px; margin-bottom: 0px;">
<div style="margin-top: 0px; margin-bottom: 0px;">[root@garden log]# cat /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established</div>
<div style="margin-top: 0px; margin-bottom: 0px;">432000</div>
</div>
</span></span><br />
and you can sove it like this:<br />
<span style="border-collapse: separate; color: rgb(0, 0, 0); font-family: Simsun; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span"><span style="font-family: SimSun; font-size: 13px;" class="Apple-style-span">
<div style="margin-top: 0px; margin-bottom: 0px;">vi /etc/sysctl.conf&nbsp;</div>
<div style="margin-top: 0px; margin-bottom: 0px;">#Add this</div>
<div style="margin-top: 0px; margin-bottom: 0px;">net.ipv4.ip_conntrack_max = 655360&nbsp;</div>
<div style="margin-top: 0px; margin-bottom: 0px;">net.ipv4.netfilter.ip_conntrack_tcp_timeout_established = 180 <br />
<br />
and then ,refrech it.<br />
<span style="border-collapse: separate; color: rgb(0, 0, 0); font-family: Simsun; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span"><span style="font-family: SimSun; font-size: 13px;" class="Apple-style-span">sysctl -p </span></span></div>
</span></span><br />
any ideas?</p>
