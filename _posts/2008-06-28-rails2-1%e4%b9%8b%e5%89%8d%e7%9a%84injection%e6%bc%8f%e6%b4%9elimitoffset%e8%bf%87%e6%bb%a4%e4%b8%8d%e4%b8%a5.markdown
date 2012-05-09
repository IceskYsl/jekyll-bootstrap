--- 
layout: post
comments: true
title: !binary |
  UmFpbHMyLjHkuYvliY3nmoRJbmplY3Rpb27mvI/mtJ46bGltaXQsb2Zmc2V0
  6L+H5ruk5LiN5LilLg==

date: 2008-6-28
link: false
categories: life
---
现在很多人应该都开始使用Rails2.1了吧，如果你还没有升级到Rails2.1版，那么看看前段时间，我和其他几个RoRer翻译的《<a href="http://iceskysl.1sters.com/?action=show&amp;id=316">Rails 2.1中文文档翻译完成[已发布]</a>》中其所增加的新功能。如果这些新功能还不能说服你升级到Rails2.1的话，那么请接着看，在Rails2.1之前，Rails1.X和Rails2.0中都存在如下漏洞。

大家可以看看Rails2.1之前的 ActiveRecord 中，其允许在<em>:offset</em>中任意构造SQL语句，也就是说，如果可能的话，我们可以利用<em>:offset</em>来构造SQL注射<em>。</em>

&nbsp;
<div class="codeText">
<div class="codeHead"><em>Ruby代码</em></div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="comment"><em># vulnerable controller code</em></span><span><em>  </em></span></span></li>
	<li><span><em>User.find(<span class="symbol">:all</span><span>, </span><span class="symbol">:limit</span><span> =&gt; params[</span><span class="symbol">:limit</span><span>])  </span></em></span></li>
	<li class="alt"><span><em>  </em></span></li>
	<li><span><em>User.find(<span class="symbol">:all</span><span>, </span><span class="symbol">:limit</span><span> =&gt; 10, </span><span class="symbol">:offset</span><span> =&gt; params[</span><span class="symbol">:offset</span><span>])  </span></em></span></li>
	<li class="alt"><span><em>  </em></span></li>
	<li><span><span class="comment"><em># with params[:offset] or params[:limit] set to '<strong>; DROP TABLE users;</strong>'</em></span><span><em>  </em></span></span></li>
	<li class="alt"><span><span class="comment"><em># you got a big problem ...</em></span><span><em>  </em></span></span></li>
</ol>
</div>
如上<em>，</em>我们直接从<em>Http的params中取得limit或者offset参数，直接放在SQL的find中，如果在offset中构造邪恶代码的话，肯定会造成大问题。</em>

幸好，Mysql默认的是不许一次API调用执行多条SQL，但是这个问题还是存在的<em>，但是</em>PostgreSQL和 SQLite就没那么幸运了，按照上面说的，你可以自己测试下。

现在的Rails2.1版本中已经修复了PostgreSQL 和SQLite中存在的问题，但是并没有其在Mysql中存在的问题（虽然现在尚且无法利用），后面的Rails2.1.1版本中已经修复了。

参考文档：<a href="http://blog.innerewut.de/"> Why you should upgrade to Rails 2.1  0  </a>
