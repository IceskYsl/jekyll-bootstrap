---
layout: post
title: 纯CSS实现圆角效果
date: '2007-5-20'
comments: true
categories: Tips
link: true
---
以前都是用背景图片来实现的,需要先切割好图片,很不方便,现在参考老外的一个做法,用纯CSS就可以实现这个效果,比起图片来,自然漂亮的多,下面是实现代码:&lt;style type=&quot;text/css&quot;&gt;#xsnazzy h1, #xsnazzy h2, #xsnazzy p {margin:0 10px; letter-spacing:1px;}#xsnazzy h1 {font-size:2.5em; color:#fff;}#xsnazzy h2 {font-size:2em;color:#06a; border:0;}#xsnazzy p {padding-bottom:0.5em;}#xsnazzy h2 {padding-top:0.5em;}#xsnazzy {background: transparent; margin:1em;}.xtop, .xbottom {display:block; background:transparent; font-size:1px;}.xb1, .xb2, .xb3, .xb4 {display:block; overflow:hidden;}.xb1, .xb2, .xb3 {height:1px;}.xb2, .xb3, .xb4 {background:#ccc; border-left:1px solid #08c; border-right:1px solid #08c;}.xb1 {margin:0 5px; background:#08c;}.xb2 {margin:0 3px; border-width:0 2px;}.xb3 {margin:0 2px;}.xb4 {height:2px; margin:0 1px;}.xboxcontent {display:block; background:#ccc; border:0 solid #08c; border-width:0 1px;}&lt;/style&gt;&lt;div id=&quot;xsnazzy&quot;&gt;&lt;b class=&quot;xtop&quot;&gt;&lt;b class=&quot;xb1&quot;&gt;&lt;/b&gt;&lt;b class=&quot;xb2&quot;&gt;&lt;/b&gt;&lt;b class=&quot;xb3&quot;&gt;&lt;/b&gt;&lt;b class=&quot;xb4&quot;&gt;&lt;/b&gt;&lt;/b&gt;&lt;div class=&quot;xboxcontent&quot;&gt;&lt;h1&gt;Snazzy Borders&lt;/h1&gt;&lt;p&gt;Based on Nifty Corners By Alessandro Fulciniti&lt;br /&gt;http://pro.html.it/esempio/nifty/&lt;/p&gt;&lt;/div&gt;&lt;b class=&quot;xbottom&quot;&gt;&lt;b class=&quot;xb4&quot;&gt;&lt;/b&gt;&lt;b class=&quot;xb3&quot;&gt;&lt;/b&gt;&lt;b class=&quot;xb2&quot;&gt;&lt;/b&gt;&lt;b class=&quot;xb1&quot;&gt;&lt;/b&gt;&lt;/b&gt;&lt;/div&gt;需要看效果的可以复制到本地,保存为HTML格式,打开就可以看到效果了..
