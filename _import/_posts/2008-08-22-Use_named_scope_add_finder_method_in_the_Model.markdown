---
layout: post
title: 使用named_scope在Model中添加finder方法
date: '2008-8-22'
comments: true
categories: Ruby&Rails
link: true
---
在<a href="http://www.rubyfleebie.com/use-named_scope-to-add-elegant-finders-to-your-models/">rubyfleebie</a>上看到这篇文章，里面有个不错的技巧，在Rails 2.1中添加了named_scope特性，看下面这个例子：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="keyword">class</span><span> Story &lt; ActiveRecord::Base  </span></span></li>
	<li><span>  named_scope <span class="symbol">:hilarious</span><span>, </span><span class="symbol">:conditions</span><span> =&gt; [</span><span class="string">"type = ?"</span><span>,</span><span class="string">"comedy"</span><span>]  </span></span></li>
	<li class="alt"><span>  named_scope <span class="symbol">:popular</span><span>, </span><span class="symbol">:conditions</span><span> =&gt; [</span><span class="string">"popularity_level &gt; ?"</span><span>, 3]  </span></span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
使用方法如下：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>funny_stories = </span><span class="variable">@all_stories</span><span>.hilarious  </span></span></li>
	<li><span>funny_and_popular = <span class="variable">@all_stories</span><span>.hilarious.popular  </span></span></li>
</ol>
</div>
很好很强大。
