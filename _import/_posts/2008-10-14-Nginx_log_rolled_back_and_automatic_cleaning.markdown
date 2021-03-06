---
layout: post
title: Nginx日志回滚和自动清理
date: '2008-10-14'
comments: true
categories: Mac&*UNIX
tags: nginx
link: true
---
当网站访问量大到一定程度后，其web server会有大量的访问和错误日志，比如apache，nginx等就常常很容易的达到几个G的日志文件，这个时候就会导致诸如磁盘空间紧张，系统反应迟钝等等系列的问题，需要手工清理日志。

其实我们可以采取一些方法使得其日志自动回滚和删除，这里大概说说，后续再补充。

<strong>1、Nginx Log Rotation</strong>

Nginx有个<a href="http://wiki.codemongers.com/NginxLogRotation">Log Rotation</a>模块，nginx will re-open it's logs in response to the USR1 signal.参考如下脚本：
{% codeblock %}$ mv access.log access.log.0$ kill -USR1 `cat master.nginx.pid`$ sleep 1$ gzip access.log.0    # do something with access.log.0

<strong>2、自己写脚本</strong><span class="com">#!/bin/sh</span><span class="pln">log_dir</span><span class="pun">=</span><span class="str">"/var/log/httpd"</span><span class="pln">yesterday</span><span class="pun">=</span><span class="str">`date +%Y%m%d -d '-1 day'`</span><span class="pln">lastday </span><span class="pun">=</span><span class="str">`date +%Y%m%d -d '-1 month'`</span><span class="pun">/</span><span class="pln">bin</span><span class="pun">/</span><span class="pln">rm $</span><span class="pun">{</span><span class="pln">log_dir</span><span class="pun">}/</span><span class="pln">access</span><span class="pun">.</span><span class="pln">$</span><span class="pun">{</span><span class="pln">lastday</span><span class="pun">}.</span><span class="pln">log</span><span class="pun">/</span><span class="pln">bin</span><span class="pun">/</span><span class="pln">rm $</span><span class="pun">{</span><span class="pln">log_dir</span><span class="pun">}/</span><span class="pln">error</span><span class="pun">.</span><span class="pln">$</span><span class="pun">{</span><span class="pln">lastday</span><span class="pun">}.</span><span class="pln">log</span><span class="pun">/</span><span class="pln">bin</span><span class="pun">/</span><span class="pln">mv $</span><span class="pun">{</span><span class="pln">log_dir</span><span class="pun">}/</span><span class="pln">access</span><span class="pun">.</span><span class="pln">log $</span><span class="pun">{</span><span class="pln">log_dir</span><span class="pun">}/</span><span class="pln">access</span><span class="pun">.</span><span class="pln">$</span><span class="pun">{</span><span class="pln">yesterday</span><span class="pun">}.</span><span class="pln">log</span><span class="pun">/</span><span class="pln">bin</span><span class="pun">/</span><span class="pln">mv $</span><span class="pun">{</span><span class="pln">log_dir</span><span class="pun">}/</span><span class="pln">error</span><span class="pun">.</span><span class="pln">log $</span><span class="pun">{</span><span class="pln">log_dir</span><span class="pun">}/</span><span class="pln">error</span><span class="pun">.</span><span class="pln">$</span><span class="pun">{</span><span class="pln">yesterday</span><span class="pun">}.</span><span class="pln">logkill </span><span class="pun">-</span><span class="pln">USR1 </span><span class="str">`cat /var/run/nginx.pid`</span><span class="pun">/</span><span class="pln">bin</span><span class="pun">/</span><span class="pln">gzip $</span><span class="pun">{</span><span class="pln">log_dir</span><span class="pun">}/</span><span class="pln">access</span><span class="pun">.</span><span class="pln">$</span><span class="pun">{</span><span class="pln">yesterday</span><span class="pun">}.</span><span class="pln">log </span><span class="pun">&amp;</span><span class="pun">/</span><span class="pln">bin</span><span class="pun">/</span><span class="pln">gzip $</span><span class="pun">{</span><span class="pln">log_dir</span><span class="pun">}/</span><span class="pln">error</span><span class="pun">.</span><span class="pln">$</span><span class="pun">{</span><span class="pln">yesterday</span><span class="pun">}.</span><span class="pln">log </span><span class="pun">&amp;</span>本脚本来自“<a href="http://shunz.net/2008/07/nginx_log_rotation.html">Nginx的日志回滚</a>”然后将该脚本保存在/etc/cron.daily目录里，或者在crontab里每日0点时运行。另外，还可以结合awstats进行日志分析，这里就不详细说了，可以参考<a href="http://www.chedong.com/tech/awstats.html" target="_blank">车东的相关文章</a>。{% endcodeblock %}
<p class="line874"><strong>其他参考文档：</strong></p>

<ol>
	<li><a href="http://dev.weamax.com/docs/books/log_process/log_process.html">日志分割文档</a></li>
	<li><a href="http://forum.eedu.org.cn/post/view?bid=39&amp;id=62772">Apache和Resin产生大容量日志的解决办法 </a></li>
	<li><a href="http://shunz.net/2008/07/nginx_log_rotation.html">Nginx的日志回滚</a></li>
</ol>
<p class="line874"></p>
