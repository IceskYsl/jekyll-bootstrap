---
layout: post
title: linux之rm命令详解
date: '2008-2-20'
comments: true
categories: Ruby&Rails
link: true
---
<p>[1sters@ iceskysl]$ rm --help<br />
<strong>用法：</strong>rm [选项]... 目录...<br />
删除指定的&lt;文件&gt;(即解除链接)。<br />
<br />
&nbsp; -d, --directory&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 删除可能仍有数据的目录 (只限超级用户)<br />
&nbsp; -f, --force&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 略过不存在的文件，不显示任何信息<br />
&nbsp; -i, --interactive&nbsp;&nbsp;&nbsp;&nbsp; 进行任何删除操作前必须先确认<br />
&nbsp; -r, -R, --recursive&nbsp;&nbsp; 同时删除该目录下的所有目录层<br />
<strong>&nbsp; -v, --verbose&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 详细显示进行的步骤</strong><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --help&nbsp;&nbsp;&nbsp;&nbsp; 显示此帮助信息并离开<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --version&nbsp; 显示版本信息并离开<br />
<br />
要删除第一个字符为&lsquo;-&rsquo;的文件 (例如&lsquo;-foo&rsquo;)，请使用以下其中一种方法：<br />
&nbsp; rm -- -foo<br />
<br />
&nbsp; rm ./-foo<br />
<br />
请注意，如果使用 rm 来删除文件，通常仍可以将该文件恢复原状。如果想保证<br />
该文件的内容无法还原，请考虑使用 shred。</p>
<p><strong>范例：</strong></p>
<p>删除所有rb语言程序档；删除前逐一询问确认 :<br />
rm -i *.rb<br />
<br />
将 Finished 子目录及子目录中所有档案删除 :<br />
rm -r Finished</p>
