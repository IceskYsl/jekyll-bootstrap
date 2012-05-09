--- 
layout: post
comments: true
title: "[Rails Plugins]dnsbl_check\xE8\xBF\x87\xE6\xBB\xA4\xE6\x9D\xA5\xE6\xBA\x90IP"
date: 2008-8-15
link: false
categories: life
---
<a href="http://spacebabies.nl/dnsbl_check/">dnsbl_check</a>是个很有意思的插件，它其实就是一个前置过滤器，在请求第一次到来的时候，会根据<a href="http://en.wikipedia.org/wiki/DNSBL">DNS Blackhole Lists</a>来判断来源IP是否合法，如果合法，放行，并在其session中标识已经被checked，而后再来源就不会再去校验（省了不少资源）；如果来源IP在DBL内，就会显示“Access denied”页面，同时阻止其进一步访问。

安装和使用：
<ol>
	<li>在Rails项目的根目录下执行"script/plugin install http://www.spacebabies.nl/svn/<strong style="color: black; background-color: #ffff66;">dnsbl_check</strong>" ；</li>
	<li>在需要早检查的controllers 中添加"before_filter :<strong style="color: black; background-color: #ffff66;">dnsbl_check</strong>" ；</li>
	<li>重启应用程序.</li>
</ol>
在 vendor/plugins 目录下需要包含如下结构文件：

&lt;site name&gt;/vendor/plugins/dnsbl_check/
|-- 403.html
|-- README
|-- init.rb
|-- install.rb
`-- lib
`-- dnsbl_check.rb

<strong>代码示例：</strong>
{% codeblock %}{% endcodeblock %}
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="keyword">class</span><span> CommentsController &lt; ApplicationController  </span></span></li>
	<li><span>  before_filter <span class="symbol">:dnsbl_check</span><span>  </span></span></li>
	<li class="alt"><span>  </span></li>
	<li><span>  <span class="comment"># Let users submit comments.</span><span>  </span></span></li>
	<li class="alt"><span>  <span class="keyword">def</span><span> submit  </span></span></li>
	<li><span>    ...  </span></li>
	<li class="alt"><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
<strong>参考：</strong>
http://agilewebdevelopment.com/plugins/rbl_check
http://spacebabies.nl/dnsbl_check/
http://spacebabies.nl/svn/dnsbl_check/

PS：其主页貌似无法访问了，不晓得哪里有代码下载。
