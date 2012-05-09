--- 
layout: post
comments: true
title: "Thin: A fast and very simple Ruby web server"
date: 2008-8-28
link: false
categories: life
---
知道<a href="http://code.macournoyer.com/thin/">Thin</a>这个东西很久了，记忆中的还是下面这张和mongrel的性能比较图片，但是一直没深入进去了解其到底如何。
<img src="http://chart.apis.google.com/chart?cht=bvg&amp;chd=t:14.98,54.8723076923077,48.9184615384615,79.9276923076923|14.8692307692308,65.0615384615385,70.4446153846154,89.5553846153846|14.9476923076923,35.1123076923077,70.18,88.6769230769231&amp;chbh=16&amp;chs=350x150&amp;chl=WEBrick|Mongrel|Evented%20M.|Thin&amp;chco=000000,666666,cccccc&amp;chdl=1%20c%20req.|10%20c%20req.|100%20c%20req." alt="" />
从图上可以看到，除了<strong>总体性能</strong>好于mongrel以外，最大的区别在于其在<strong><span style="color: #ff0000;">100个并发</span></strong>的时候还能保证高性能，而100个并发的时候mongrel的性能非常差（且消耗很多的资源，经常由此导致请求无法处理，而出现503）。
今天花了点时间，把Thin从头到尾的看了一遍，然后连到一个服务器上试验了下，总体感觉如下：
<ul>
	<li>安装方便，和mongrel差不多，一条命令就搞定；如果你需要还可以install到init下；</li>
	<li>使用方便，嫌麻烦的直接thin start就OK了；</li>
	<li>配置丰富，提供了很多可以配置的东西，比如max-conns，max-persistent-conns等;</li>
	<li>可以集群，也非常方便，指定开始端口和实例的个数；</li>
	<li>支持写配置文件，配置文件可以修改，重载。</li>
	<li>支持做backend，前置nginx，配置和mongrel差不多。</li>
	<li>可以走UNIX domain sockets；</li>
	<li>节省资源，提供性能</li>
</ul>
使用过程大概如下，详细的参考资料：
1、安装
sudo gem install thin
2、启动测试
cd to/your/rails/app
thin start
3、配置集群
thin config -C 1sters.yml -s2 -p 7000
4、启动
thin start -C 1sters.yml

<strong>参考资料：</strong>
<ul>
	<li>http://code.macournoyer.com/thin/</li>
	<li>http://articles.slicehost.com/2008/5/27/ubuntu-hardy-nginx-rails-and-thin</li>
	<li>http://articles.slicehost.com/2008/5/6/ubuntu-hardy-thin-web-server-for-ruby</li>
</ul>
