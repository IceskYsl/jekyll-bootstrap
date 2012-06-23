---
layout: post
title: 关于Ruby的Hash和Array的遍历
date: '2007-11-12'
comments: true
categories: Ruby&Rails
link: true
---
<p>Hach遍历：<br />
&nbsp;&nbsp; h = { &quot;我&quot; =&gt;&quot; 谁呀&quot; , &quot;b&quot; =&gt; 200 }<br />
&nbsp;&nbsp; h.each {|key, value| puts &quot;#{key} is #{value}&quot; }</p>
<p>数组遍历：</p>
<p>&nbsp;&nbsp; b = [ &quot;a&quot;, &quot;b&quot;, &quot;c&quot; ]<br />
&nbsp;&nbsp; b.each_with_index{|value, index| puts index.to_s + &quot; - &quot; + value.to_s}<br />
&nbsp;&nbsp; <br />
&nbsp;&nbsp; for i in 0...b.size<br />
&nbsp;&nbsp; puts i.to_s + '---'&nbsp; + b[i].to_s<br />
&nbsp;&nbsp; end</p>
