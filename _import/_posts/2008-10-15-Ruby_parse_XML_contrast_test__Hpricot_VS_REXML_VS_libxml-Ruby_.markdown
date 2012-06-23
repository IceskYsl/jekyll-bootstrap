---
layout: post
title: Ruby解析XML对比测试(Hpricot VS REXML VS   libxml-ruby)
date: '2008-10-15'
comments: true
categories: Ruby&Rails
tags: ruby xml
link: true
---
Ruby可以很方便的解析XML格式的文档，目前用的比较多的lib主要有三个，分别是：<a href="http://www.ruby-doc.org/stdlib/libdoc/rexml/rdoc/index.html"><span class="caps">REXML</span></a>, <a href="http://code.whytheluckystiff.net/hpricot/">Hpricot</a>, <a href="http://libxml.rubyforge.org/">libxml-ruby</a>，如下选取两个XML文档，分别使用这三个lib解析，感受下各自的速度和易用性。
<strong>一、原料</strong>
<ul>
	<li><a href="http://railstips.org/assets/2008/8/9/posts.xml">posts.xml</a> – Uses xml element for object (post) and xml attributes for object attributes</li>
	<li><a href="http://railstips.org/assets/2008/8/9/timeline.xml">timeline.xml</a> – Uses xml element for object (status) and child xml elements for attributes</li>
</ul>
<strong>二、解析过程</strong>
<strong>1、REXML</strong>

<strong>Pros:</strong> In the standard library
<strong>Cons:</strong> Slow, I don’t like the name
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>%w[benchmark pp rexml/document].</span><span class="keyword">each</span><span> { |x| require x }  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span><span class="comment">##################################</span><span>  </span></span></li>
	<li><span><span class="comment"># Parsing Delicious API Response #</span><span>  </span></span></li>
	<li class="alt"><span><span class="comment">##################################</span><span>  </span></span></li>
	<li><span>xml = <span class="builtin">File</span><span>.read(</span><span class="string">'posts.xml'</span><span>)  </span></span></li>
	<li class="alt"><span>puts Benchmark.measure {  </span></li>
	<li><span>  doc, posts = REXML::Document.<span class="keyword">new</span><span>(xml), []  </span></span></li>
	<li class="alt"><span>  doc.elements.<span class="keyword">each</span><span>(</span><span class="string">'posts/post'</span><span>) </span><span class="keyword">do</span><span> |p|  </span></span></li>
	<li><span>    posts &lt;&lt; p.attributes  </span></li>
	<li class="alt"><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li><span>  <span class="comment"># pp posts</span><span>  </span></span></li>
	<li class="alt"><span>}  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span><span class="comment">################################</span><span>  </span></span></li>
	<li><span><span class="comment"># Parsing Twitter API Response #</span><span>  </span></span></li>
	<li class="alt"><span><span class="comment">################################</span><span>  </span></span></li>
	<li><span>xml = <span class="builtin">File</span><span>.read(</span><span class="string">'timeline.xml'</span><span>)  </span></span></li>
	<li class="alt"><span>puts Benchmark.measure {  </span></li>
	<li><span>  doc, statuses = REXML::Document.<span class="keyword">new</span><span>(xml), []  </span></span></li>
	<li class="alt"><span>  doc.elements.<span class="keyword">each</span><span>(</span><span class="string">'statuses/status'</span><span>) </span><span class="keyword">do</span><span> |s|  </span></span></li>
	<li><span>    h = {<span class="symbol">:user</span><span> =&gt; {}}  </span></span></li>
	<li class="alt"><span>    %w[created_at id text source truncated in_reply_to_status_id in_reply_to_user_id favorited].<span class="keyword">each</span><span> </span><span class="keyword">do</span><span> |a|  </span></span></li>
	<li><span>      h[a.intern] = s.elements[a].text  </span></li>
	<li class="alt"><span>    <span class="keyword">end</span><span>  </span></span></li>
	<li><span>    %w[id name screen_name location description profile_image_url url protected followers_count].<span class="keyword">each</span><span> </span><span class="keyword">do</span><span> |a|  </span></span></li>
	<li class="alt"><span>      h[<span class="symbol">:user</span><span>][a.intern] = s.elements[</span><span class="string">'user'</span><span>].elements[a].text  </span></span></li>
	<li><span>    <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>    statuses &lt;&lt; h  </span></li>
	<li><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>  <span class="comment"># pp statuses</span><span>  </span></span></li>
	<li><span>}  </span></li>
