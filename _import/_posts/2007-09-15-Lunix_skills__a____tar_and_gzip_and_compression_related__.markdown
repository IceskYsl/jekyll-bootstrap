---
layout: post
title: lunix操作技巧(一):tar和gzip及其压缩相关～
date: '2007-9-15'
comments: true
categories: Ruby&Rails
link: true
---
<p>老是忘记，干脆记下来好了～</p>
<p>最简提示：<br />
tar zxvf XXXX.tar.gz<br />
tar jxvf XXXX tar.bz2<br />
1.压缩一组文件为tar.gz后缀。<br />
# tar cvf backup.tar /etc #gzip -q backup.tar<br />
或<br />
# tar cvfz backup.tar.gz /etc/<br />
<br />
2.释放一个后缀为tar.gz的文件。<br />
#gunzip backup.tar.gz #tar xvf backup.tar<br />
或<br />
# tar xvfz backup.tar.gz<br />
<br />
3.用一个命令完成压缩<br />
#tar cvf - /etc/ | gzip -qc &gt; backup.tar.gz<br />
4.用一个命令完成释放<br />
# gunzip -c backup.tar.gz | tar xvf -<br />
<br />
5.如何解开tar.Z的文件？<br />
# tar xvfz backup.tar.Z 或 # uncompress backup.tar.Z #tar xvf backup.tar<br />
<br />
6.如何解开.tgz文件？<br />
#gunzip backup.tgz<br />
<br />
7.如何压缩和解压缩.bz2的包？<br />
#bzip2 /etc/smb.conf<br />
这将压缩文件smb.conf成smb.conf.bz2<br />
#bunzip2 /etc/smb.conf.bz2<br />
这将在当前目录下还原smb.conf.bz2为smb.conf<br />
<br />
(bzip2 -d也一样)<br />
注: .bz2压缩格式不是很常用，你可以man bzip2</p>
