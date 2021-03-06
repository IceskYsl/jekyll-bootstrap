---
layout: post
title: ulimit:修改和检查文件句柄数限制
date: '2008-8-19'
comments: true
categories: Mac&*UNIX
link: true
---
在Linux下面部署应用的时候，有时候会遇上<em>Socket/File: Can’t open so many files</em>的问题，其实Linux是有文件句柄限制的，而且默认不是很高，一般都是1024，作为一台生产服务器，其实很容易就达到这个数量，因此我们需 要把这个值改大一些。

我们可以用<strong>ulimit -a</strong>来查看所有限制值，我只关心文件句柄数量的问题
<strong>open files (-n) 1024</strong>
这个就是限制数量 ，其指的是当前用户准备要运行的程序的限制。比较推荐的修改方法是：

正确的做法，应该是修改<strong>/etc/security/limits.conf</strong>
里面有很详细的注释，比如
* soft nofile 2048
* hard nofile 32768

<strong>检查：</strong>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="comment">#check file descriptor</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>echo  </span></li>
	<li><span>echo <span class="string">"-----------------------------------------------"</span><span>  </span></span></li>
	<li class="alt"><span>echo <span class="string">"Begin to check the file descriptor limit"</span><span>  </span></span></li>
	<li><span>fd=`ulimit -n`  </span></li>
	<li class="alt"><span><span class="keyword">if</span><span> [ </span><span class="variable">$fd</span><span> -lt 8192 ];  </span></span></li>
	<li><span>   <span class="keyword">then</span><span>  </span></span></li>
	<li class="alt"><span>   echo <span class="string">"Fatal Error!"</span><span>  </span></span></li>
	<li><span>   echo <span class="string">"The file descriptor limit is only '"</span><span class="variable">$fd</span><span class="string">"'!"</span><span>  </span></span></li>
	<li class="alt"><span>   echo <span class="string">"Please make it more than 8192!"</span><span>  </span></span></li>
	<li><span>   exit  </span></li>
	<li class="alt"><span>fi  </span></li>
	<li><span>echo <span class="string">"OK, the file descriptor limit is"</span><span> </span><span class="variable">$fd</span><span>  </span></span></li>
	<li class="alt"><span>echo <span class="string">"-----------------------------------------------"</span><span>  </span></span></li>
	<li><span>echo  </span></li>
	<li class="alt"><span>echo
</span></li>
</ol>
</div>
<strong>参考文章：</strong>
http://blog.chinaunix.net/u2/64804/showart_1019246.html
http://hi.baidu.com/leshy/blog/item/f57f4a903fb0898ea877a452.html
