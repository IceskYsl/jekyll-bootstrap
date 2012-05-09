--- 
layout: post
comments: true
title: "Unicorn: Rack HTTP server for fast clients and Unix"
date: "2009-10-11"
link: false
categories: life
---
<a href="http://images-2.redbubble.com/img/clothing/bodycolor:white/size:medium/style:mens/view:main/76841-16-the-wrong-unicorn-t-shirt.jpg"><img class="alignnone" title="unicorn" src="http://images-2.redbubble.com/img/clothing/bodycolor:white/size:medium/style:mens/view:main/76841-16-the-wrong-unicorn-t-shirt.jpg" alt="" width="300" height="300" /></a>

<a style="color: #006699; text-decoration: underline;" href="http://unicorn.bogomips.org/" target="_blank">Unicorn</a>是一个几乎使用纯Ruby编写的HTTP server，主要用于Rack应用。Unicon的创建作者是Eric Wong，它基于Mongrel（包括Ragel/C HTTP分析器），采用同样的许可-Ruby license和GPL2，但对Mongrel进行了改良。
<ul style="margin-top: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; padding: 0px;">
	<li style="margin-top: 0px; margin-right: 0px; margin-bottom: 0.25em; margin-left: 30px; padding: 0px;">Unicorn设计的初衷是为了Rack，Unix，更快的客户端，易于调试等；</li>
	<li style="margin-top: 0px; margin-right: 0px; margin-bottom: 0.25em; margin-left: 30px; padding: 0px;">很好的兼容了Ruby 1.8和Ruby 1.9，并且对Rubinius的支持也在计划之内；</li>
	<li style="margin-top: 0px; margin-right: 0px; margin-bottom: 0.25em; margin-left: 30px; padding: 0px;">流程管理： Unicorn会重新启动出错的应用。你无需管理多个进程或端口，Unicorn可以管理任意数量的进程；</li>
	<li style="margin-top: 0px; margin-right: 0px; margin-bottom: 0.25em; margin-left: 30px; padding: 0px;">负载平衡：完全使用操作系统内核；</li>
	<li style="margin-top: 0px; margin-right: 0px; margin-bottom: 0.25em; margin-left: 30px; padding: 0px;">支持所有Rack应用；</li>
	<li style="margin-top: 0px; margin-right: 0px; margin-bottom: 0.25em; margin-left: 30px; padding: 0px;">简单方面的Ruby DSL配置；</li>
	<li style="margin-top: 0px; margin-right: 0px; margin-bottom: 0.25em; margin-left: 30px; padding: 0px;">……</li>
</ul>
<p style="padding: 0px; margin: 0px;"><strong style="font-weight: bold;">点击阅读详情：
</strong>

<strong style="font-weight: bold;">
<ul style="margin-top: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; padding: 0px;">
	<li style="margin-top: 0px; margin-right: 0px; margin-bottom: 0.25em; margin-left: 30px; padding: 0px;"><a style="color: #006699; text-decoration: underline;" href="http://www.tomayko.com/writings/unicorn-is-unix" target="_blank">I like Unicorn because it's Unix</a></li>
	<li style="margin-top: 0px; margin-right: 0px; margin-bottom: 0.25em; margin-left: 30px; padding: 0px;"><a style="color: #006699; text-decoration: underline;" href="http://www.snowgiraffe.com/tech/483/railsconf-powered-by-unicorns/" target="_blank">RailsConf 2009: powered by OMG UNICORNS!!!!</a></li>
</ul>
</strong>
