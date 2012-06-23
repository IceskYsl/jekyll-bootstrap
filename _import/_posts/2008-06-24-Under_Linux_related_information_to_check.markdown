---
layout: post
title: linux下相关信息查看
date: '2008-6-24'
comments: true
categories: Mac&*UNIX
tags: linux
link: true
---
有的时候需要对服务器信息做比较详细的了解，需要查看一些信息，整理如下：

<strong>1、Java版本（JDK）</strong>

<span>$ java -version
<strong>java version "1.4.2_11"</strong>
Java(TM) 2 Runtime Environment, Standard Edition (build 1.4.2_11-b06)
Java HotSpot(TM) Client VM (build 1.4.2_11-b06, mixed mode)</span>

<strong><span>2、weblogic版本</span></strong>

<span>查看weblogic的版本信息，可以在bea\logs目录下的log.txt中查到版本信息，如下：</span>

<span>$ </span><span>cat log.txt
2004-10-20 15:00:58 -- install "WebLogic Platform" 8.1.3.0 at /opt/bea/weblogic81
release 8.1.3.0 [Added]</span>

<strong><span>3、Oracle版本</span></strong>

<span>（1）用客户端连接到数据库，执行select * from v$instance查看version项
（2）select * from product_component_version
（3）或查询V$VERSION查看组件级信息</span>

<strong><span>4、内核</span></strong>
<div><em><span>$ </span></em><span><em>uname -a</em>
Linux oj-web03 2.4.21-27.ELsmp #1 SMP Wed Dec 1 21:59:02 EST 2004 i686 i686 i386 GNU/Linux</span></div>
<div><span><span>[iceskysl@oj-web03 logs]$ cat /proc/version
Linux version 2.4.21-27.ELsmp (<a href="mailto:bhcompile@bugs.build.redhat.com">bhcompile@bugs.build.redhat.com</a>) (gcc version 3.2.3 20030502 (Red Hat Linux 3.2.3-47)) #1 SMP Wed Dec 1 21:59:02 EST 2004</span></span><strong>5、内存信息</strong><span><span>$ cat /proc/meminfo
$ free -M</span></span><strong>6、CPU信息</strong><span>$</span><span>cat /proc/cpuinfo</span><strong>7、硬盘信息</strong>
<span>$</span>df

</div>
