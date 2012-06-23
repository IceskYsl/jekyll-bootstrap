---
layout: post
title: ! '[Rails]2.2版本即将来临，新功能提前看(一)'
date: '2008-9-8'
comments: true
categories: Ruby&Rails
link: true
---
前面一篇文章“<a href="../../../?action=show&amp;id=382">Rails 2.1.1发布，包括众多更新</a>”说到“<em>Rails2.1.1版本发布，修复了前面说到的<a href="../../../?action=show&amp;id=362">REXML的漏洞</a>，其他都是一些小修小补，不值一提，但是令人期待的是后续的Rails2.2版本</em>”，今天看到Ryan已经陆续的介绍Rails2.2中的新特性。
<strong>1、Shallow Routes</strong>
以前在routing里写嵌套的资源为：
<div class="codeText">
<div class="codeHead">routing写法</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>map.resources </span><span class="symbol">:users</span><span> </span><span class="keyword">do</span><span> |user|  </span></span></li>
	<li><span>  user.resources <span class="symbol">:articles</span><span> </span><span class="keyword">do</span><span> |article|  </span></span></li>
	<li class="alt"><span>    article.resourcs <span class="symbol">:comments</span><span>  </span></span></li>
	<li><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
将使得对articles和comments的引用只能是如下格式 /users/1/articles、/users/1/articles/1/comments这样的URL，如果想直接引用资源，就有问题了，在Rails2.2中奖引入一个新的特性shallow route option，可以增加这个功能，routing写法为：
<div class="codeText">
<div class="codeHead">routing写法</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>map.resources </span><span class="symbol">:users</span><span>, </span><span class="symbol">:shallpow</span><span> =&gt; </span><span class="keyword">true</span><span> </span><span class="keyword">do</span><span> |user|  </span></span></li>
	<li><span>  user.resources <span class="symbol">:articles</span><span> </span><span class="keyword">do</span><span> |article|  </span></span></li>
	<li class="alt"><span>    article.resourcs <span class="symbol">:comments</span><span>  </span></span></li>
	<li><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
上面这个写法将保留以前的资源引用格式，同时增加如下的引用方法：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>articles_path </span><span class="comment">#=&gt; '/articles'  </span><span>  </span></span></li>
	<li><span>comments_path <span class="comment">#=&gt; '/comments'  </span><span>  </span></span></li>
	<li class="alt"><span>article_comments_path(<span class="variable">@article</span><span>) </span><span class="comment">#=&gt; '/articles/1/comments'  </span><span>  </span></span></li>
</ol>
</div>
详细参考：<a href="http://ryandaigle.com/articles/2008/9/7/what-s-new-in-edge-rails-shallow-routes">What's New in Edge Rails: Shallow Routes</a>

<strong>2、Mailer Layouts</strong>
在Rails2.2中将加入Mailer布局模板，就像view-template一样，每个mailer可以有一个模板，其默认的是mailer加上<strong><em>_mailer</em></strong>后缀，比如下面：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="keyword">class</span><span> UserMailer &lt; ActionMailer::Base  </span></span></li>
	<li><span>  <span class="keyword">def</span><span> registration(user)  </span></span></li>
	<li class="alt"><span>    subject    <span class="string">"You've registered"</span><span>  </span></span></li>
	<li><span>    from       <span class="string">"system@example.com"</span><span>  </span></span></li>
	<li class="alt"><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
将会自动匹配layouts/user_mailer.html.erb这个布局模板 。当然，你也可以自己手工指定其对应的模板，如下：
<div class="codeText">
<div class="codeHead">手工指定模板</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="keyword">class</span><span> UserMailer &lt; ActionMailer::Base  </span></span></li>
	<li><span>  layout <span class="string">'email'</span><span>  </span></span></li>
	<li class="alt"><span>  ...  </span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
参考：<a href="http://ryandaigle.com/articles/2008/9/7/what-s-new-in-edge-rails-mailer-layouts">What's New in Edge Rails: Mailer Layouts</a>

<strong>3、Connection Pools</strong>
前面说过，在Rails2.2中将会实现线程安全，如此以来，连接池的实现也就不在话下了，在Rails2.2中将增加连接池的特性，使用方法非常简单，直接在database.yml配置即可，如下：
<div class="codeText">
<div class="codeHead">database.yml</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span>development:  </span></span></li>
	<li><span>  adapter: mysql  </span></li>
	<li class="alt"><span>  username: root  </span></li>
	<li><span>  database: myapp_dev  </span></li>
	<li class="alt"><span>  <span style="color: #ff0000;">pool: 10 </span> </span></li>
</ol>
</div>
这个特性将极大的提高Rails的性能，非常值得期待。另外，还记得前面我们介绍过的“<a href="../../../?action=show&amp;id=380">NeverBlock到底有多快,对比测试说明问题</a> ”么，同样值得期待。更多特性还有待慢慢介绍。
参考：<a href="http://ryandaigle.com/articles/2008/9/7/what-s-new-in-edge-rails-connection-pools"> What's New in Edge Rails: Connection Pools</a>
