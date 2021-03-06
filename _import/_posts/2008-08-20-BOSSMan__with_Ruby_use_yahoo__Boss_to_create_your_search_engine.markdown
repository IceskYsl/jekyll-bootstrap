---
layout: post
title: ! 'BOSSMan: 用Ruby利用yahoo！Boss打造自己的搜索引擎'
date: '2008-8-20'
comments: true
categories: Ruby&Rails
link: true
---
yahoo的<a href="http://developer.yahoo.com/search/boss/">BOSS web</a>服务比之前Yahoo! Search API更加方便灵活，取消了诸多限制，比如检索的次数等等，其介绍如下：
<blockquote>BOSS (Build your Own Search Service) is Yahoo!'s open search web services platform. The goal of BOSS is simple: to foster innovation in the search industry. Developers, start-ups, and large Internet companies can use BOSS to build and launch web-scale search products that utilize the entire Yahoo! Search index. BOSS gives you access to Yahoo!'s investments in crawling and indexing, ranking and relevancy algorithms, and powerful infrastructure. By combining your unique assets and ideas with our search technology assets, BOSS is a platform for the next generation of search innovation, serving hundreds of millions of users across the Web.</blockquote>
<img src="http://l.yimg.com/a/i/ydn/boss/boss_info4.gif" alt="" />
Jay Pignata已经用Ruby写了一个类库<a href="http://github.com/jpignata/bossman-gem/tree/master">BOSSMan</a>,使用非常方便，步骤如下：
<strong>1、安装gem</strong>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>gem sources -a http://gems.github.com  </span></span></li>
	<li><span>gem install jpignata-bossman
</span></li>
</ol>
</div>
<strong>2、编写代码</strong>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>require </span><span class="string">'rubygems'</span><span>  </span></span></li>
	<li><span>require <span class="string">'bossman'</span><span>  </span></span></li>
	<li class="alt"><span>include BOSSMan  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>BOSSMan.application_id = <span class="string">"Your Application ID here"</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>news = BOSSMan::Search.news(<span class="string">"IceskYsl"</span><span>, 0, 3)  </span></span></li>
	<li><span>news.results.<span class="keyword">each</span><span> </span><span class="keyword">do</span><span> |result|  </span></span></li>
	<li class="alt"><span>  puts <span class="string">"#{result.title} [from #{result.source}]"</span><span>  </span></span></li>
	<li><span><span class="keyword">end</span><span>   </span></span></li>
</ol>
</div>
<strong>参考文档：</strong>
BOSSMan: Build Your Own Search Engine With Yahoo And Ruby： <a class="tpc" href="http://www.rubyinside.com/ruby-and-yahoo-boss-with-bossman-1047.html" rel="nofollow external">http://www.rubyinside.com/ruby-and-yahoo-boss-with-bossman-1047.html</a>
插件BOSSman：<a class="tpc" href="http://github.com/jpignata/bossman-gem/tree/master" rel="nofollow external">http://github.com/jpignata/bossman-gem/tree/master</a>
看视频介绍：<a class="tpc" href="http://developer.yahoo.com/search/boss/" rel="nofollow external">http://developer.yahoo.com/search/boss/</a>
