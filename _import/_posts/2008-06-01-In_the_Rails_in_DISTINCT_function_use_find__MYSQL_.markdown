---
layout: post
title: 在Rails的find中使用DISTINCT功能(MYSQL)
date: '2008-6-1'
comments: true
categories: Ruby&Rails
link: true
---
<p>有的时候需要在SQL里面加上<strong>distinck</strong>来过滤一些重复的记录，使用SQL比较好写，但是在Rails的API里面并没有找到DISTINCK的参数，于是google了一把，看到不少人有类似的需求，最后找到方案，整理如下：<br />
<strong>1、使用:select</strong></p>
<pre style="padding-top: 0pt; padding-bottom: 0pt;"><em>Item.find( :all, :select =&gt; 'DISTINCT fieldname1,filename2,filename3' )</em>,这里就可以使用DISTINCT参数但是你可能很郁闷的发现，这<br />样select出来的结果并不完全符合您的要求或者预想，呵呵。<br /><br /><strong>2、加上:group参数</strong><br />前面说的，如果只有<strong>:select</strong>参数，这样出来的结果可能会让你郁闷的发现，并不是您的预期，原因是前面的:select会对<br />&ldquo;fieldname1,filename2,filename3&rdquo;做DISTINCT，所有不满足您的预期;<br />我们可以再加上group参数即可，类似语句如下：<br /><em>Item.find( :all, :select =&gt; 'DISTINCT fieldname1,filename2,filename3' ,:group =&gt; 'fieldname1')</em><br /><br />最后还要说下这个<strong>:select</strong>参数，他可以很好的提高性能，因为在Rails中的find会把所有字段都select出来，如果遇到大字<br />段会很影像性能的，所有在必要的时候，最好是用:select限制下要取出的列。<br /><br />参考：<br />1、<a href="http://www.geekskillz.com/articles/11  ">Using :select in Rails for Better Performance</a> （这篇文章详细的说了使用select来提高性能）<br />2、<a href="http://www.5do8.com/blog/doc/479/index.aspx">说Mysql的distinct语句和group by，order by </a> (这篇文章说了distinct、group by和order by的关系){% endcodeblock %}
