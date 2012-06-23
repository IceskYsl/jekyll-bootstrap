---
layout: post
title: NeverBlock到底有多快,对比测试说明问题
date: '2008-9-4'
comments: true
categories: Ruby&Rails
link: true
---
前面写过一篇《<a href="http://iceskysl.1sters.com/?action=show&amp;id=369&amp;page=1#cm409">NeverBlock: 非常值得期待的一组类库</a>》，其中说到了采用NeverBlock的non-blocking, concurrent机制，可以很大程度上提高mysql或者PostgreSQL的使用率，很多限度的提高性能。
但是没有给出具体的对比测试数据，今天看到有个哥们已经使用Thin，Rails和PostgreSQL做了一次对比测试，相关环境如下：
<div class="codeText">
<div class="codeHead">服务器配置</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span>1 - 1 Thin server, normal postgreSQL Adapter  </span></span></li>
	<li><span>2 - 2 Thin servers (behind nginx), normal postgreSQL Adapter  </span></li>
	<li class="alt"><span>3 - 4 Thin servers (behind nginx), normal postgreSQL Adapter  </span></li>
	<li><span>4 - 1 Thin server, neverblock postgreSQL Adapter  </span></li>
</ol>
</div>
<div class="codeText">
<div class="codeHead">压力配置</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span>1 - Very light  work load,  every 200 requests, one "select sleep(1)" would be issued  </span></span></li>
	<li><span>2 - Light work load,        every 100 requests, one "select sleep(1)" would be issued  </span></li>
	<li class="alt"><span>3 - Moderate work load,     every 50  requests, one "select sleep(1)" would be issued  </span></li>
	<li><span>4 - Heavy work load,        every 20  requests, one "select sleep(1)" would be issued  </span></li>
	<li class="alt"><span>5 - Very heavy work load,   every 10  requests, one "select sleep(1)" would be issued  </span></li>
</ol>
</div>
其结果对比如下：
<img src="http://www.espace.com.eg/assets/neverblock/images/charts/1.gif" alt="" />

再来一张并发量的对比测试：
<img src="http://www.espace.com.eg/assets/neverblock/images/charts/2.gif" alt="" />

接下来，，需要等待Ruby1.9和Rails2.2的到来，加上如上的测试对比，可以想象得到，Rails的性能会上很大一个台阶的。

<strong>参考文档：</strong>
<a href="http://oldmoe.blogspot.com/2008/09/building-never-blocking-rails-making.html">http://oldmoe.blogspot.com/2008/09/building-never-blocking-rails-making.html</a>
http://chinaonrails.com/topic/view/1974.html
