---
layout: post
title: NEVERBLOCK支持Ruby1.8,性能对比测试,提升非常显著
date: '2008-9-6'
comments: true
categories: Ruby&Rails
link: true
---
前面有篇文章介绍了NeverBlock，其一篇是<a href="http://iceskysl.1sters.com/?action=show&amp;id=369">关于NeverBlock 原理介绍</a>的，另外一篇是<a href="http://iceskysl.1sters.com/?action=show&amp;id=380">在ruby1.9下做的对比测</a>试，当时我们说：接下来，，需要等待Ruby1.9和Rails2.2的到来，加上如上的测试对比，可以想象得到，Rails的性能会上很大一个台阶的。现在有个好消息是，NeverBlock支持了Ruby1.8（通过一些手法），这次看到其更新的特性如下：
<ul>
	<li>   NeverBlock now supports Ruby1.8.</li>
	<li>   NeverBlock support for Thin and Mongrel servers.</li>
	<li>   NeverBlock now supports Ruby on Rails.on</li>
</ul>
也就是说，现在NeverBlock支持Ruby1.8，支持Thin和mongrel服务器，另外支持Rails，测试方法很简单：
<strong>1、安装需要的额外的系统类库</strong>
<div class="codeText">
<div class="codeHead">Shell代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>apt-get install libmysql++-dev
</span></span></li>
</ol>
</div>
<strong>2、安装需要的gems</strong>
下载这几个包，<span style="color: #ff0000;"><span class="Apple-style-span" style="border-collapse: separate; color: #ffffff; font-family: Arial; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;"><span style="color: #339966;">NeverBlock (<a style="outline-width: 0px; cursor: pointer; color: #ffffff;" href="http://github.com/espace/neverblock/zipball/master">zip</a>|<a style="outline-width: 0px; cursor: pointer; color: #ffffff;" href="http://github.com/espace/neverblock/tarball/master">tar.gz</a>), Mysqlplus (<a style="outline-width: 0px; cursor: pointer; color: #ffffff;" href="http://github.com/espace/mysqlplus/zipball/master">zip</a>|<a style="outline-width: 0px; cursor: pointer; color: #ffffff;" href="http://github.com/espace/mysqlplus/tarball/master">tar.gz</a>), EventMachine (<a style="outline-width: 0px; cursor: pointer; color: #ffffff;" href="http://github.com/espace/eventmachine/zipball/master">zip</a>|<a style="outline-width: 0px; cursor: pointer; color: #ffffff;" href="http://github.com/espace/eventmachine/tarball/master">tar.gz</a></span>)</span></span>，
然后解压各自包；tar -zxvf (respective file name).tar.gz
然后CD到各自目录中build成gem；gem build (respective file name).gemspec
最后gen install；gem install (generated file name).gem
<strong>3、修改environment.rb</strong>
require 'never_block/frameworks/rails'
require 'never_block/servers/thin'（如果是mongrel，则require 'never_block/servers/mongrel'）
<strong>4、修改database.yml</strong>
adapter: neverblock_mysql （如果是postgresql，则为 adapter: neverblock_postgresql ）
connections: 12 # will spawn 12 connections instead of the defualt 4 #连接数
<strong>5、重启thin（mongrel即可）</strong>

以上步骤没有问题，我已经测试过了。

<strong>下面附几个别人做的对比测试：</strong>
<div class="codeText">
<div class="codeHead">测试环境如下：</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span>Rails 2.1  </span></span></li>
	<li><span>Thin 0.82  </span></li>
	<li class="alt"><span>Ruby 1.8.6  </span></li>
	<li><span>MySQL 5.0  </span></li>
	<li class="alt"><span>A special build of EventMachine 0.12  </span></li>
</ol>
</div>
<div class="codeText">
<div class="codeHead">系统负载构造：</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span>1 - Moderate work load,    one slow request for every 050 requests  </span></span></li>
	<li><span>2 - Heavy work load,       one slow request for every 020 requests  </span></li>
	<li class="alt"><span>3 - Very heavy work load,  one slow request for every 010 requests
</span></li>
</ol>
</div>
<strong>结果如下：</strong>

Rails Performance (Thin Vs.NeverBlock::Thin)

<img src="http://www.espace.com.eg/assets/neverblock/images/charts/8.gif" alt="" />

NeverBlock::Thin scaling

<img src="http://www.espace.com.eg/assets/neverblock/images/charts/10.gif" alt="" />

Memory Consumption (Thin Vs. NeverBlock::Thin)

<img src="http://www.espace.com.eg/assets/neverblock/images/charts/11.gif" alt="" />

&nbsp;

PS：刚刚发布的时候存在一个find_by_sql的bug，现在已经修复了。

<strong>参考文档：</strong>

<a href="http://www.espace.com.eg/neverblock/blog/2008/09/04/neverblock-instant-scaling-for-your-rails-apps/">http://www.espace.com.eg/neverblock/blog/2008/09/04/neverblock-instant-scaling-for-your-rails-apps/</a>

<a href="http://chinaonrails.com/topic/view/2123.html">http://chinaonrails.com/topic/view/2123.html</a>
