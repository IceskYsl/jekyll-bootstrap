---
layout: post
title: 解决/var空间不足导致的无法登录问题
date: '2008-8-26'
comments: true
categories: Mac&*UNIX
link: true
---
<strong>现象描述</strong><br id="og5d0" />
项目中有台服务器，其操作系统为RHEL 3 ，主要用途是实验室环境以及和第三方系统的FTP服务器，最近出现经常出现“假死”的情况，具体表现是<span id="dbxk">Ping的通，但是ssh、ftp、telnet等都无法登陆</span>，从lan console上看服务器运行正常。每次都是远程重启暂时解决问题。<br id="yi-7" />
<strong id="aosk"><br id="jkfi0" />
深入分析</strong><br id="o:nd" />
今天，另外一个负责主机维护的同事发现其<span id="kb6n" class="694285000-26022007"><span id="kb6n0" style="font-size: x-small;"><span id="kb6n1" style="color: #0000ff;"><span id="kb6n2" style="color: #000102;">/var/log/messages.x中有如下信息：<br id="zphx" />
</span></span></span></span>
<blockquote id="gc7q"><span id="gc7q0" class="694285000-26022007"><span id="gc7q1" style="font-size: x-small;"><span id="gc7q2" style="color: #0000ff;"><span id="gc7q3" style="color: #000102;">Jul 30 17:36:15 www login(pam_unix)[11819]: session opened for user siteview by (uid=0)</span></span></span></span><br id="nic2" />
<span id="gc7q4" class="694285000-26022007"><span id="gc7q5" style="font-size: x-small;"><span id="gc7q6" style="color: #0000ff;"><span id="gc7q7" style="color: #000102;">Jul 30 17:36:15 www  -- siteview[11819]: LOGIN ON pts/0 BY siteview FROM 192.168.168.42</span></span></span></span><br id="nic20" />
<span id="gc7q8" class="694285000-26022007"><span id="gc7q9" style="font-size: x-small;"><span id="gc7q10" style="color: #0000ff;"><span id="gc7q11" style="color: #000102;">Jul 30 17:36:15 www login(pam_unix)[11819]: session closed for user siteview</span></span></span></span><br id="nic21" />
<span id="gc7q12" class="694285000-26022007"><span id="gc7q13" style="font-size: x-small;"><span id="gc7q14" style="color: #0000ff;"><span id="gc7q15" style="color: #000102;">Jul 30 17:47:17 www syslogd: /var/log/secure: No space left on device</span></span></span></span><br id="nic22" />
<span id="gc7q16" class="694285000-26022007"><span id="gc7q17" style="font-size: x-small;"><span id="gc7q18" style="color: #0000ff;"><span id="gc7q19" style="color: #000102;">Jul 30 19:11:58 www PAM-securetty[1611]: Couldn't open /etc/securetty</span></span></span></span></blockquote>
<span id="gc7q24" class="694285000-26022007"><span id="gc7q25" style="font-size: x-small;"><span id="gc7q26" style="color: #0000ff;"><span id="gc7q27" style="color: #000102;"> 经过查找发现其原因是</span></span></span></span><span id="hxwj" class="694285000-26022007"><span id="hxwj0" style="font-size: x-small;"><span id="hxwj1" style="color: #0000ff;"><span id="hxwj2" style="color: #000102;">内核中开启的审核子系统LauS (Linux Auditing System)</span></span></span></span>写的日志太多，把/var空间占了，再次登陆的时候，由于无法写日志导致挂在那里，出现假死现象。<br id="xk7y" />
<br id="u4rh" />
<strong id="aosk0">解决方法：</strong><br id="u4rh0" />
定位到问题以后，就可以想办法解决了，目前可行的办法由四种，分别如下：<br id="aosk1" />
1、定期手工删除/var/log/audit.d下的日志文件
<blockquote id="gi-e">#删除7天前的<br id="g.lc" />
find ./ -mtime +7 -type f -exec rm {} \;</blockquote>
2、配置crob自动删除或者备份
<blockquote id="k1o-">SEVEN_DAYS_OLD=`/usr/locale/ebin/date '+%d' --date '7 days ago'`<br id="z.::0" />
if [ -f /var/log/audit/bin/bin.${SEVEN_DAYS_OLD} ]<br id="z.::1" />
then<br id="z.::2" />
rm /var/log/audit/bin.${SEVEN_DAYS_OLD}<br id="z.::3" />
fi</blockquote>
<br id="br8b0" />
3、修改/etc/audit/audit.conf配置文件<br id="dqa7" />
可以通过修改audit.conf来配置，让其自动处理<br id="lp.v" />
1）修改为自动删除的<span id="obd0" class="694285000-26022007"><span id="obd00" style="font-size: x-small;">：<br id="nesr" />
</span></span><span id="nesr0" style="color: #ff0000;">notify = "/usr/sbin/audbin -S /var/log/audit.d/save.%u -C -T 20% -N 'rm -f %f'";</span><br id="k:vm" />
<span id="v0-4" style="font-family: Verdana;">[</span><span id="k:vm0" style="font-family: Verdana;">The notify line as above should (according to the docs) remove old 'save' files when the filesystem comes within 20% of full (change the figure after -T to specify how close to full you want to start deleting old files).</span>]<br id="xxk3" />
<span id="nesr1" class="694285000-26022007"><span id="nesr2" style="font-size: x-small;"><br id="lp.v1" />
</span></span>2）修改为自动备份的：<span id="id2g3" class="694285000-26022007"><span id="id2g4" style="font-size: x-small;">（/backup 是另外您想保存数据的分区）</span></span>
<div id="id2g2" dir="ltr" align="left"><span id="bcaj" class="694285000-26022007"><span id="bcaj0" style="font-size: x-small;">notify = "/usr/sbin/audbin -S /var/log/audit.d/save.%u -C -T 20% -N 'mv %f /backup'"; <br id="c43d" />
<br id="c43d0" />
4、</span></span><span id="dron" style="font-size: x-small;"><span id="dron0" class="694285000-26022007"><span id="dron1" style="color: #0000ff;"><span id="dron2" style="color: #000102;">禁用audtid服务<br id="hl_h" />
如 果您不需要审核信息，禁用audtid服务 ("chkconfig --del auditd"),系统性能会有所提高. 如果想要彻底禁用内核中的audit，可以删除 /dev/audit文件，重新启动。以后可以通过在grub.conf 里kernel行最后加入audit=1来启用。<br id="hl_h0" />
</span></span></span></span></div>
<br id="wlzk" />
<br id="wlzk0" />
<strong>参考文档 :</strong>
<ul id="vh4e">
	<li id="vh4e0">lAus相关: http://blog.chinaunix.net/u/6303/showart_275806.html</li>
	<li id="vh4e1">console login hangs RHEL 3：http://www.linuxquestions.org/questions/linux-general-1/console-login-hangs-rhel-3-348072/</li>
	<li id="vh4e2">Linux Console Hangs：http://www.usenet-forums.com/linux-networking/68241-linux-console-hangs-2.html</li>
	<li id="d:3j">/目录空间不足,清理/var/log/audit.d：http://blog.zhangjianfeng.com/article/386</li>
</ul>