</ol>
</div>
{% codeblock %}<code class="ruby"><strong>2、Hpricot</strong>{% endcodeblock %}<strong>Pros:</strong> Cool name, created by _why, faster than <span class="caps">REXML</span>, also does <span class="caps">HTML</span>, creative <span class="caps">API</span><strong>Cons:</strong> Not as fast as libxml-ruby, more of an <span class="caps">HTML</span> parser linguistically (ie: uses innerHTML instead of text or content, etc.){% endcodeblock %}
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>%w[benchmark pp rubygems].</span><span class="keyword">each</span><span> { |x| require x }  </span></span></li>
	<li><span>gem <span class="string">'hpricot'</span><span>, </span><span class="string">'&gt;= 0.6'</span><span>  </span></span></li>
	<li class="alt"><span>require <span class="string">'hpricot'</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span><span class="comment">##################################</span><span>  </span></span></li>
	<li><span><span class="comment"># Parsing Delicious API Response #</span><span>  </span></span></li>
	<li class="alt"><span><span class="comment">##################################</span><span>  </span></span></li>
	<li><span>xml = <span class="builtin">File</span><span>.read(</span><span class="string">'posts.xml'</span><span>)  </span></span></li>
	<li class="alt"><span>puts Benchmark.measure {  </span></li>
	<li><span>  doc, posts = Hpricot::XML(xml), []  </span></li>
	<li class="alt"><span>  (doc/<span class="symbol">:post</span><span>).</span><span class="keyword">each</span><span> </span><span class="keyword">do</span><span> |p|  </span></span></li>
	<li><span>    posts &lt;&lt; p.attributes  </span></li>
	<li class="alt"><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li><span>  <span class="comment"># pp posts</span><span>  </span></span></li>
	<li class="alt"><span>}  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span><span class="comment">################################</span><span>  </span></span></li>
	<li><span><span class="comment"># Parsing Twitter API Response #</span><span>  </span></span></li>
	<li class="alt"><span><span class="comment">################################</span><span>  </span></span></li>
	<li><span>xml = <span class="builtin">File</span><span>.read(</span><span class="string">'timeline.xml'</span><span>)  </span></span></li>
	<li class="alt"><span>puts Benchmark.measure {  </span></li>
	<li><span>  doc, statuses = Hpricot::XML(xml), []  </span></li>
	<li class="alt"><span>  (doc/<span class="symbol">:status</span><span>).</span><span class="keyword">each</span><span> </span><span class="keyword">do</span><span> |s|  </span></span></li>
	<li><span>    h = {<span class="symbol">:user</span><span> =&gt; {}}  </span></span></li>
	<li class="alt"><span>    %w[created_at id text source truncated in_reply_to_status_id in_reply_to_user_id favorited].<span class="keyword">each</span><span> </span><span class="keyword">do</span><span> |a|  </span></span></li>
	<li><span>      h[a.intern] = s.at(a).innerHTML  </span></li>
	<li class="alt"><span>    <span class="keyword">end</span><span>  </span></span></li>
	<li><span>    %w[id name screen_name location description profile_image_url url protected followers_count].<span class="keyword">each</span><span> </span><span class="keyword">do</span><span> |a|  </span></span></li>
	<li class="alt"><span>      h[<span class="symbol">:user</span><span>][a.intern] = s.at(</span><span class="string">'user'</span><span>).at(a).innerHTML  </span></span></li>
	<li><span>    <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>    statuses &lt;&lt; h  </span></li>
	<li><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>  <span class="comment"># pp statuses</span><span>  </span></span></li>
	<li><span>}  </span></li>
</ol>
</div>
<strong>3、libxml-ruby </strong>

