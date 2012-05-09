--- 
layout: post
comments: true
title: !binary |
  5L2/55SoUmFpbHPlnKhNeVNRTOeahOWkp+ihqOS4rWFkZF9jb2x1bW7lvojm
  haLnmoTpl67popgh

date: 2008-6-12
link: false
categories: life
---
<p>项目使用Rails开发，DB采用的是MySQL，有一个不算复杂的表A，记录数差不多50W条数据，现在想增加一个列属性，于是很自然的想到Rails中的<a href="http://www.railsbrain.com/api/rails-1.2.3/doc/index.html?a=M001173&amp;name=add_column">add_column</a>，然后rake迁移数据，但是等了很久未见执行完毕，诡异。<br />
初步判断是由于表里的记录太多了，查下add_column是怎杨的，如下：</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="comment">#&nbsp;File&nbsp;activerecord/lib/active_record/connection_adapters/abstract/schema_statements.rb,&nbsp;line&nbsp;121</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>121:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;add_column(table_name,&nbsp;column_name,&nbsp;type,&nbsp;options&nbsp;=&nbsp;{})&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>122:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;add_column_sql&nbsp;=&nbsp;<span class="string">&quot;ALTER&nbsp;TABLE&nbsp;#{table_name}&nbsp;ADD&nbsp;#{quote_column_name(column_name)}&nbsp;#{type_to_sql(type,&nbsp;options[:limit],&nbsp;options[:precision],&nbsp;options[:scale])}&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>123:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;add_column_options!(add_column_sql,&nbsp;options)&nbsp;&nbsp;</span></li>
    <li class="alt"><span>124:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;execute(add_column_sql)&nbsp;&nbsp;</span></li>
    <li class=""><span>125:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>恩，挺直接的，就是：<br />
<span><span class="string"><strong>ALTER&nbsp;TABLE table_name ADD column_name </strong>，貌似没啥问题，看来是MySQL的问题，和Rails无关，Google下资料，发现&ldquo;<a href="http://forums.mysql.com/read.php?21,158101,158101#msg-158101">change index or add column in a very big table</a>&rdquo;和我遇到的问题基本一致，但是其回复中并没有说道如何解决或者如何提升性能。<br />
继续Google，找到&ldquo;<a href="http://www.mysqlperformanceblog.com/2006/06/09/why-mysql-could-be-slow-with-large-tables/#comment-1778">Why MySQL could be slow with large tables ?</a>&rdquo;这篇文章，谈到了为什么说MySQL在大表的时候会很慢，其观点是和表的结构设计有关。其有人回复说&ldquo;<em>I have a table with 35 mil records. When I wanted to add a column (alter table) I would take about 2 days.</em>&rdquo;，和我的问题一致，这个文章很好，建议各位有时间的仔细看看。<br />
但是我的这个数据表结构并不复杂，如何能提升其速度呢，还在研究中，有了思路会再更新上来。<br />
</span></span></p>
