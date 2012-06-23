---
layout: post
title: 在Rails多个应用中共享数据库
date: '2008-5-14'
comments: true
categories: Ruby&Rails
link: true
---
<p>如果你现在是这样的：</p>
<p>&nbsp;</p>
<p><img src="http://railsfreaks.com/assets/2008/5/3/before_uses_connection.png" alt="" /></p>
<p>但是想做成这样的：</p>
<p><img src="http://railsfreaks.com/assets/2008/5/3/after_uses_connection.png" alt="" /></p>
<p>估计没有类似需求的人是看不明白的，如果有类似需求或者遇到类似问题的，一看到这个标题就能明白我要说的是什么，对，就是在多个Rails应用之间共享一个数据库。</p>
<p>用什么？自然是选择插件了，刚刚看到有人放出了这样的插件uses_connection Rails plugin，<a href="http://github.com/railsfreaks/uses_connection/tree/master">代码在Github</a>上，有篇介绍的文章（<a href="http://railsfreaks.com/2008/5/2/introducing-the-uses_connection-rails-plugin">Introducing the &quot;uses_connection&quot; Rails plugin</a>）在railsfreaks上，bdl7x也发了一篇简单的介绍《<a href="http://chinaonrails.com/topic/view/1618.html">不同程序同一个数据库连接-插件uses_connection</a>》，在chinaonrails上。看这些，应该就可以明白这个插件是做啥的了。</p>
<p>这里说下可能存在的应用场景，你有一套系统对外提供服务，比如说是个新闻发布系统，您需要及时的抓取内容或者发布新的内容，以保证这个新闻系统的及时性，但是在一台主机上操作会比较耗费资源，这个时候，你可以开发几个后端发布系统，分开部署，共享这套数据库，然后就可以使用后端系统轻松发布、增加新的内容到数据库，然后前端输出就可以源源不断了。</p>
<p>这个例子可能不是很清晰，但是我相信有类似需求的人一看就明白这样做的好处，我就不多说了。</p>
