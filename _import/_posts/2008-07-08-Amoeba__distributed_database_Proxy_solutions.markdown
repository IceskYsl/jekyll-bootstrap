---
layout: post
title: Amoeba:分布式数据库Proxy解决方案
date: '2008-7-8'
comments: true
categories: Database
link: true
---
<strong>Amoeba</strong> 座落与Client、Database Server(s)之间。 具有负载均衡、高可用性、sql过滤、可承受高并发、读写分离、Query Route（解析sql query语句，并且根据条件与预先设定的规则，请求到指定的目标数据库。可并发请求多台数据库合并结果）、对客户端透明。
主要降低 数据切分带来的复杂多数据库结构、数据切分规则 给应用带来的影响，能够轻易实现:
<ul>
	<li>读写分离</li>
	<li>Failover</li>
	<li>负载均衡</li>
	<li>数据切分</li>
</ul>
这个和<span class="hilite2"><span class="hilite2">mysql</span></span> proxy是有一些差别的，按照其作者的说法为：“在 <span class="hilite2"><span class="hilite2">mysql</span></span> proxy 上面如果想要读写分离并且 读集群、写集群 机器比较多情况下，用<span class="hilite2"><span class="hilite2">mysql</span></span> proxy 需要相当大的工作量，目前<span class="hilite2"><span class="hilite2">mysql</span></span> proxy没有现成的 lua脚本。<span class="hilite2"><span class="hilite2">mysql</span></span> proxy根本没有配置文件，lua脚本就是它的全部，当然可以是相当方便的。那么同样这种东西需要编写大量的lua脚本才能完成一个复杂的配置“

按照其说明文档中的”<a href="http://amoeba.sourceforge.net/amoeba.pdf">Amoeba:分布式数据库Proxy解决</a>“说法，其主要也就扮演proxy的角色，目前已经发布了对mysql的proxy功能，其主要是为了支持分布式的DB系统，从读写、数据切分几个方面，来做到负载均衡并伴有故障转移等功能。

想法好似很好的，但是其文件http://www.sourceforge.net/projects/<span class="hilite1"><span class="hilite1">amoeba我现在无法下载，没时间尝试，有时间可以再试试。</span></span>

<strong><span class="hilite1"><span class="hilite1">参考文档：</span></span></strong>

<span class="hilite1"><span class="hilite1">1、http://www.javaeye.com/topic/188598
</span></span>

&nbsp;