<strong>Pros:</strong> Blistering fast
<strong>Cons:</strong> Hpricot has cooler name, <span class="caps">REXML</span> and Hpricot both feel easier to use out of the box
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>%w[benchmark pp rubygems].</span><span class="keyword">each</span><span> { |x| require x }  </span></span></li>
	<li><span>gem <span class="string">'libxml-ruby'</span><span>, </span><span class="string">'&gt;= 0.8.3'</span><span>  </span></span></li>
	<li class="alt"><span>require <span class="string">'xml'</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span><span class="comment">##################################</span><span>  </span></span></li>
	<li><span><span class="comment"># Parsing Delicious API Response #</span><span>  </span></span></li>
	<li class="alt"><span><span class="comment">##################################</span><span>  </span></span></li>
	<li><span>xml = <span class="builtin">File</span><span>.read(</span><span class="string">'posts.xml'</span><span>)  </span></span></li>
	<li class="alt"><span>puts Benchmark.measure {  </span></li>
	<li><span>  parser, parser.string = XML::Parser.<span class="keyword">new</span><span>, xml  </span></span></li>
	<li class="alt"><span>  doc, posts = parser.parse, []  </span></li>
	<li><span>  doc.find(<span class="string">'//posts/post'</span><span>).</span><span class="keyword">each</span><span> </span><span class="keyword">do</span><span> |p|  </span></span></li>
	<li class="alt"><span>    posts &lt;&lt; p.attributes.inject({}) { |h, a| h[a.name] = a.value; h }  </span></li>
	<li><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>  <span class="comment"># pp posts</span><span>  </span></span></li>
	<li><span>}  </span></li>
	<li class="alt"><span>  </span></li>
	<li><span><span class="comment">################################</span><span>  </span></span></li>
	<li class="alt"><span><span class="comment"># Parsing Twitter API Response #</span><span>  </span></span></li>
	<li><span><span class="comment">################################</span><span>  </span></span></li>
	<li class="alt"><span>xml = <span class="builtin">File</span><span>.read(</span><span class="string">'timeline.xml'</span><span>)  </span></span></li>
	<li><span>puts Benchmark.measure {  </span></li>
	<li class="alt"><span>  parser, parser.string = XML::Parser.<span class="keyword">new</span><span>, xml  </span></span></li>
	<li><span>  doc, statuses = parser.parse, []  </span></li>
	<li class="alt"><span>  doc.find(<span class="string">'//statuses/status'</span><span>).</span><span class="keyword">each</span><span> </span><span class="keyword">do</span><span> |s|  </span></span></li>
	<li><span>    h = {<span class="symbol">:user</span><span> =&gt; {}}  </span></span></li>
	<li class="alt"><span>    %w[created_at id text source truncated in_reply_to_status_id in_reply_to_user_id favorited].<span class="keyword">each</span><span> </span><span class="keyword">do</span><span> |a|  </span></span></li>
	<li><span>      h[a.intern] = s.find(a).first.content  </span></li>
	<li class="alt"><span>    <span class="keyword">end</span><span>  </span></span></li>
	<li><span>    %w[id name screen_name location description profile_image_url url protected followers_count].<span class="keyword">each</span><span> </span><span class="keyword">do</span><span> |a|  </span></span></li>
	<li class="alt"><span>      h[<span class="symbol">:user</span><span>][a.intern] = s.find(</span><span class="string">'user'</span><span>).first.find(a).first.content  </span></span></li>
	<li><span>    <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>    statuses &lt;&lt; h  </span></li>
	<li><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>  <span class="comment"># pp statuses</span><span>  </span></span></li>
	<li><span>}  </span></li>
</ol>
</div>
{% codeblock %}<code class="ruby"><strong>三、结论</strong>{% endcodeblock %}{% endcodeblock %}
<div class="codeText">
<div class="codeHead">结果如下：</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span>=rexml  </span></span></li>
	<li><span>delicious     0.020000   0.000000   0.020000 (  0.021139)  </span></li>
	<li class="alt"><span>twitter       0.940000   0.020000   0.960000 (  0.988666)  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>=hpricot  </span></li>
	<li><span>delicious     0.010000   0.000000   0.010000 (  0.005548)  </span></li>
	<li class="alt"><span>twitter       0.250000   0.010000   0.260000 (  0.258320)  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>=libxml-ruby  </span></li>
	<li><span>delicious     0.000000   0.000000   0.000000 (  0.007829)  </span></li>
	<li class="alt"><span>twitter       0.030000   0.010000   0.040000 (  0.034040)  </span></li>
</ol>
</div>
{% codeblock %}<code class="ruby">参考文档：http://railstips.org/2008/8/12/parsing-xml-with-ruby{% endcodeblock %}{% endcodeblock %}
