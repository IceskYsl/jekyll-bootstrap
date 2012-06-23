---
layout: post
title: 用Ruby实现抓取ATOM格式的feed～
date: '2007-12-7'
comments: true
categories: Ruby&Rails
link: true
---
<p>前几天写完了技能云上抓取用户RSS2.0的feed的功能，紧接着需要实现抓取ATOM格式的，如下是随手做的几个小测试，代码如下：</p>
<p>&nbsp;require 'hpricot'<br />
&nbsp;require 'open-uri'<br />
&nbsp;<br />
doc = open(&quot;http://gigix.thoughtworkers.org/feed/atom.xml&quot;) do |f|<br />
&nbsp;&nbsp; Hpricot.XML(f)<br />
&nbsp;end<br />
&nbsp;<br />
puts rel = doc.search(&quot;//feed&quot;).first[:xmlns].downcase<br />
&nbsp;<br />
&nbsp;puts root = doc.root.name<br />
&nbsp;<br />
puts feed_title = (doc/:feed/:title).first.inner_html<br />
puts feed_id = (doc/:feed/:id).first.inner_html<br />
puts rel = doc.search(&quot;//link[@rel='alternate']&quot;).first[:href].downcase<br />
puts rel = doc.search(&quot;//link[@rel='self']&quot;).first[:href].downcase<br />
puts feed_generator = (doc/:feed/:generator).first.inner_html<br />
puts feed_rights = (doc/:feed/:rights).first.inner_html<br />
<br />
puts feed_updated = (doc/:feed/:updated).first.inner_html<br />
puts feed_link = (doc/:feed/:link).first[:href].downcase<br />
puts feed_link = (doc/:feed/:link).first[:href].downcase<br />
&nbsp;<br />
<br />
&nbsp;(doc/:entry).each do |item|<br />
&nbsp;#puts author = (item/:author/:name).inner_html<br />
&nbsp;&nbsp; #puts title = (item/:title).inner_html<br />
&nbsp;&nbsp; #puts link = (item/:link).first[:href].downcase<br />
&nbsp; # rel = doc.search(&quot;//link[@rel='alternate']&quot;).first[:href].downcase<br />
&nbsp;&nbsp; #puts id = (item/:id).inner_html<br />
&nbsp;&nbsp; #puts date = (item/:published).inner_html<br />
&nbsp;&nbsp; #puts updated = (item/:updated).inner_html<br />
&nbsp;&nbsp; #puts content = (item/:content).inner_html<br />
&nbsp;end</p>
