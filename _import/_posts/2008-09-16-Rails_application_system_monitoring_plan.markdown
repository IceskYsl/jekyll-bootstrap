---
layout: post
title: Rails应用系统的监控规划
date: '2008-9-16'
comments: true
categories: Ruby&Rails
link: true
---
每个系统都得有相应的监控措施，你总不想每天都呆在电脑旁，时刻的去刷新页面、检测系统状态，服务器状态，业务状态吧；你总不想天天扛着电脑，时刻准备着上去重启死掉的进程等待吧。
我们需要一套完备的监控措施，针对熟悉的Rails系统，可以把监控划分为如下几个方面的：
<strong>1、关键进程监控</strong>
该类监控配置监控关键的进程，比如app server的进程，数据库进程等等，配置后可以自动监视相关进程，当某个情况发生时（比如内存耗尽等），自动重启进程，以保证系统正常运行。在Rails应用中，可以做这个事情的有monit，God等。
<strong>2、服务器资源监控</strong>
该类监控系统的资源使用情况，比如内存或者CPU使用率等等，当出现一些情况的时候（比如内存消耗超过90%，CPU消耗100%等）发出告警信息（Email告警，SMS告警等），可以做这个事情的有很多，比如siteview，Scout等。
<strong>3、应用异常告警</strong>
当出现500等应用内部异常的时候，发出告警，并附带相关的堆栈信息，以便以开发人员迅速定位问题，解决问题，可以做这个事情的有Exception Notification plugin.等。

除了这些外，我想还可以做的事一些监控统计信息，比如可以写脚本统计nginx的连接数，Haproxy的统计等。

参考：
http://blog.scoutapp.com/articles/2008/09/09/rails-monitoring-pillars
