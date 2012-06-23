---
layout: post
title: 再次遭遇乱码侵袭～
date: '2008-4-8'
comments: true
categories: Ruby&Rails
link: true
---
<p>经历了Java/Rails的乱码洗礼，经过Zip/RAR/7zip等等的搔扰，经过不懈的恶补，偶以为面对乱码问题可以应对自如了，然而不幸的是，这次又遇到了，下面看过程。</p>
<p><strong>问题现象：</strong></p>
<p><strong>1、</strong>在Rails中，上传本地的文件到服务器，服务器接收到以后，保存到服务器并记录其所在的路径，然后使用Rails中的 send_file来实现下载功能。我在本地开发环境上一切正常，但是在服务器上发生&ldquo;找不到文件&rdquo;的错误，SSH连进去看了下，原来保存在硬盘上时，中文文件名出现乱码，类似&ldquo;2008_03_25_07_54_27_娣樺疂瓒呯骇鐢ㄦ埛鎼滅储寮曟搸.rar&rdquo;这样的。</p>
<p><strong>2、</strong>在Rails中使用Ruby的File.new()、File.open()函数创建的文件，在硬盘上显示的中文名也是乱码。（这个人和我发现的问题类似：http://www.javaeye.com/topic/66371）</p>
<p><strong>问题分析及其定位：</strong></p>
<p>经过查找和分析，偶认为这与系统的字符集设置有关，因为在我本地开发机器上是可以正常显示和查看的，但是在服务器上就不可以，着重了解字符集的设置。</p>
<p><strong>分析过程：</strong></p>
<p>1、先看看系统</p>
<p>1sters@IceskYsl:~$ uname -a<br />
Linux 1sters 2.6.18-xen #1 SMP Fri Nov 2 06:14:54 UTC 2007 x86_64 GNU/Linux</p>
<p>恩，是linux的系统。</p>
<p>2、再看看目前的字符集</p>
<p>1sters@IceskYsl:~$ locale<br />
LANG=<br />
LC_CTYPE=&quot;POSIX&quot;<br />
LC_NUMERIC=&quot;POSIX&quot;<br />
LC_TIME=&quot;POSIX&quot;<br />
LC_COLLATE=&quot;POSIX&quot;<br />
LC_MONETARY=&quot;POSIX&quot;<br />
LC_MESSAGES=&quot;POSIX&quot;<br />
LC_PAPER=&quot;POSIX&quot;<br />
LC_NAME=&quot;POSIX&quot;<br />
LC_ADDRESS=&quot;POSIX&quot;<br />
LC_TELEPHONE=&quot;POSIX&quot;<br />
LC_MEASUREMENT=&quot;POSIX&quot;<br />
LC_IDENTIFICATION=&quot;POSIX&quot;<br />
LC_ALL=</p>
<p>这是默认的POSIX。</p>
<p>3、查看下系统支持的字符集</p>
<p>locale -a</p>
<p><strong>修改方法：</strong></p>
<p>在/etc/bashrc中加入<br />
export LC_ALL=&quot;zh_CN.utf8&quot;<br />
export LANG=&quot;zh_CN.utf8&quot;<br />
系统默认的locale变成了zh_CN.utf8</p>
<p><strong>参考资料：</strong></p>
<p>1、如何更改普通用户的locale？？http://linux.chinaunix.net/bbs/viewthread.php?tid=715236<br />
2、更改默认locale http://blog.chinaunix.net/u/22117/showart_257343.html<br />
3、关于locale的设定 http://blog.csdn.net/whoopee/archive/2006/09/28/1299891.aspx</p>
