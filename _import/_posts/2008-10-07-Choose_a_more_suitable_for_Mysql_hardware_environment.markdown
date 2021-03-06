---
layout: post
title: 为Mysql选择更加合适的硬件环境
date: '2008-10-7'
comments: true
categories: Database
link: true
---
记得前段时间，博文的一个朋友做一本Mysql技术书籍时，将其策划的大纲给我看，我提出让他增加一章关于Mysql硬件选择的内容，因为Mysql的性能受硬件影响很大，如何选择一套比较合适的硬件环境相当重要，自然，他接受了我的建议。
只是不知道他策划的这本书何时才能编写完成，不过在<a href="http://en.oreilly.com/mysql2008/public/content/home">2008 MySQL Conference &amp; Expo</a>上，确实看到一篇“<a href="http://en.oreilly.com/mysql2008/public/schedule/detail/2292">Scaling Out MySQL: Hardware Today and Tomorrow</a>”，其<a href="http://www.scribd.com/doc/2569227/Scaling-out-MySQL-Hardware-today-and-tomorrow">Doc</a>已经可以在scribd上看到了，嵌到这里。

<object id="doc_553508041949909" width="100%" height="500" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"><param name="quality" value="high" /><param name="play" value="true" /><param name="loop" value="true" /><param name="scale" value="showall" /><param name="wmode" value="opaque" /><param name="devicefont" value="false" /><param name="menu" value="true" /><param name="allowFullScreen" value="true" /><param name="allowScriptAccess" value="always" /><param name="salign" value="" /><param name="src" value="http://documents.scribd.com/ScribdViewer.swf?document_id=2569227&amp;access_key=key-1oxw4alcnm1fikb5hoie&amp;page=&amp;version=1&amp;auto_size=true&amp;viewMode=" /><param name="pluginspage" value="http://www.macromedia.com/go/getflashplayer" /><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><embed id="doc_553508041949909" width="100%" height="500" type="application/x-shockwave-flash" src="http://documents.scribd.com/ScribdViewer.swf?document_id=2569227&amp;access_key=key-1oxw4alcnm1fikb5hoie&amp;page=&amp;version=1&amp;auto_size=true&amp;viewMode=" quality="high" play="true" loop="true" scale="showall" wmode="opaque" devicefont="false" menu="true" allowFullScreen="true" allowScriptAccess="always" salign="" pluginspage="http://www.macromedia.com/go/getflashplayer" allowfullscreen="true" allowscriptaccess="always" /></object>
<div style="font-size: 10px; text-align: center; width: 100%;"><a href="http://www.scribd.com/doc/2569227/Scaling-out-MySQL-Hardware-today-and-tomorrow">Scaling out MySQL - Hardware today and tomorrow</a> - <a href="http://www.scribd.com/upload">Upload a Document to Scribd</a></div>
其内容大致涉及到CPU，Mem，vendor，storage等方面的选择，摘取几条如下：
<ul>
	<li>CPU还是选64位的吧（为了支持更大的内存），Mysql在多核CPU上有些问题；</li>
	<li>内存越大越好，反正很便宜，但是关于内存的配置使用还是很有学问的；</li>
	<li>硬盘最后是选择15K而不是10K的，在这上面多花点钱是非常值得的；</li>
</ul>
其他的大家看Doc里面的总结吧，总结好了别忘记share给我哈。

参考：http://www.dbanotes.net/database/mysql_hardware.html
