---
layout: post
title: 关于Ruby中对正则表达式中的特殊字符转义的疑惑
date: '2008-3-12'
comments: true
categories: Ruby&Rails
link: true
---
<p>转义正则表达式中的特殊字符<br />
===========================================<br />
使用Regexp.<strong>escape</strong>方法(别名方法是Regexp.<strong>quote</strong>)，可以把正则表达式中的特殊字符统统转义：<br />
str1 = &quot;[*?]&quot;<br />
str2 = Regexp.escape(str1)    # &quot;\[\*\?\]&quot;<br />
<br />
escape会转义掉[*?]这几个特殊的字符，但是其没有对另外一个字符<strong>&lsquo;/&rsquo;</strong>进行任何处理，这个作为正则表达式的分隔符(//)中的字符难道不是特殊字符么。<br />
<br />
<strong> 看个例子：</strong><br />
pages=&quot;http://www.taojer.com/id=1&amp;name=help&quot;<br />
puts Regexp.escape(pages)<br />
<br />
<strong> 输出：</strong><br />
E:\Ysl\Test&gt;ruby exp.rb<br />
http://www\.taojer\.com/id=1&amp;name=help<br />
<br />
可以看到其对/字符是没有进行处理的。<br />
<br />
这个可能会给如下这个需求带来一些问题：<br />
我想在一段String中找到所有以一个指定的URL开头的链接地址，程序大概是这样的：<br />
url=&quot;http://www.taojer.com&quot;<br />
按照我们的思路，可能会这么写：<br />
e_url = Regexp.escape(url)<br />
==》http://www\.taojer\.com<br />
str.scan(/&lt;a href=&quot;(e_url)&quot;&gt;(.+?)&lt;\/a&gt;/m)<br />
但是这样就会因为/字符存在而异常咯？<br />
<br />
正确是应该是：<br />
str.scan(/&lt;a href=&quot;(http:\/\/www\.taojer\.com)&quot;&gt;(.+?)&lt;\/a&gt;/m).each do |list|<br />
#do something<br />
end<br />
<br />
按照规定：<br />
特殊字符包括^、$、?、.、/、\、[、]、{、}、(、)、+、*、<br />
为什么这个方法不转义<strong>/</strong>呢？<br />
有啥子高招，解决这个问题？<br />
参考：<br />
http://chinaonrails.com/topic/view/1418.html<br />
http://www.ruby-doc.org/core/classes/Regexp.html#M001227</p>
<p>http://lzj520.javaeye.com/blog/143223</p>
