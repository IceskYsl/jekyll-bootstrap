---
layout: post
title: lunix操作技巧(二):系统负载情况估算相关
date: '2007-11-9'
comments: true
categories: Ruby&Rails
link: true
---
<p><strong>--显示Linux内核版本号</strong><br />
[root@CentOS4 ~]# uname -a<br />
Linux CentOS4.5 2.6.9-55.ELsmp #1 SMP Wed May 2 14:28:44 EDT 2007 i686 i686 i386 GNU/Linux<br />
语　　法：uname [-amnrsv][--help][--version]<br />
补充说明：uname可显示电脑以及操作系统的相关信息。<br />
参　　数：<br />
-a或--all 　显示全部的信息。<br />
-m或--machine 　显示电脑类型。<br />
-n或-nodename 　显示在网络上的主机名称。<br />
-r或--release 　显示操作系统的发行编号。<br />
-s或--sysname 　显示操作系统名称。<br />
-V 　显示操作系统的版本。<br />
--help 　显示帮助。<br />
--version 　显示版本信息。</p>
<p><strong>--查看Linux内存使用情况</strong><br />
[root@CentOS4 ~]# free<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; total&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; used&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free&nbsp;&nbsp;&nbsp;&nbsp; shared&nbsp;&nbsp;&nbsp; buffers&nbsp;&nbsp;&nbsp;&nbsp; cached<br />
Mem:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1034584&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 71752&nbsp;&nbsp;&nbsp;&nbsp; 962832&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3740&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 35260<br />
-/+ buffers/cache:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32752&nbsp;&nbsp;&nbsp; 1001832<br />
Swap:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1052248&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 1052248<br />
<br />
<br />
语　　法： free [-bkmotV][-s &lt;间隔秒数&gt;]<br />
&nbsp;free指令会显示内存的使用情况，包括实体内存，虚拟的交换文件内存，共享内存区段，以及系统核心使用的缓冲区等。<br />
参　　数：<br />
-b 　以Byte为单位显示内存使用情况。<br />
-k 　以KB为单位显示内存使用情况。<br />
-m 　以MB为单位显示内存使用情况。<br />
-o 　不显示缓冲区调节列。<br />
-s&lt;间隔秒数&gt; 　持续观察内存使用状况。<br />
-t 　显示内存总和列。<br />
-V 　显示版本信息。<br />
如MB为单位显示内存使用情况：<br />
[root@CentOS4 ~]# free -m<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; total&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; used&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free&nbsp;&nbsp;&nbsp;&nbsp; shared&nbsp;&nbsp;&nbsp; buffers&nbsp;&nbsp;&nbsp;&nbsp; cached<br />
Mem:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1010&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 70&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 940&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 34<br />
-/+ buffers/cache:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 31&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 978<br />
Swap:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1027&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1027</p>
<p><em><strong>附录：free的详细解释：</strong></em></p>
<p>[root@Linux /tmp]# free<br />
&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; total&nbsp; &nbsp;&nbsp; &nbsp; used&nbsp; &nbsp;&nbsp; &nbsp; free&nbsp; &nbsp;&nbsp;&nbsp;shared&nbsp; &nbsp; buffers&nbsp; &nbsp;&nbsp;&nbsp;cached<br />
Mem:&nbsp; &nbsp;&nbsp; &nbsp; 4149156&nbsp; &nbsp; 4130412&nbsp; &nbsp;&nbsp; &nbsp;18744&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; 0&nbsp; &nbsp;&nbsp; &nbsp;13220&nbsp; &nbsp; 2720160<br />
-/+ buffers/cache:&nbsp; &nbsp; 1397032&nbsp; &nbsp; 2752124<br />
Swap:&nbsp; &nbsp;&nbsp; &nbsp;6289408&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;144&nbsp; &nbsp; 6289264第1行<br />
total 内存总数: 4149156<br />
used 已经使用的内存数: 4130412<br />
free 空闲的内存数: 18744<br />
shared 当前已经废弃不用，总是0<br />
buffers Buffer Cache内存数: 13220<br />
cached Page Cache内存数: 2720160<br />
<br />
关系：total = used + free<br />
<br />
第2行：<br />
-/+ buffers/cache的意思相当于：<br />
-buffers/cache 的内存数：1397032 (等于第1行的 used - buffers - cached)<br />
+buffers/cache 的内存数: 2752124 (等于第1行的 free + buffers + cached)<br />
<br />
可见-buffers/cache反映的是被程序实实在在吃掉的内存，而+buffers/cache反映的是可以挪用的内存总数。<br />
<br />
第三行单独针对交换分区, 就不用再说了.<br />
<br />
为了提高磁盘存取效率, Linux做了一些精心的设计, 除了对dentry进行缓存(用于VFS,加速文件路径名到inode的转换), 还采取了两种主要Cache方式：Buffer Cache和Page Cache。前者针对磁盘块的读写，后者针对文件inode的读写。这些Cache有效缩短了 I/O系统调用(比如read,write,getdents)的时间。<br />
<br />
如果感兴趣可以进一步参考文件/proc/meminfo，free命令就是根据它的信息生成的。free命令的源码可从procps-xxx-.src.rpm获取，xxx为版本号，比如procps-3.2.3-5.3.src.rpm。<br />
<br />
参考内核代码：<br />
<br />
arch/i386/mm/init.c<br />
fs/proc/proc_misc.c<br />
include/linux/swap.h<br />
mm/filemap.c<br />
fs/buffer.c<br />
<br />
另外还可以参考O'REILLY的书《Understanding the LINUX KERNEL》。</p>
